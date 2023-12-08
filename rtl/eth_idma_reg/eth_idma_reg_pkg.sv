// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Register Package auto-generated by `reggen` containing data structure

package eth_idma_reg_pkg;

  // Address widths within the block
  parameter int BlockAw = 7;

  ////////////////////////////
  // Typedefs for registers //
  ////////////////////////////

  typedef struct packed {
    logic [31:0] q;
  } eth_idma_reg2hw_maclo_addr_reg_t;

  typedef struct packed {
    struct packed {
      logic [15:0] q;
    } upper_mac_address;
    struct packed {
      logic        q;
    } promiscuous;
    struct packed {
      logic        q;
    } phy_mdclk;
    struct packed {
      logic        q;
    } phy_mdio_o;
    struct packed {
      logic        q;
    } phy_mdio_oe;
  } eth_idma_reg2hw_machi_mdio_reg_t;

  typedef struct packed {
    logic [31:0] q;
  } eth_idma_reg2hw_src_addr_reg_t;

  typedef struct packed {
    logic [31:0] q;
  } eth_idma_reg2hw_dst_addr_reg_t;

  typedef struct packed {
    logic [31:0] q;
  } eth_idma_reg2hw_num_bytes_reg_t;

  typedef struct packed {
    logic [63:0] q;
    logic        re;
  } eth_idma_reg2hw_next_id_reg_t;

  typedef struct packed {
    logic [63:0] q;
    logic        re;
  } eth_idma_reg2hw_done_reg_t;

  typedef struct packed {
    logic [31:0] d;
    logic        de;
  } eth_idma_hw2reg_tx_fcs_reg_t;

  typedef struct packed {
    logic [31:0] d;
    logic        de;
  } eth_idma_hw2reg_rx_fcs_reg_t;

  typedef struct packed {
    logic        d;
  } eth_idma_hw2reg_status_reg_t;

  typedef struct packed {
    logic [63:0] d;
  } eth_idma_hw2reg_next_id_reg_t;

  typedef struct packed {
    logic [63:0] d;
  } eth_idma_hw2reg_done_reg_t;

  // Register -> HW type
  typedef struct packed {
    eth_idma_reg2hw_maclo_addr_reg_t maclo_addr; // [277:246]
    eth_idma_reg2hw_machi_mdio_reg_t machi_mdio; // [245:226]
    eth_idma_reg2hw_src_addr_reg_t src_addr; // [225:194]
    eth_idma_reg2hw_dst_addr_reg_t dst_addr; // [193:162]
    eth_idma_reg2hw_num_bytes_reg_t num_bytes; // [161:130]
    eth_idma_reg2hw_next_id_reg_t next_id; // [129:65]
    eth_idma_reg2hw_done_reg_t done; // [64:0]
  } eth_idma_reg2hw_t;

  // HW -> register type
  typedef struct packed {
    eth_idma_hw2reg_tx_fcs_reg_t tx_fcs; // [194:162]
    eth_idma_hw2reg_rx_fcs_reg_t rx_fcs; // [161:129]
    eth_idma_hw2reg_status_reg_t status; // [128:128]
    eth_idma_hw2reg_next_id_reg_t next_id; // [127:64]
    eth_idma_hw2reg_done_reg_t done; // [63:0]
  } eth_idma_hw2reg_t;

  // Register offsets
  parameter logic [BlockAw-1:0] ETH_IDMA_MACLO_ADDR_OFFSET = 7'h 0;
  parameter logic [BlockAw-1:0] ETH_IDMA_MACHI_MDIO_OFFSET = 7'h 8;
  parameter logic [BlockAw-1:0] ETH_IDMA_TX_FCS_OFFSET = 7'h 10;
  parameter logic [BlockAw-1:0] ETH_IDMA_RX_FCS_OFFSET = 7'h 18;
  parameter logic [BlockAw-1:0] ETH_IDMA_SRC_ADDR_OFFSET = 7'h 20;
  parameter logic [BlockAw-1:0] ETH_IDMA_DST_ADDR_OFFSET = 7'h 28;
  parameter logic [BlockAw-1:0] ETH_IDMA_NUM_BYTES_OFFSET = 7'h 30;
  parameter logic [BlockAw-1:0] ETH_IDMA_STATUS_OFFSET = 7'h 38;
  parameter logic [BlockAw-1:0] ETH_IDMA_NEXT_ID_OFFSET = 7'h 40;
  parameter logic [BlockAw-1:0] ETH_IDMA_DONE_OFFSET = 7'h 48;

  // Reset values for hwext registers and their fields
  parameter logic [0:0] ETH_IDMA_STATUS_RESVAL = 1'h 0;
  parameter logic [63:0] ETH_IDMA_NEXT_ID_RESVAL = 64'h 0;
  parameter logic [63:0] ETH_IDMA_DONE_RESVAL = 64'h 0;

  // Register index
  typedef enum int {
    ETH_IDMA_MACLO_ADDR,
    ETH_IDMA_MACHI_MDIO,
    ETH_IDMA_TX_FCS,
    ETH_IDMA_RX_FCS,
    ETH_IDMA_SRC_ADDR,
    ETH_IDMA_DST_ADDR,
    ETH_IDMA_NUM_BYTES,
    ETH_IDMA_STATUS,
    ETH_IDMA_NEXT_ID,
    ETH_IDMA_DONE
  } eth_idma_id_e;

  // Register width information to check illegal writes
  parameter logic [3:0] ETH_IDMA_PERMIT [10] = '{
    4'b 1111, // index[0] ETH_IDMA_MACLO_ADDR
    4'b 0111, // index[1] ETH_IDMA_MACHI_MDIO
    4'b 1111, // index[2] ETH_IDMA_TX_FCS
    4'b 1111, // index[3] ETH_IDMA_RX_FCS
    4'b 1111, // index[4] ETH_IDMA_SRC_ADDR
    4'b 1111, // index[5] ETH_IDMA_DST_ADDR
    4'b 1111, // index[6] ETH_IDMA_NUM_BYTES
    4'b 0001, // index[7] ETH_IDMA_STATUS
    4'b 1111, // index[8] ETH_IDMA_NEXT_ID
    4'b 1111  // index[9] ETH_IDMA_DONE
  };

endpackage

