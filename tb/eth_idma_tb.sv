// Copyright 2022 ETH Zurich and University of Bologna.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51

`timescale 1 ns/1 ns

// axi + regbus
`include "axi/assign.svh"
`include "idma/typedef.svh"
`include "register_interface/typedef.svh"
`include "register_interface/assign.svh"

module tb_eth_idma
  import idma_pkg::*;
  import eth_idma_pkg::*; #(
  parameter int unsigned DataWidth           = 64,
  parameter int unsigned AddrWidth           = 64,
  parameter int unsigned UserWidth           = 1,
  parameter int unsigned AxiIdWidth          = 1,
  parameter int unsigned NumAxInFlight       = 3,
  parameter int unsigned BufferDepth         = 3,
  parameter int unsigned TFLenWidth          = 32,
  parameter int unsigned MemSysDepth         = 0,
  parameter bit          RAWCouplingAvail    = 0,
  parameter bit          MaskInvalidData     = 1,
  parameter bit          HardwareLegalizer   = 1,
  parameter bit          RejectZeroTransfers = 1,
  parameter bit          ErrorHandling       = 0,
);

  // timing parameters
  localparam time SYS_TCK    = 1ns;
  localparam time TCK200     = 5ns;
  localparam time TCK125     = 8ns;
  localparam time SYS_TA     = 2ns;
  localparam time SYS_TT     = 6ns;
  
  // dependent parameters
  localparam int unsigned StrbWidth       = DataWidth / 8;
  localparam int unsigned OffsetWidth     = $clog2(StrbWidth);
  
  // regbus
  localparam int unsigned REG_BUS_DW = 64;
  localparam int unsigned REG_BUS_AW = 4;
  
  // parse error handling caps
  localparam idma_pkg::error_cap_e ErrorCap = ErrorHandling ? idma_pkg::ERROR_HANDLING :
                                                                idma_pkg::NO_ERROR_HANDLING;

  // dependent typed
  typedef logic [AddrWidth-1:0]   addr_t;
  typedef logic [DataWidth-1:0]   data_t;
  typedef logic [StrbWidth-1:0]   strb_t;
  typedef logic [UserWidth-1:0]   user_t;
  typedef logic [AxiIdWidth-1:0]  id_t;
  typedef logic [OffsetWidth-1:0] offset_t;
  typedef logic [TFLenWidth-1:0]  tf_len_t;

  // AXI4+ATOP typedefs
`AXI_TYPEDEF_AW_CHAN_T(axi_aw_chan_t, addr_t, id_t, user_t)
`AXI_TYPEDEF_W_CHAN_T(axi_w_chan_t, data_t, strb_t, user_t)
`AXI_TYPEDEF_B_CHAN_T(axi_b_chan_t, id_t, user_t)

`AXI_TYPEDEF_AR_CHAN_T(axi_ar_chan_t, addr_t, id_t, user_t)
`AXI_TYPEDEF_R_CHAN_T(axi_r_chan_t, data_t, id_t, user_t)

`AXI_TYPEDEF_REQ_T(axi_req_t, axi_aw_chan_t, axi_w_chan_t, axi_ar_chan_t)
`AXI_TYPEDEF_RESP_T(axi_rsp_t, axi_b_chan_t, axi_r_chan_t)

  // Meta Channel Widths
    localparam int unsigned axi_aw_chan_width = axi_pkg::aw_width(AddrWidth, AxiIdWidth, UserWidth);
    localparam int unsigned axi_ar_chan_width = axi_pkg::ar_width(AddrWidth, AxiIdWidth, UserWidth);
    localparam int unsigned axi_stream_t_chan_width = $bits(axi_stream_t_chan_t);

    function int unsigned max_width(input int unsigned a, b);
        return (a > b) ? a : b;
    endfunction

    typedef struct packed {
        axi_ar_chan_t ar_chan;
        logic[max_width(axi_ar_chan_width, axis_t_chan_width)-axi_ar_chan_width:0] padding;
    } axi_read_ar_chan_padded_t;

    typedef struct packed {
        axis_t_chan_t t_chan;
        logic[max_width(axi_ar_chan_width, axis_t_chan_width)-axis_t_chan_width:0] padding;
    } axis_read_t_chan_padded_t;

    typedef union packed {
        axi_read_ar_chan_padded_t axi;
        axis_read_t_chan_padded_t axis;
    } read_meta_channel_t;

    typedef struct packed {
        axi_aw_chan_t aw_chan;
        logic[max_width(axi_aw_chan_width, axis_t_chan_width)-axi_aw_chan_width:0] padding;
    } axi_write_aw_chan_padded_t;

    typedef struct packed {
        axis_t_chan_t t_chan;
        logic[max_width(axi_aw_chan_width, axis_t_chan_width)-axis_t_chan_width:0] padding;
    } axis_write_t_chan_padded_t;

    typedef union packed {
        axi_write_aw_chan_padded_t axi;
        axis_write_t_chan_padded_t axis;
    } write_meta_channel_t;

   //--------------------------------------
    // Physical Signals to the DUT
    //--------------------------------------
   
  // ethernet pads
  logic       s_clk;
  logic       s_clk_125MHz_0;
  logic       s_clk_125MHz_90;
  logic       s_clk_200MHz;
  logic       s_rst_n;

  logic       eth_rxck;
  logic       eth_rxctl;
  logic [3:0] eth_rxd;
  logic       eth_txck;
  logic       eth_txctl;
  logic [3:0] eth_txd;
  logic       eth_rst_n;

  logic tx_idma_req_ready , tx_idma_rsp_ready;
  logic rx_idma_req_ready , rx_idma_rsp_ready;
  // register interface
  eth_idma_pkg::reg_req_t reg_req;
  logic                   req_valid; // not sure
  logic                   req_ready; // not sure

  eth_idma_pkg::reg_rsp_t reg_rsp;
  logic                   rsp_valid;  // not sure
  logic                   rsp_ready; // not sure

   // error handler
  idma_pkg::idma_eh_req_t idma_eh_req;
  logic                   eh_req_valid;
  logic                   eh_req_ready;

  // AXI4+ATOP request and response
  eth_idma_pkg::axi_req_t axi_tx_read_req, axi_tx_write_req, axi_rx_read_req, axi_rx_write_req, axi_tx_req_mem, axi_rx_req_mem ;
  eth_idma_pkg::axi_rsp_t axi_tx_read_rsp, axi_tx_write_rsp, axi_rx_read_rsp, axi_rx_write_rsp, axi_tx_rsp_mem, axi_rx_rsp_mem ;

  // error handler
  idma_pkg::idma_eh_req_t idma_eh_req;
  logic                   eh_req_valid;
  logic                   eh_req_ready;

  // busy signal
  idma_busy_t             busy;
  
  
    // -------------------- REG Drivers -----------------------

    REG_BUS #(
      .DATA_WIDTH(REG_BUS_DW),
      .ADDR_WIDTH(REG_BUS_AW)
    )  reg_bus_eth_mst (
      .clk_i(s_clk)
    );


  logic reg_error;

  typedef reg_test::reg_driver #(
     .AW(REG_BUS_AW),
     .DW(REG_BUS_DW),
     .TT(TEST_TIME),
     .TA(APPLY_TIME)
  ) reg_bus_master_t;


  reg_bus_master_t reg_eth_master  = new(reg_bus_eth_mst);
  
  eth_idma_pkg::reg_req_t reg_bus_req;
  eth_idma_pkg::reg_rsp_t reg_bus_rsp;
 

  `REG_BUS_ASSIGN_TO_REQ(eg_eth_req, reg_bus_eth_mst)
  `REG_BUS_ASSIGN_FROM_RSP(reg_bus_eth_mst, reg_eth_rsp)


   
    //--------------------------------------
    // TB Modules
    //--------------------------------------
    // clocking block
    clk_rst_gen #(
        .ClkPeriod    ( SYS_TCK  ),
        .RstClkCycles ( 1        )
    ) i_clk_rst_gen (
        .clk_o        ( s_clk     ),
        .rst_no       ( s_rst_n   )
    );
     // AXI4+ATOP sim memory
    axi_sim_mem #(
        .AddrWidth         ( AddrWidth    ),
        .DataWidth         ( DataWidth    ),
        .IdWidth           ( AxiIdWidth   ),
        .UserWidth         ( UserWidth    ),
        .axi_req_t         ( axi_req_t    ),
        .axi_rsp_t         ( axi_rsp_t    ),
        .WarnUninitialized ( 1'b0         ),
        .ClearErrOnAccess  ( 1'b1         ),
        .ApplDelay         ( SYS_TA       ),
        .AcqDelay          ( SYS_TT       )
    ) i_tx_axi_sim_mem (
        .clk_i              ( s_clk           ),
        .rst_ni             ( s_rst_n         ),
        .axi_req_i          ( axi_tx_req_mem  ),
        .axi_rsp_o          ( axi_tx_rsp_mem  )
    );

     // AXI4+ATOP sim memory
    axi_sim_mem #(
        .AddrWidth         ( AddrWidth    ),
        .DataWidth         ( DataWidth    ),
        .IdWidth           ( AxiIdWidth   ),
        .UserWidth         ( UserWidth    ),
        .axi_req_t         ( axi_req_t    ),
        .axi_rsp_t         ( axi_rsp_t    ),
        .WarnUninitialized ( 1'b0         ),
        .ClearErrOnAccess  ( 1'b1         ),
        .ApplDelay         ( SYS_TA       ),
        .AcqDelay          ( SYS_TT       )
    ) i_rx_axi_sim_mem (
        .clk_i              ( s_clk             ),
        .rst_ni             ( s_rst_n           ),
        .axi_req_i          ( axi_rx_req_mem    ),
        .axi_rsp_o          ( axi_rx_rsp_mem    )
    );
  

   // ---------------------------- DUT -----------------------------
   eth_idma_wrap
    #(
    .AxiDataWidth        ( DataWidth     ),    
    .AxiAddrWidth        ( AddrWidth     ),
    .AxiUserWidth        ( UserWidth     ),
    .AxiIdWidth          ( AxiIdWidth     ),
    .NumAxInFlight       ( NumAxInFlight  ),
    .BufferDepth         ( BufferDepth     ),
    .TFLenWidth          ( TFLenWidth        ),
    /// The depth of the memory system the backend is attached to
    .MemSysDepth         ( MemSysDepth       ),
    .RAWCouplingAvail    ( RAWCouplingAvail  ),
    .HardwareLegalizer   ( HardwareLegalizer  ),
    .RejectZeroTransfers ( RejectZeroTransfers  )
   )i_tx_eth_idma_wrap (

  /// Etherent Internal clocks
    .eth_clk_i        ( s_clk_125MHz_0  )  , // 125MHz in-phase
    .eth_clk90_i      ( s_clk_125MHz_90 )  , // 125 MHz with 90 phase shift
    .eth_clk200M_i    ( s_clk_200MHz    )  , // 200 MHz
    .eth_rst_ni       ( s_rst_n         )  , // active low

    .phy_rx_clk       ( eth_rxck        )  ,
    .phy_rxd          ( eth_rxd         )  ,
    .phy_rx_ctl       ( eth_rxctl       )  ,
    .phy_tx_clk       ( eth_txck        )  ,
    .phy_txd          ( eth_txd         )  ,
    .phy_tx_ctl       ( eth_txctl       )  ,
    .phy_reset_n      ( eth_rst_n       )  ,  // output
    .phy_int_n        ( 1'b1            )  ,
    .phy_pme_n        ( 1'b1            )  ,

  /// Ethernet MDIO
    .phy_mdio_i       ( 1'b0            ) ,
    .phy_mdio_o       (                 ) ,
    .phy_mdio_oe      (                 ) ,
    .phy_mdc          (                 ) ,

  /// Reg Configuration Interface
    .reg_req_i        ( reg_bus_req      ) ,
    .reg_rsp_o        ( reg_bus_rsp       ),
  /// iDMA 
     .idma_clk_i      ( s_clk           ) ,
     .rst_ni          ( s_rst_n         ) ,
     .testmode_i      (  1'b0           ),

      /// idma request
     .idma_req_i      ( reg_bus_req     ) ,
     .req_valid_i     ( reg_bus_req.valid           ) ,
     .req_ready_o     ( tx_idma_req_ready ),  

     .idma_rsp_o      ( reg_bus_rsp     ) ,
     .rsp_valid_o     ( reg_bus_rsp.ready ),
     .rsp_ready_i     (tx_idma_rsp_ready          ) ,

     .idma_eh_req_i ( ), // error handling disabled now
     .eh_req_valid_i( ),
     .eh_req_ready_o( ),

     .axi_read_req_o( axi_tx_rd_req_o),
     .axi_read_rsp_i( axi_tx_rd_rsp_i),

     .axi_write_req_o( axi_tx_wr_req_o),
     .axi_write_rsp_i( axi_tx_wr_rsp_i),
    .idma_busy_o(busy )
);
 
    //--------------------------------------
    // TB connections
    //--------------------------------------

     // Read Write Join
    axi_rw_join #(
        .axi_req_t        ( axi_req_t ),
        .axi_resp_t       ( axi_rsp_t )
    ) i_axi_tx_rw_join (
        .clk_i            ( s_clk         ),
        .rst_ni           ( s_rst_n       ),
        .slv_read_req_i   ( axi_tx_read_req  ),
        .slv_read_resp_o  ( axi_tx_read_rsp  ),
        .slv_write_req_i  ( axi_tx_write_req ),
        .slv_write_resp_o ( axi_tx_write_rsp ),
        .mst_req_o        ( axi_tx_req_mem      ),
        .mst_resp_i       ( axi_tx_rsp_mem       )
    );

    axi_rw_join #(
        .axi_req_t        ( axi_req_t ),
        .axi_resp_t       ( axi_rsp_t )
    ) i_axi_rx_rw_join (
        .clk_i            ( s_clk               ),
        .rst_ni           ( s_rst_n             ),
        .slv_read_req_i   ( axi_rx_read_req   ),
        .slv_read_resp_o  ( axi_rx_read_rsp   ),
        .slv_write_req_i  ( axi_rx_write_req  ),
        .slv_write_resp_o ( axi_rx_write_rsp  ),
        .mst_req_o        ( axi_tx_req_mem     ),
        .mst_resp_i       ( axi_tx_rsp_mem     )
    );
    
 eth_idma_pkg::reg_req_t rx_reg_idma_req, tx_reg_idma_req;
   eth_idma_pkg::reg_rsp_t rx_reg_idma_rsp, tx_reg_idma_rsp;

    eth_idma_wrap
    #(
    .AxiDataWidth        ( DataWidth     ),    
    .AxiAddrWidth        ( AddrWidth     ),
    .AxiUserWidth        ( UserWidth     ),
    .AxiIdWidth          ( AxiIdWidth     ),
    .NumAxInFlight       ( NumAxInFlight  ),
    .BufferDepth         ( BufferDepth     ),
    .TFLenWidth          ( TFLenWidth        ),
    .MemSysDepth         ( MemSysDepth       ),
    .RAWCouplingAvail    ( RAWCouplingAvail  ),
    .HardwareLegalizer   ( HardwareLegalizer  ),
    .RejectZeroTransfers ( RejectZeroTransfers  )
   )i_rx_eth_idma_wrap (

  /// Etherent Internal clocks
    .eth_clk_i        ( s_clk_125MHz_0  )  , // 125MHz in-phase
    .eth_clk90_i      ( s_clk_125MHz_90 )  , // 125 MHz with 90 phase shift
    .eth_clk200M_i    ( s_clk_200MHz    )  , // 200 MHz
    .eth_rst_ni       ( s_rst_n         )  , // active low

    .phy_rx_clk       ( eth_rxck        )  ,
    .phy_rxd          ( eth_rxd         )  ,
    .phy_rx_ctl       ( eth_rxctl       )  ,
    .phy_tx_clk       ( eth_txck        )  ,
    .phy_txd          ( eth_txd         )  ,
    .phy_tx_ctl       ( eth_txctl       )  ,
    .phy_reset_n      ( eth_rst_n       )  ,  // output
    .phy_int_n        ( 1'b1            )  ,
    .phy_pme_n        ( 1'b1            )  ,

  /// Ethernet MDIO
    .phy_mdio_i       ( 1'b0            ) ,
    .phy_mdio_o       (                 ) ,
    .phy_mdio_oe      (                 ) ,
    .phy_mdc          (                 ) ,

  /// Ethernet REGBUS Configuration Interface
    .reg_req_i        ( rx_reg_eth_req       ) ,
    .reg_rsp_o        ( rx_reg_eth_rsp       ),
  /// iDMA 
     .idma_clk_i      ( s_clk           ) ,
     .rst_ni          ( s_rst_n         ) ,
     .testmode_i      (  1'b0           ),

      /// idma request
     .idma_req_i      ( rx_reg_idma_req      ) ,
     .req_valid_i     ( rx_reg_idma_req.valid           ) ,
     .req_ready_o     ( rx_idma_req_ready ),  

     .idma_rsp_o      ( rx_reg_idma_rsp      ) ,
     .rsp_valid_o     (rx_reg_idma_rsp.ready ),
     .rsp_ready_i     ( rx_idma_rsp_ready            ) ,

     .idma_eh_req_i ( ), // error handling later
     .eh_req_valid_i( ),
     .eh_req_ready_o( ),

     .axi_read_req_o( axi_rx_rd_req_o),
     .axi_read_rsp_i( axi_rx_rd_rsp_i),

     .axi_write_req_o( axi_rx_wr_req_o),
     .axi_write_rsp_i( axi_rx_wr_rsp_i),
    .idma_busy_o(busy)
);

  // Internal Clock generation


   initial begin
      while (!done) begin //SYSTEM CLOCK

   initial begin
      while (!done) begin
         s_clk_200MHz <= 1;
         #(tCK200/2);
         s_clk_200MHz <= 0;
         #(tCK200/2);
      end
   end

   initial begin
      while (!done) begin
         s_clk_125MHz_0 <= 1;
         #(tCK125/2);
         s_clk_125MHz_0 <= 0;
         #(tCK125/2);
      end
   end

   initial begin
      while (!done) begin
         s_clk_125MHz_90 <= 0;
         #(tCK125/2);
         s_clk_125MHz_90 <= 1;
           #(tCK125/2);
      end
   end

   // ------------------------ BEGINNING OF SIMULATION ------------------------

   initial begin

      // General reset
      #tCK;
      s_rst_n <= 0;
      repeat(10) @(posedge s_clk);
      s_rst_n <= 1;
      #SYS_TCK;
  reg_eth_master
  reg_bus_master_t reg_eth_master_tx  = new(reg_bus_eth_mst_tx);
  reg_bus_master_t reg_eth_master_rx  = new(reg_bus_eth_mst_rx);
  reg_bus_master_t reg_idma_master_tx = new(reg_bus_idma_mst_tx);
  reg_bus_master_t reg_idma_master_rx = new(reg_bus_idma_mst_rx);
    //set framing rx mac address to 48'h207098001032
    reg_eth_master_tx.send_write( 'h0, 64'h98001032, 'hff, reg_error); //lower 32bits of MAC address
    // @(posedge s_clk);
    reg_eth_master_tx.send_write( 'h4,  64'h00002070, 'h0f, reg_error); //upper 16bits of MAC address + other configuration set to false/0
    // @(posedge s_clk);

    reg_eth_master_tx.send_write( 'h20, 64'h0, 'h0fff, reg_error ); // SRC_ADDR
    // @(posedge s_clk);
    
    reg_eth_master_tx.send_write( 'h28, 64'h0000207098001032, 'h0fff, reg_error); // DST_ADDR
    // @(posedge s_clk);

    reg_eth_master_tx.send_write( 'h18, 64'h8,'h0f , reg_error); // Size in bytes
    // @(posedge s_clk)
    
    reg_eth_master_tx.send_write( 'h18, 64'h8,'h0f , reg_error); // Size in bytes
    // @(posedge s_clk)

    reg_bus_master_t.send_write ( )
    


   // idma read test. src_addr = mac_addr
 initial
 begin
    
    reg_drv.send_write( 'h0, 64'h9800_1032, 'hff, reg_error); //lower 32bits of MAC address
    @(posedge s_clk);

    reg_drv.send_write( 'h4,  64'h0000_2070, 'h0f, reg_error); //upper 16bits of MAC address + other configuration set to false/0
    @(posedge s_clk);
    
    reg_drv.send_write( 'h10, 64'h0000_2070_9800_1032, 'h0fff, reg_error ); // SRC_ADDR
    @(posedge s_clk);
    
    reg_drv.send_write( 'h14, 64'h0, 'h0fff, reg_error); // DST_ADDR
    @(posedge s_clk);

    reg_drv.send_write( 'h18, 64'h8,'h0f , reg_error); // Size in bytes
    @(posedge s_clk)
   

   
   fix.write_axi(axi_master_wr_drv, 'h0, 64'h1032207098001032, 'hff); // addr as 0 in idma
   @(posedge s_clk);
   end
   repeat(10) @(posedge s_clk);
    
   fix.read_axi(axi_master_rd_drv, 'h0 );
   // idma read test-  src_addr = mac_addr
    $display("%d Dato corretto", rx_read_data);

 end
endmodule