
module eth_rgmii
  #(
    parameter int AxiAddrWidth = -1,
    parameter int AxiDataWidth = -1,
    parameter int AxiIdWidth = -1,
    parameter int AxiUserWidth = 1,
    )
   (
    input logic       clk_i , // Clock
    input logic       clk_200MHz_i,
    input logic       rst_ni, // Asynchronous reset active low
    
    input  logic      eth_clk_i,
    AXI_BUS.in        ethernet,
    
    // Ethernet
    input wire 	      eth_rxck,
    input wire 	      eth_rxctl,
    input wire [3:0]  eth_rxd,
    output wire       eth_txck,
    output wire       eth_txctl,
    output wire [3:0] eth_txd,
    output wire       eth_rst_n ,
    input logic       phy_tx_clk_i
    
    )
    
   logic 		      eth_en, eth_we, eth_int_n, eth_pme_n, eth_mdio_i, eth_mdio_o, eth_mdio_oe;
   logic [AxiAddrWidth-1:0]   eth_addr;
   logic [AxiDataWidth-1:0]   eth_wrdata, eth_rdata;
   logic [AxiDataWidth/8-1:0] eth_be;
   
   axi2mem 
     #(
       .AXI_ID_WIDTH   ( AxiIdWidth       ),
       .AXI_ADDR_WIDTH ( AxiAddrWidth     ),
       .AXI_DATA_WIDTH ( AxiDataWidth     ),
       .AXI_USER_WIDTH ( AxiUserWidth     )
       ) 
   i_axi2rom 
       (
	.clk_i  ( clk_i                   ),
	.rst_ni ( rst_ni                  ),
	.slave  ( ethernet                ),
	.req_o  ( eth_en                  ),
	.we_o   ( eth_we                  ),
	.addr_o ( eth_addr                ),
	.be_o   ( eth_be                  ),
	.data_o ( eth_wrdata              ),
	.data_i ( eth_rdata               )
	);
   
   framing_top 
     eth_rgmii
  (
   .msoc_clk(clk_i),
   .core_lsu_addr(eth_addr[14:0]),
   .core_lsu_wdata(eth_wrdata),
   .core_lsu_be(eth_be),
   .ce_d(eth_en),
   .we_d(eth_en & eth_we),
   .framing_sel(eth_en),
   .framing_rdata(eth_rdata),
   .rst_int(!rst_ni),
   .clk_int(phy_tx_clk_i), // 125 MHz in-phase
   .clk90_int(eth_clk_i),    // 125 MHz quadrature
   .clk_200_int(clk_200MHz_i),
   /*
    * Ethernet: 1000BASE-T RGMII
    */
   .phy_rx_clk(eth_rxck),
   .phy_rxd(eth_rxd),
   .phy_rx_ctl(eth_rxctl),
   .phy_tx_clk(eth_txck),
   .phy_txd(eth_txd),
   .phy_tx_ctl(eth_txctl),
   .phy_reset_n(eth_rst_n),
   .phy_int_n(eth_int_n),
   .phy_pme_n(eth_pme_n),
   .phy_mdc(eth_mdc),
   .phy_mdio_i(eth_mdio_i),
   .phy_mdio_o(eth_mdio_o),
   .phy_mdio_oe(eth_mdio_oe),
   .eth_irq(irq_sources[2])
);
