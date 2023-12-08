
`timescale 1 ns/1 ps

// axi + regbus
`include "axi/assign.svh"
`include "register_interface/typedef.svh"
`include "register_interface/assign.svh"

module eth_idma_tb;

  localparam int unsigned REG_BUS_DW = 32;
  localparam int unsigned REG_BUS_AW = 4;

  localparam int unsigned AW = 32;  //Address width
  localparam int unsigned DW = 64;  //Data width
  localparam int unsigned IW = 8;   //ID width
  localparam int unsigned UW = 8;   //User width

  localparam tCK    = 1ns;
  localparam tCK200 = 5ns;
  localparam tCK125 = 8ns;

  logic s_clk           = 0;
  logic s_clk_125MHz_0  = 0;
  logic s_clk_125MHz_90 = 0;
  logic s_clk_200MHz    = 0;
  logic s_rst_n         = 1;
  logic done            = 0;

  // signals to instantiate the DUT
  logic       eth_rxck;
  logic       eth_rxctl;
  logic [3:0] eth_rxd;
  logic       eth_txck;
  logic       eth_txctl;
  logic [3:0] eth_txd;
  logic       eth_rst_n;

  logic       idma_req_ready_o  ;
  logic       idma_rsp_valid_o ;

   //------------------------ AXI drivers --------------------------

   AXI_BUS_DV
     #(
       .AXI_ADDR_WIDTH(AW),
       .AXI_DATA_WIDTH(DW),
       .AXI_ID_WIDTH(IW),
       .AXI_USER_WIDTH(UW)
       )
   axi_master_wr_dv(s_clk), axi_master_rd_dv(s_clk);

   AXI_BUS
     #(
       .AXI_ADDR_WIDTH(AW),
       .AXI_DATA_WIDTH(DW),
       .AXI_ID_WIDTH(IW),
       .AXI_USER_WIDTH(UW)
       )
   axi_master_wr(),axi_master_rd();

   `AXI_ASSIGN(axi_master_wr, axi_master_wr_dv)
   `AXI_ASSIGN(axi_master_rd, axi_master_rd_dv)

   typedef axi_test::axi_driver #(.AW(AW), .DW(DW), .IW(IW), .UW(UW), .TA(200ps), .TT(700ps)) axi_drv_t;

   axi_drv_t axi_master_wr_drv =  new(axi_master_wr_dv);
   axi_drv_t axi_master_rd_drv =  new(axi_master_rd_dv);
   
   eth_idma_pkg::axi_req_t axi_rd_req_o, axi_wr_req_o;
   eth_idma_pkg::axi_rsp_t axi_wr_rsp_i, axi_rd_rsp_i;

  `AXI_ASSIGN_TO_REQ(axi_wr_req_o, axi_master_wr);
  `AXI_ASSIGN_FROM_RSP(axi_master_wr, axi_wr_rsp_i);

  `AXI_ASSIGN_TO_REQ(axi_rd_req_o, axi_master_rd);
  `AXI_ASSIGN_FROM_RSP(axi_master_rd, axi_rd_rsp_i);
   
  // -------------------- REG Drivers ------------------------
  REG_BUS #(
     .DATA_WIDTH(REG_BUS_DW),
     .ADDR_WIDTH(REG_BUS_AW)
  ) reg_bus_mst (.clk_i(clk_i));

  logic reg_error;

  typedef reg_test::reg_driver #(
     .AW(REG_BUS_AW),
     .DW(REG_BUS_DW),
     .TT(TEST_TIME),
     .TA(APPLY_TIME)
  ) reg_bus_drv_t;

  reg_bus_drv_t reg_drv = new(reg_bus_mst);

  eth_idma_pkg::eth_reg_req_t reg_req_i;
  eth_idma_pkg::eth_reg_rsp_t reg_rsp_o;

  `REG_BUS_ASSIGN_TO_REQ(reg_req_i, reg_bus_mst )
  `REG_BUS_ASSIGN_FROM_RSP(reg_bus_mst, reg_rsp_o)

   // ---------------------------- DUT -----------------------------
   eth_idma_wrap
    #(
    .AxiDataWidth        ( DW     ),    
    .AxiAddrWidth        ( AW     ),
    .AxiUserWidth        ( UW     ),
    .AxiIdWidth          ( IW     ),
    .NumAxInFlight       ( 32'd3  ),
    .BufferDepth         ( 32'd3  ),
    .TFLenWidth          ( 32'd32 ),
    /// The depth of the memory system the backend is attached to
    .MemSysDepth         ( 32'd0 ),
    .CombinedShifter     ( 1'b0  ),
    .RAWCouplingAvail    ( 1'b1  ),
    .HardwareLegalizer   ( 1'b1  ),
    .RejectZeroTransfers ( 1'b1  )
   )i_eth_idma_wrap (

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
    .reg_req_i        ( reg_req_i       ) ,
    .reg_rsp_o        ( reg_rsp_o       ),
  /// iDMA 
     .idma_clk_i      ( s_clk           ) ,
     .rst_ni          ( s_rst_n         ) ,
     .testmode_i      (  1'b0           ),

      /// idma request
     .idma_req_i      ( reg_req_i       ) ,
     .req_valid_i     ( 1'b1            ) ,
     .req_ready_o     (idma_req_ready_o ),  

     .idma_rsp_o      ( eg_rsp_o      ) ,
     .rsp_valid_o     (idma_rsp_valid_o ),
     .rsp_ready_i     ( 1'b1            ) ,

     .idma_eh_req_i ( ), // error handling later
     .eh_req_valid_i( ),
     .eh_req_ready_o( ),

     .axi_read_req_o( axi_rd_req_o),
     .axi_read_rsp_i( axi_rd_rsp_i),

     .axi_write_req_o( axi_wr_req_o),
     .axi_write_rsp_i( axi_wr_rsp_i),
    .idma_busy_o( )
);


   // high level functions for axi operations
   fix_eth fix();

   logic [63:0] rx_read_data;
   assign rx_read_data = axi_rd_rsp_i.axi_r_chan_t.data_t;

    logic [63:0] rx_read_data;
   assign rx_read_data = axi_master_rd_drv.r_data;

   // ---------------------- CLOCK GENERATION ------------------------

   initial begin
      while (!done) begin //SYSTEM CLOCK
	       s_clk <= 1;
	       #(tCK/2);
	       s_clk <= 0;
	       #(tCK/2);
      end
   end

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
      #tCK;

      // Reset axi master
      fix.reset_master(axi_master_wr_drv);
      repeat(5) @(posedge s_clk);
      
       task send_write (
      input  logic [AW-1:0] addr,
      input  logic [DW-1:0] data,
      input  logic [DW/8-1:0] strb,
      output logic error
    );
    // //set framing rx mac address to 48'h207098001032
    // reg_drv.send_write( 'h0, 64'h98001032, 'hff, reg_error); //lower 32bits of MAC address
    // @(posedge s_clk);

    // reg_drv.send_write( 'h4,  64'h00002070, 'h0f, reg_error); //upper 16bits of MAC address + other configuration set to false/0
    // @(posedge s_clk);

    // reg_drv.send_write( 'h10, 64'h0000207098001032, 'h0fff, reg_error ); // SRC_ADDR
    // @(posedge s_clk);
    
    // reg_drv.send_write( 'h14, 64'h0000207098001032, 'h0fff, reg_error); // DST_ADDR
    // @(posedge s_clk);

    // reg_drv.send_write( 'h18, 64'h8,'h0f , reg_error); // Size in bytes
    // @(posedge s_clk)
    


   // idma write test. dst_addr = mac_addr
 initial
 begin
    

    reg_drv.send_write( 'h0, 64'h98001032, 'hff, reg_error); //lower 32bits of MAC address
    @(posedge s_clk);

    reg_drv.send_write( 'h4,  64'h00002070, 'h0f, reg_error); //upper 16bits of MAC address + other configuration set to false/0
    @(posedge s_clk);
    
    reg_drv.send_write( 'h10, 64'h0, 'h0fff, reg_error ); // SRC_ADDR
    @(posedge s_clk);
    
    reg_drv.send_write( 'h14, 64'h0000207098001032, 'h0fff, reg_error); // DST_ADDR
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