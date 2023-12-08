// Copyright 2023 ETH Zurich and University of Bologna.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51


`include "axi/assign.svh"
`include "axi/typedef.svh"
`include "axi_stream/assign.svh"
`include "axi_stream/typedef.svh" 
`include "idma/typedef.svh"
`include "register_interface/typedef.svh"
`include "register_interface/assign.svh"  
`include "common_cells/registers.svh"


module eth_idma_wrap #(

  /// Data width
  parameter int unsigned DataWidth     = 64,
  /// Address width
  parameter int unsigned AddrWidth     = 64,
  /// AXI User width 
  parameter int unsigned UserWidth     = 32'd0,
  /// AXI ID width
  parameter int unsigned IdWidth       = 32'd0,
  /// Number of transaction that can be in-flight concurrently
  parameter int unsigned NumAxInFlight    = 32'd3,
  /// The depth of the internal reorder buffer
  parameter int unsigned BufferDepth      = 32'd3,
  /// With of a transfer: max transfer size is `2**TFLenWidth` bytes
  parameter int unsigned TFLenWidth       = 32'd32,
  /// The depth of the memory system the backend is attached to
  parameter int unsigned MemSysDepth      = 32'd0,
  /// If this is enabled, then the data inserted into the dataflow element
  /// will no longer be word aligned, but only a single shifter is needed
  parameter bit          CombinedShifter  = 1'b0,
  /// Should the `R`-`AW` coupling hardware be present? (recommended)
  parameter bit          RAWCouplingAvail = 0,
  /// hardware legalization present
  parameter bit          HardwareLegalizer = 1'b1,
  /// Reject zero-length transfers
  parameter bit          RejectZeroTransfers = 1'b1,
  /// non-overidden types for axis params
  /// REGBUS
  parameter type reg_req_t = eth_idma_pkg::reg_bus_req_t,
  parameter type reg_rsp_t = eth_idma_pkg::reg_bus_rsp_t
  ) (

  /// Etherent Internal clocks
  input  logic                  eth_clk_i    , // 125MHz in-phase
  input  logic                  eth_clk90_i  , // 125 MHz with 90 phase shift
  input  logic                  eth_clk200M_i, // 200 MHz

  input  logic                  eth_rst_ni       , // active low

  /// Ethernet: 1000BASE-T RGMII
  input  logic                  phy_rx_clk   ,
  input  logic    [3:0]         phy_rxd      ,
  input  logic                  phy_rx_ctl   ,
  output logic                  phy_tx_clk   ,
  output logic    [3:0]         phy_txd      ,
  output logic                  phy_tx_ctl   ,

  output wire                   phy_reset_n  ,
  input  wire                   phy_int_n    ,
  input  wire                   phy_pme_n    ,

  /// Ethernet MDIO
  input  wire                   phy_mdio_i   ,
  output reg                    phy_mdio_o   ,
  output reg                    phy_mdio_oe  ,
  output wire                   phy_mdc      ,

  /// Ethernet REGBUS Configuration Interface
  input  reg_req_t              reg_req_i    ,
  output reg_rsp_t              reg_rsp_o    ,

  /// iDMA Clock
  input  logic                  idma_clk_i   ,
  /// Asynchronous reset, active low
  input  logic                  rst_ni       ,
  /// Testmode in
  input  logic                  testmode_i   ,

  /// 1D iDMA request
  input  idma_req_t             idma_req_i   ,
  /// 1D iDMA request valid
  input  logic                  req_valid_i  ,
  /// 1D iDMA request ready
  output logic                  req_ready_o  ,

  /// iDMA response
  output idma_rsp_t             idma_rsp_o   ,
  /// iDMA response valid
  output logic                  rsp_valid_o  ,
  /// iDMA response ready
  input  logic                  rsp_ready_i  ,

  /// Error handler request
  input  idma_pkg::idma_eh_req_t idma_eh_req_i,
  /// Error handler request valid
  input  logic                 eh_req_valid_i,
  /// Error handler request ready
  output logic                 eh_req_ready_o,

  /// AXI4+ATOP read request
  output axi_req_t             axi_read_req_o,
  /// AXI4+ATOP read response
  input  axi_rsp_t             axi_read_rsp_i,

  /// AXI4+ATOP write request
  output axi_req_t            axi_write_req_o,
  /// AXI4+ATOP write response
  input  axi_rsp_t            axi_write_rsp_i,

  /// iDMA busy flags

  output idma_pkg::idma_busy_t   idma_busy_o
);
  
 
 // AXI Stream request and response
  axis_rsp_t axis_read_req;
  axis_req_t axis_read_rsp;

  axis_req_t axis_write_req;
  axis_rsp_t axis_write_rsp;

  // reg interface
  eth_idma_pkg::eth_reg_req_t reg_req_i;
  eth_idma_pkg::eth_reg_rsp_t reg_rsp_o;
  eth_idma_pkg::idma_req_t    idma_req_i;
  eth_idma_pkg::idma_rsp_t    idma_rsp_o;

  // AXI4+ATOP request and response
  eth_idma_pkg::axi_req_t axi_read_req, axi_write_req;
  eth_idma_pkg::axi_rsp_t axi_read_rsp, axi_write_rsp;


  `IDMA_AXI_STREAM_TYPEDEF_S_CHAN_T(axi_stream_t_chan_t, data_t, strb_t, strb_t, id_t, id_t, user_t)
  `IDMA_AXI_STREAM_TYPEDEF_REQ_T(axi_stream_req_t, axi_stream_t_chan_t)
  `IDMA_AXI_STREAM_TYPEDEF_RSP_T(axi_stream_rsp_t)

  localparam idma_pkg::error_cap_e ErrorCap = ErrorHandling ? idma_pkg::ERROR_HANDLING :
                                                                idma_pkg::NO_ERROR_HANDLING;

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
    
 
  typedef union packed {
        axi_write_aw_chan_padded_t axi;
        axis_write_t_chan_padded_t axis;
    } write_meta_channel_t;

  eth_top #(
    .axi_stream_req_t   (  eth_idma_pkg::axis_req_t       ) ,
    .axi_stream_rsp_t   (  eth_idma_pkg::axis_rsp_t       ),
    .DataWidth          (  DataWidth                      ), 
    .IdWidth            (  IdWidth                        ),
    .DestWidth          (  0                              ),
    .UserWidth          (  1                              ),
    .reg_req_t          (  eth_idma_pkg::eth_reg_req_t    ),
    .reg_rsp_t          (  eth_idma_pkg::eth_reg_rsp_t    ),
    .AW_REGBUS          (  4                              )
  ) i_eth_top (
    .rst_ni             (  eths_rst_ni                    ),
    .clk_i              (  clk_i                          ),
    .clk90_int          (  clk_90_i                       ),
    .clk_200_int        (  clk_200MHz_i                   ),

    // Ethernet: 1000BASE-T RGMII
    .phy_rx_clk         (  phy_rx_clk                     ),
    .phy_rxd            (  phy_rxd                        ),
    .phy_rx_ctl         (  phy_rx_ctl                     ),
    .phy_tx_clk         (  phy_tx_clk                     ),
    .phy_txd            (  phy_txd                        ),
    .phy_tx_ctl         (  phy_tx_ctl                     ),
    .phy_reset_n        (  phy_reset_n                    ),
    .phy_int_n          (  phy_int_n                      ),
    .phy_pme_n          (  phy_pme_n                      ),
    .phy_mdio_i         (  phy_mdio_i                     ),
    .phy_mdio_o         (  phy_mdio_o                     ),
    .phy_mdio_oe        (  phy_mdio_oe                    ),
    .phy_mdc            (  phy_mdc                        ),
    
    // AXIS Interface (plug axis of iDMA into eth)
    .tx_axis_req_i      (  axis_write_req                 ), // set tuser to 1'b0 to indicate no error
    .tx_axis_rsp_o      (  axis_write_rsp                 ),
    .rx_axis_req_o      (  axis_read_rsp                  ),
    .rx_axis_rsp_i      (  axis_read_req                  ),
    // REGBUS Configuration Interfaceread_req            

    .reg_req_i          ( reg_req_i                       ),
    .reg_rsp_o          ( reg_rsp_o                       )
  );


 // Instantiate IDMA backend
   idma_backend_rw_axi_rw_axis #(
    .DataWidth            ( DataWidth                 ),
    .AddrWidth            ( AddrWidth                 ),
    .AxiIdWidth           ( IdWidth                   ),
    .UserWidth            ( UserWidth                 ),
    .TFLenWidth           ( TFLenWidth                ),
    .BufferDepth          ( BufferDepth               ),
    .NumAxInFlight        ( NumAxInFlight             ),
    .MemSysDepth          ( MemSysDepth               ),
    .CombinedShifter      ( CombinedShifter           ),
    .RAWCouplingAvail     ( RAWCouplingAvail          ),
    .HardwareLegalizer    ( HardwareLegalizer         ),
    .RejectZeroTransfers  ( RejectZeroTransfers       ),
    .ErrorCap             ( ErrorCap                  ),
    .idma_req_t           ( eth_idma_pkg::idma_req_t  ),
    .idma_rsp_t           ( eth_idma_pkg::idma_rsp_t  ),
    .idma_eh_req_t        ( idma_pkg::idma_eh_req_t   ),
    .idma_busy_t          ( idma_pkg::idma_busy_t     ),
    .axi_req_t            ( eth_idma_pkg::axi_req_t   ),
    .axi_rsp_t            ( eth_idma_pkg::axi_rsp_t   ),
    .axis_read_req_t      ( axis_rsp_t                ),
    .axis_read_rsp_t      ( axis_req_t                ),
    .axis_write_req_t     ( axis_req_t                ),
    .axis_write_rsp_t     ( axis_rsp_t                ),
    /// Address Write Channel type
    .write_meta_channel_t ( write_meta_channel_t      ),
    /// Address Read Channel type
    .read_meta_channel_t  ( read_meta_channel_t       )
) i_idma_backend (
    .clk_i                ( idma_clk_i                ),
    .rst_ni               ( rst_ni                    ),
    .testmode_i           ( testmode_i                ),
    .idma_req_i           ( idma_req_i                ),
    .req_valid_i          ( req_valid_i               ),
    .req_ready_o          ( req_ready_o               ),
    .idma_rsp_o           ( idma_rsp_o                ),
    .rsp_valid_o          ( rsp_valid_o               ),
    .rsp_ready_i          ( rsp_ready_i               ),
    .idma_eh_req_i        ( idma_eh_req_i,            ),
    .eh_req_valid_i       ( eh_req_valid_i            ),
    .eh_req_ready_o       ( eh_req_ready_o            ),

    /// AXI Interface
    .axi_write_req_o      ( axi_write_req             ),
    .axi_write_rsp_i      ( axi_write_rsp             ),
    .axi_read_req_o       ( axi_read_req              ),
    .axi_read_rsp_i       ( axi_read_rsp              ),

    /// AXIS Interface
    .axis_read_req_o      ( axis_read_req             ),
    .axis_read_rsp_i      ( axis_read_rsp             ), // with data
    .axis_write_req_o     ( axi_write_req             ), // wuth data
    .axis_write_rsp_i     ( axi_write_rsp             ),

    .busy_o               ( idma_busy_o               )
);


endmodule : eth_idma_wrap