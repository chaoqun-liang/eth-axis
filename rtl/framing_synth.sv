// Copyright 2023 ETH Zurich and University of Bologna.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51
//
// Authors:
// - Thiemo Zaugg <zauggth@ethz.ch>

`include "axi_stream/assign.svh"
`include "axi_stream/typedef.svh"

module framing_synth #(
  /// AXI Stream in request struct
  parameter type axi_stream_req_t = logic,
  /// AXI Stream in response struct
  parameter type axi_stream_rsp_t = logic
) (
  // Internal 125 MHz clock
  input  wire                                           clk_i        ,
  input  wire                                           rst_ni       ,
  input  wire                                           clk90_int    ,
  input  wire                                           clk_200_int  ,
  // Ethernet: 1000BASE-T RGMII
  input  wire                                           phy_rx_clk   ,
  input  wire     [3:0]                                 phy_rxd      ,
  input  wire                                           phy_rx_ctl   ,
  output wire                                           phy_tx_clk   ,
  output wire     [3:0]                                 phy_txd      ,
  output wire                                           phy_tx_ctl   ,
  output wire                                           phy_reset_n  ,
  input  wire                                           phy_int_n    ,
  input  wire                                           phy_pme_n    ,
  // MDIO
  input  wire                                           phy_mdio_i   ,
  output      reg                                       phy_mdio_o   ,
  output      reg                                       phy_mdio_oe  ,
  output wire                                           phy_mdc      ,
  // AXIS TX/RX
  input       axi_stream_req_t                          tx_axis_req_i,
  output      axi_stream_rsp_t                          tx_axis_rsp_o,
  output      axi_stream_req_t                          rx_axis_req_o,
  input       axi_stream_rsp_t                          rx_axis_rsp_i,
  // configuration (register interface)
  input       eth_framing_reg_pkg::eth_framing_reg2hw_t reg2hw       , // Read from HW
  output      eth_framing_reg_pkg::eth_framing_hw2reg_t hw2reg         // Write from HW
);

  localparam int unsigned DataWidth = 64;
  localparam int unsigned IdWidth   = 0;
  localparam int unsigned DestWidth = 0;
  localparam int unsigned UserWidth = 1;

  // AXI stream channels typedefs
  typedef logic [DataWidth-1:0]   tdata_t;
  typedef logic [DataWidth/8-1:0] tstrb_t;
  typedef logic [DataWidth/8-1:0] tkeep_t;
  typedef logic [IdWidth-1:0]     tid_t;
  typedef logic [DestWidth-1:0]   tdest_t;
  typedef logic [UserWidth-1:0]   tuser_t;

  `AXI_STREAM_TYPEDEF_ALL(s, tdata_t, tstrb_t, tkeep_t, tid_t, tdest_t, tuser_t)

  // AXI stream signals
  s_req_t s_tx_req, s_rx_req;
  s_rsp_t s_tx_rsp, s_rx_rsp;

  assign s_tx_req = tx_axis_req_i;
  assign tx_axis_rsp_o = s_tx_rsp;
  assign rx_axis_req_i = s_rx_req;
  assign rx_axis_rsp_o = s_rx_rsp;

// ---------------- axis streams for the framing module ----------------------
  localparam int unsigned FramingDataWidth = 8;
  localparam int unsigned FramingIdWidth   = 0;
  localparam int unsigned FramingDestWidth = 0;
  localparam int unsigned FramingUserWidth = 1;

  // AXI stream channels typedefs
  typedef logic [FramingDataWidth-1:0]   framing_tdata_t;
  typedef logic [FramingDataWidth/8-1:0] framing_tstrb_t;
  typedef logic [FramingDataWidth/8-1:0] framing_tkeep_t;
  typedef logic [FramingIdWidth-1:0]     framing_tid_t;
  typedef logic [FramingDestWidth-1:0]   framing_tdest_t;
  typedef logic [FramingUserWidth-1:0]   framing_tuser_t;

  `AXI_STREAM_TYPEDEF_ALL(s_framing, framing_tdata_t, framing_tstrb_t, framing_tkeep_t, framing_tid_t, framing_tdest_t, framing_tuser_t)

  // AXI stream signals
  s_framing_req_t s_framing_tx_req, s_framing_rx_req;
  s_framing_rsp_t s_framing_tx_rsp, s_framing_rx_rsp;

  framing_top #(
    .axi_stream_req_t(s_framing_req_t),
    .axi_stream_rsp_t(s_framing_rsp_t)
  ) i_framing_top (
    .rst_ni(rst_ni),
    .clk_i(clk_i),
    .clk90_int(clk90_int),
    .clk_200_int(clk_200_int),

    // Ethernet: 1000BASE-T RGMII
    .phy_rx_clk(phy_rx_clk),
    .phy_rxd(phy_rxd),
    .phy_rx_ctl(phy_rx_ctl),
    .phy_tx_clk(phy_tx_clk),
    .phy_txd(phy_txd),
    .phy_tx_ctl(phy_tx_ctl),
    .phy_reset_n(phy_reset_n),
    .phy_int_n(phy_int_n),
    .phy_pme_n(phy_pme_n),

    // MDIO
    .phy_mdio_i(phy_mdio_i),
    .phy_mdio_o(phy_mdio_o),
    .phy_mdio_oe(phy_mdio_oe),
    .phy_mdc(phy_mdc),

    // AXIS TX/RX
    .tx_axis_req_i(s_framing_tx_req),
    .tx_axis_rsp_o(s_framing_tx_rsp),
    .rx_axis_req_o(s_framing_rx_req),
    .rx_axis_rsp_i(s_framing_rx_rsp),

    // Configuration Interface
    .reg2hw(reg2hw),
    .hw2reg(hw2reg)
  );

  axi_stream_dw_downsizer #(
    .DataWidthIn         (DataWidth),
    .DataWidthOut        (FramingDataWidth),
    .IdWidth             (IdWidth),
    .DestWidth           (DestWidth),
    .UserWidth           (UserWidth),
    .axi_stream_in_req_t(s_req_t),
    .axi_stream_in_rsp_t(s_rsp_t),
    .axi_stream_out_req_t(s_framing_req_t),
    .axi_stream_out_rsp_t(s_framing_rsp_t)
  ) i_axi_stream_dw_downsizer (
    .clk_i    (clk_i),
    .rst_ni   (rst_ni),
    .in_req_i (s_tx_req),
    .in_rsp_o (s_tx_rsp),
    .out_req_o(s_framing_tx_req),
    .out_rsp_i(s_framing_tx_rsp)
  );

  axi_stream_dw_upsizer #(
    .DataWidthIn         (FramingDataWidth),
    .DataWidthOut        (DataWidth),
    .IdWidth             (IdWidth),
    .DestWidth           (DestWidth),
    .UserWidth           (UserWidth),
    .axi_stream_in_req_t(s_framing_req_t),
    .axi_stream_in_rsp_t(s_framing_rsp_t),
    .axi_stream_out_req_t(s_req_t),
    .axi_stream_out_rsp_t(s_rsp_t)
  ) i_axi_stream_dw_upsizer (
    .clk_i    (clk_i),
    .rst_ni   (rst_ni),
    .in_req_i (s_framing_rx_req),
    .in_rsp_o (s_framing_rx_rsp),
    .out_req_o(s_rx_req),
    .out_rsp_i(s_rx_rsp)
  );

endmodule : framing_synth
