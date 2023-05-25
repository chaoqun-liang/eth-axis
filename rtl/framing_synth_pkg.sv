`include "axi_stream/assign.svh"
`include "axi_stream/typedef.svh"

package framing_synth_pkg;

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

  typedef struct packed {
    tdata_t data;
    tstrb_t strb;
    tkeep_t keep;
    logic   last;
    tid_t   id;
    tdest_t dest;
    tuser_t user;
  } s_chan_t;

  typedef struct packed {
    s_chan_t            t;
    logic               tvalid;
  } s_req_t;

  typedef struct packed {
    logic               tready;
  } s_rsp_t;



  parameter int AW_REGBUS = 4;
  localparam int DW_REGBUS = 32;
  localparam int unsigned STRB_WIDTH = DW_REGBUS/8;

  `include "register_interface/typedef.svh"
  `include "register_interface/assign.svh"

  // Define structs for reg_bus
  typedef logic [AW_REGBUS-1:0] addr_t;
  typedef logic [DW_REGBUS-1:0] data_t;
  typedef logic [STRB_WIDTH-1:0] strb_t;
  `REG_BUS_TYPEDEF_ALL(reg_bus, addr_t, data_t, strb_t)

endpackage : framing_synth_pkg
