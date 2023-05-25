`include "axi_stream/assign.svh"
`include "axi_stream/typedef.svh"
`include "register_interface/typedef.svh"
`include "register_interface/assign.svh"

package eth_top_pkg;

  parameter int unsigned DataWidth = 64;
  parameter int unsigned IdWidth = 0;
  parameter int unsigned DestWidth = 0;
  parameter int unsigned UserWidth = 1;

  // AXI stream channels typedefs
  typedef logic [DataWidth-1:0]   tdata_t;
  typedef logic [DataWidth/8-1:0] tstrb_t;
  typedef logic [DataWidth/8-1:0] tkeep_t;
  typedef logic [IdWidth-1:0]     tid_t;
  typedef logic [DestWidth-1:0]   tdest_t;
  typedef logic [UserWidth-1:0]   tuser_t;

  `AXI_STREAM_TYPEDEF_ALL(s, tdata_t, tstrb_t, tkeep_t, tid_t, tdest_t, tuser_t)


  parameter int AW_REGBUS = 4;
  localparam int DW_REGBUS = 32;
  localparam int unsigned STRB_WIDTH = DW_REGBUS/8;

  // Define structs for reg_bus
  typedef logic [AW_REGBUS-1:0] addr_t;
  typedef logic [DW_REGBUS-1:0] data_t;
  typedef logic [STRB_WIDTH-1:0] strb_t;
  `REG_BUS_TYPEDEF_ALL(reg_bus, addr_t, data_t, strb_t)

endpackage : eth_top_pkg
