
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
   
   wire       eth_rxck;
   wire       eth_rxctl;
   wire [3:0] eth_rxd;
   wire       eth_txck;
   wire       eth_txctl;
   wire [3:0] eth_txd;
   
   wire       eth_tx_rst_n;
   wire       eth_rx_rst_n;


  // typedef logic [DW-1:0] data_t;   //cella di memoria
  // data_t                 memory[bit [31:0]]; //memoria

   
 // A clocked AXI4 interface for use in design verification
   AXI_BUS_DV
     #(
       .AXI_ADDR_WIDTH(AW),
       .AXI_DATA_WIDTH(DW),
       .AXI_ID_WIDTH(IW),
       .AXI_USER_WIDTH(UW)
       ) 
   axi_master_tx_dv(s_clk), axi_master_rx_dv(s_clk); //"master" (driver)
 

   // An AXI4 interface, definito nel file axi_intf.sv
   AXI_BUS
     #(
       .AXI_ADDR_WIDTH(AW),
       .AXI_DATA_WIDTH(DW),
       .AXI_ID_WIDTH(IW),
       .AXI_USER_WIDTH(UW)
       ) 
   axi_master_tx(), axi_master_rx(); //"slave"

   //definizione: AXI_ASSIGN(slv, mst)
   `AXI_ASSIGN(axi_master_tx, axi_master_tx_dv)
   `AXI_ASSIGN(axi_master_rx, axi_master_rx_dv)

   //package axi_test, classe axi_driver (file axi_test.sv)
   axi_test::axi_driver #(.AW(AW), .DW(DW), .IW(IW), .UW(UW), .TA(200ps), .TT(700ps)) axi_master_tx_drv = new(axi_master_tx_dv);
   axi_test::axi_driver #(.AW(AW), .DW(DW), .IW(IW), .UW(UW), .TA(200ps), .TT(700ps)) axi_master_rx_drv = new(axi_master_rx_dv);

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
      .eth_rxctl       ( eth_rxctrl        ),
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
      .eth_rxctl       ( eth_txctrl        ),
      .eth_rxd         ( eth_txd           ),
      
      .eth_txck        ( eth_rxck          ),
      .eth_txctl       ( eth_rxctl         ),
      .eth_txd         ( eth_rxd           ),
      
      .eth_rst_n       ( eth_rx_rst_n      ),
      .phy_tx_clk_i    ( s_clk_125MHz_0    ) //0
      );
   
   initial begin
      #tCK;
      s_rst_n <= 0;
      #tCK;
      s_rst_n <= 1; //disattivo il reset
      #tCK;
      while (!done) begin //creazione CLOCK
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
   end // initial begin
   
   initial begin
      while (!done) begin
	 s_clk_125MHz_0 <= 1;
	 #(tCK125/2);
	 s_clk_125MHz_0 <= 0;
	 #(tCK125/2);
      end
   end // initial begin
   
   initial begin
      while (!done) begin
	 s_clk_125MHz_90 <= 0;
	 #(tCK125/2);
	 s_clk_125MHz_90 <= 1;
	 #(tCK125/2);
      end
   end // initial begin
   
   initial begin
      // axi_ax_beat --> the data transferred on a beat on the AW/AR channels.
      automatic axi_test::axi_ax_beat #(.AW(AW), .IW(IW), .UW(UW)) ax_beat = new;
      // axi_w_beat --> the data transferred on a beat on the W channel.
      automatic axi_test::axi_w_beat #(.DW(DW), .UW(UW)) w_beat = new;
      // axi_b_beat --> the data transferred on a beat on the B channel.
      automatic axi_test::axi_b_beat  #(.IW(IW), .UW(UW)) b_beat;
      
      axi_master_tx_drv.reset_master(); //mette tutte le variabili del master a 0
      @(posedge s_clk);
      
      ax_beat.ax_addr = 'h00000800;//indirizzo in cui scrivere
      axi_master_tx_drv.send_aw(ax_beat);
      

      w_beat.w_data = 'hcafebabe; //dato da scrivere
      w_beat.w_strb = 'b00001111;
      w_beat.w_last = 'b1;
      
      axi_master_tx_drv.send_w(w_beat);
      @(posedge s_clk);

      axi_master_tx_drv.recv_b(b_beat);
      @(posedge s_clk);
      //axi_master_rx_drv.send_b(b_beat);
      //@(posedge s_clk);
      
      //SECONDO MESSAGGIO
      repeat (50) @(posedge s_clk);

      axi_master_tx_drv.reset_master(); 
      @(posedge s_clk);
      
      ax_beat.ax_addr = 'h00000808;
      axi_master_tx_drv.send_aw(ax_beat);

      w_beat.w_data = 'haaaabbbb;
      w_beat.w_strb = 'b00001111;
      w_beat.w_last = 'b1;
      
      axi_master_tx_drv.send_w(w_beat);
      @(posedge s_clk);

      axi_master_tx_drv.recv_b(b_beat);
      @(posedge s_clk);
     // axi_master_rx_drv.send_b(b_beat);
      @(posedge s_clk);
      
      repeat (100) @(posedge s_clk);

      

      done = 1;
   end
   
endmodule
