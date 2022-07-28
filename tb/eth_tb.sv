
`include "axi/assign.svh"

module tb_eth;
   
   parameter AW = 32;
   parameter DW = 32;
   parameter IW = 8;
   parameter UW = 8;
   
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
   
   AXI_BUS_DV
     #(
       .AXI_ADDR_WIDTH(AW),
       .AXI_DATA_WIDTH(DW),
       .AXI_ID_WIDTH(IW),
       .AXI_USER_WIDTH(UW)
       ) 
   axi_master_tx(clk), axi_master_rx(clk);
   
   AXI_BUS
     #(
       .AXI_ADDR_WIDTH(AW),
       .AXI_DATA_WIDTH(DW),
       .AXI_ID_WIDTH(IW),
       .AXI_USER_WIDTH(UW)
       ) axi_master_tx(), axi_master_rx();
   `AXI_ASSIGN(axi_master_tx, axi_master_tx_dv)
   `AXI_ASSIGN(axi_master_rx, axi_master_rx_dv)
   
   axi_test::axi_driver #(.AW(AW), .DW(DW), .IW(IW), .UW(UW), .TA(200ps), .TT(700ps)) axi_master_drv = new(axi_master_dv);
   
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
      s_rst_n <= 1;
      #tCK;
      while (!done) begin
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
      automatic axi_test::axi_ax_beat #(.AW(AW), .IW(IW), .UW(UW)) ax_beat = new;
      automatic axi_test::axi_w_beat #(.DW(DW), .UW(UW)) w_beat = new;
      automatic axi_test::axi_b_beat  #(.IW(IW), .UW(UW)) b_beat;
      
      axi_master_drv.reset_master();
      @(posedge clk);
      
      ax_beat.ax_data = 'hcafebabe;
      axi_master_drv.send_aw(ax_beat);
      w_beat.w_data = 'hcafebabe;
      axi_master_drv.send_w(w_beat);
      
      @(posedge clk);
      
      done = 1;
   end
   
endmodule
