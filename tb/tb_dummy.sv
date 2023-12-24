// Copyright 2022 ETH Zurich and University of Bologna.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51

`timescale 1 ns/1 ns

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
    localparam int unsigned axis_t_chan_width = $bits(axis_t_chan_t);

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
  logic                   req_valid; 
  logic                   req_ready; 

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
    )  reg_bus_eth_tx (
      .clk_i(s_clk)
    );
    REG_BUS #(
      .DATA_WIDTH(REG_BUS_DW),
      .ADDR_WIDTH(REG_BUS_AW)
    )  reg_bus_eth_rx (
      .clk_i(s_clk)
    );
 
  logic reg_error_tx, reg_error_rx;

  typedef reg_test::reg_driver #(
     .AW(REG_BUS_AW),
     .DW(REG_BUS_DW),
     .TT(TEST_TIME),
     .TA(APPLY_TIME)
  ) reg_bus_drv_tx, reg_bus_drv_rx;


  reg_bus_drv_tx reg_eth_drv_tx  = new(reg_bus_eth_tx);
  reg_bus_drv_rx reg_eth_drv_rx  = new(reg_bus_eth_rx);
  
  eth_idma_pkg::reg_req_t reg_bus_tx_req, reg_bus_rx_req;
  eth_idma_pkg::reg_rsp_t reg_bus_tx_rsp, reg_bus_rx_rsp;
 

  `REG_BUS_ASSIGN_TO_REQ (reg_bus_tx_req, reg_bus_eth_tx)
  `REG_BUS_ASSIGN_FROM_RSP (reg_bus_eth_tx, reg_bus_tx_rsp)
  
   `REG_BUS_ASSIGN_TO_REQ (reg_bus_rx_req, reg_bus_eth_rx)
  `REG_BUS_ASSIGN_FROM_RSP (reg_bus_eth_rx, reg_bus_rx_rsp)



   
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
    .reg_req_i        ( reg_bus_tx_req      ) ,
    .reg_rsp_o        ( reg_bus_tx_rsp       ),
  /// iDMA 
     .idma_clk_i      ( s_clk           ) ,
     .rst_ni          ( s_rst_n         ) ,
     .testmode_i      (  1'b0           ),

      /// idma request
     .idma_req_i      ( reg_bus_tx_req     ) ,
     .req_valid_i     ( reg_bus_tx_req.valid           ) ,
     .req_ready_o     ( tx_idma_req_ready ),  

     .idma_rsp_o      ( reg_bus_tx_rsp     ) ,
     .rsp_valid_o     ( reg_bus_tx_rsp.ready ),
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
 