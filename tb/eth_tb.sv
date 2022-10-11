
`timescale 1 ns/1 ps
`include "axi/assign.svh"


module eth_tb;

   parameter AW = 32;  //Address width
   parameter DW = 64;  //Data width
   parameter IW = 8;   //ID width
   parameter UW = 8;   //User width
   
   localparam tCK    = 1ns;
   localparam tCK200 = 5ns;
   localparam tCK125 = 8ns;
   
   logic s_clk           = 0;
   logic s_clk_200MHz    = 0;
   logic s_clk_125MHz_0  = 0;
   logic s_clk_125MHz_90 = 0;
   logic s_rst_n         = 1;
   logic done            = 0;

   //signals to instantiate the DUT
   wire       eth_rxck;
   wire       eth_rxctl;
   wire [3:0] eth_rxd;
   wire       eth_txck;
   wire       eth_txctl;
   wire [3:0] eth_txd;
   wire       eth_tx_rst_n;
   wire       eth_rx_rst_n;
   
   //---------------------AXI drivers-----------------------

   typedef logic [AW-1:0]   axi_addr_t;
   typedef logic [DW-1:0]   axi_data_t;
   typedef logic [DW/8-1:0] axi_strb_t;
   typedef logic [IW-1:0]   axi_id_t;
   
   AXI_BUS_DV
     #(
       .AXI_ADDR_WIDTH(AW),
       .AXI_DATA_WIDTH(DW),
       .AXI_ID_WIDTH(IW),
       .AXI_USER_WIDTH(UW)
       ) 
   axi_master_tx_dv(s_clk), axi_master_rx_dv(s_clk);
   
   AXI_BUS
     #(
       .AXI_ADDR_WIDTH(AW),
       .AXI_DATA_WIDTH(DW),
       .AXI_ID_WIDTH(IW),
       .AXI_USER_WIDTH(UW)
       ) 
   axi_master_tx(),axi_master_rx();
   
   `AXI_ASSIGN(axi_master_tx, axi_master_tx_dv)
   `AXI_ASSIGN(axi_master_rx, axi_master_rx_dv)
   
   typedef axi_test::axi_driver #(.AW(AW), .DW(DW), .IW(IW), .UW(UW), .TA(200ps), .TT(700ps)) axi_drv_t;
   axi_drv_t axi_master_tx_drv =  new(axi_master_tx_dv);
   axi_drv_t axi_master_rx_drv =  new(axi_master_rx_dv);

   //beats
   axi_test::axi_ax_beat #(.AW(AW), .IW(IW), .UW(UW)) ar_beat = new();  
   axi_test::axi_r_beat  #(.DW(DW), .IW(IW), .UW(UW)) r_beat  = new();
   axi_test::axi_ax_beat #(.AW(AW), .IW(IW), .UW(UW)) aw_beat = new();
   axi_test::axi_w_beat  #(.DW(DW), .UW(UW))          w_beat  = new();
   axi_test::axi_b_beat  #(.IW(IW), .UW(UW))          b_beat  = new();
   
   
   // ---------------------------- DUT -----------------------------
   //TX ETH_RGMII
   eth_rgmii
     #(
       .AXI_ID_WIDTH   ( IW ),
       .AXI_ADDR_WIDTH ( AW ),
       .AXI_DATA_WIDTH ( DW ),
       .AXI_USER_WIDTH ( UW )
       )
   i_eth_rgmii_tx
     (
      .clk_i           ( s_clk             ),
      .clk_200MHz_i    ( s_clk_200MHz      ),
      .rst_ni          ( s_rst_n           ),
      .eth_clk_i       ( s_clk_125MHz_90   ), //90
      
      .ethernet        ( axi_master_tx     ),
      
      .eth_rxck        ( eth_rxck          ),
      .eth_rxctl       ( eth_rxctl        ),
      .eth_rxd         ( eth_rxd           ),
      
      .eth_txck        ( eth_txck          ),
      .eth_txctl       ( eth_txctl         ),
      .eth_txd         ( eth_txd           ),
      
      .eth_rst_n       ( eth_tx_rst_n      ),
      .phy_tx_clk_i    ( s_clk_125MHz_0    ) //0
      );

   //RX ETH_RGMII
   eth_rgmii
     #(
       .AXI_ID_WIDTH   ( IW ),
       .AXI_ADDR_WIDTH ( AW ),
       .AXI_DATA_WIDTH ( DW ),
       .AXI_USER_WIDTH ( UW )
       )
   i_eth_rgmii_rx
     (
      .clk_i           ( s_clk             ),
      .clk_200MHz_i    ( s_clk_200MHz      ),
      .rst_ni          ( s_rst_n           ),
      
      .eth_clk_i       ( s_clk_125MHz_90   ), // 90
      .ethernet        ( axi_master_rx     ),
      
      .eth_rxck        ( eth_txck          ),
      .eth_rxctl       ( eth_txctl         ),
      .eth_rxd         ( eth_txd           ),
      
      .eth_txck        ( eth_rxck          ),
      .eth_txctl       ( eth_rxctl         ),
      .eth_txd         ( eth_rxd           ),
      
      .eth_rst_n       ( eth_rx_rst_n      ),
      .phy_tx_clk_i    ( s_clk_125MHz_0    ) //0
      );

   
   // begin of simulation -------------------------------------
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
   
   initial begin
      #tCK;
      s_rst_n <= 0;
      repeat(10) @(posedge s_clk);
      s_rst_n <= 1; //disattivo il reset
      #tCK;
      
      axi_master_tx_drv.reset_master();
      @(posedge s_clk);

      //1
      aw_beat.ax_addr = 'h00000800; //mac_address[31:0]
      axi_master_tx_drv.send_aw(aw_beat);
      
      w_beat.w_data = 'h00890702;
      w_beat.w_strb = 'b00001111;
      w_beat.w_last = 'b1;
      
      axi_master_tx_drv.send_w(w_beat);
      @(posedge s_clk);
      axi_master_tx_drv.recv_b(b_beat);
      @(posedge s_clk);
      
      //2 
      aw_beat.ax_addr = 'h00000808; //{irq_en,promiscuous,spare,loopback,cooked,mac_address[47:32]}
      axi_master_tx_drv.send_aw(aw_beat);
      
      w_beat.w_data = 'h00002301;
      w_beat.w_strb = 'b00001111;
      w_beat.w_last = 'b1;
      
      axi_master_tx_drv.send_w(w_beat);
      @(posedge s_clk);
      axi_master_tx_drv.recv_b(b_beat);
      @(posedge s_clk);

      //3
      aw_beat.ax_addr = 'h00000810; //Tx packet length
      axi_master_tx_drv.send_aw(aw_beat);
      
      w_beat.w_data = 'h00000010; //minimum frame size is 64Byte
      w_beat.w_strb = 'b00001111;
      w_beat.w_last = 'b1;
      
      axi_master_tx_drv.send_w(w_beat);
      @(posedge s_clk);
      axi_master_tx_drv.recv_b(b_beat);
      @(posedge s_clk);

      //4
      aw_beat.ax_addr = 'h00000828; // Rx frame check sequence register(read) and last register(write)
      axi_master_tx_drv.send_aw(aw_beat);
      
      w_beat.w_data = 'h00000008;
      w_beat.w_strb = 'b00001111;
      w_beat.w_last = 'b1;
      
      axi_master_tx_drv.send_w(w_beat);
      @(posedge s_clk);
      axi_master_tx_drv.recv_b(b_beat);
      @(posedge s_clk);

      //5
      aw_beat.ax_addr = 'h00001000; //Transmit buffer
      axi_master_tx_drv.send_aw(aw_beat);
      
      w_beat.w_data = 'h00001234;
      w_beat.w_strb = 'b00001111;
      w_beat.w_last = 'b1;
      
      axi_master_tx_drv.send_w(w_beat);
      @(posedge s_clk);
      axi_master_tx_drv.recv_b(b_beat);
      @(posedge s_clk);
      
      repeat (2000) @(posedge s_clk);
      
      done = 1;
     
   end
   
endmodule
