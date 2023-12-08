// Generated register defines for eth_idma

#ifndef _ETH_IDMA_REG_DEFS_
#define _ETH_IDMA_REG_DEFS_

#ifdef __cplusplus
extern "C" {
#endif
// Register width
#define ETH_IDMA_PARAM_REG_WIDTH 64

// Configures the lower 4 bytes of the devices MAC address
#define ETH_IDMA_MACLO_ADDR_REG_OFFSET 0x0
#define ETH_IDMA_MACLO_ADDR_LOWER_MAC_ADDRESS_MASK 0xffffffff
#define ETH_IDMA_MACLO_ADDR_LOWER_MAC_ADDRESS_OFFSET 0
#define ETH_IDMA_MACLO_ADDR_LOWER_MAC_ADDRESS_FIELD \
  ((bitfield_field32_t) { .mask = ETH_IDMA_MACLO_ADDR_LOWER_MAC_ADDRESS_MASK, .index = ETH_IDMA_MACLO_ADDR_LOWER_MAC_ADDRESS_OFFSET })

// Configures the: upper 2 bytes of the devices MAC address, promiscuous
// flag, MDIO interface
#define ETH_IDMA_MACHI_MDIO_REG_OFFSET 0x8
#define ETH_IDMA_MACHI_MDIO_UPPER_MAC_ADDRESS_MASK 0xffff
#define ETH_IDMA_MACHI_MDIO_UPPER_MAC_ADDRESS_OFFSET 0
#define ETH_IDMA_MACHI_MDIO_UPPER_MAC_ADDRESS_FIELD \
  ((bitfield_field32_t) { .mask = ETH_IDMA_MACHI_MDIO_UPPER_MAC_ADDRESS_MASK, .index = ETH_IDMA_MACHI_MDIO_UPPER_MAC_ADDRESS_OFFSET })
#define ETH_IDMA_MACHI_MDIO_PROMISCUOUS_BIT 16
#define ETH_IDMA_MACHI_MDIO_PHY_MDCLK_BIT 17
#define ETH_IDMA_MACHI_MDIO_PHY_MDIO_O_BIT 18
#define ETH_IDMA_MACHI_MDIO_PHY_MDIO_OE_BIT 19

// The FCS TX status
#define ETH_IDMA_TX_FCS_REG_OFFSET 0x10
#define ETH_IDMA_TX_FCS_TX_FCS_REG_MASK 0xffffffff
#define ETH_IDMA_TX_FCS_TX_FCS_REG_OFFSET 0
#define ETH_IDMA_TX_FCS_TX_FCS_REG_FIELD \
  ((bitfield_field32_t) { .mask = ETH_IDMA_TX_FCS_TX_FCS_REG_MASK, .index = ETH_IDMA_TX_FCS_TX_FCS_REG_OFFSET })

// The FCS RX status
#define ETH_IDMA_RX_FCS_REG_OFFSET 0x18
#define ETH_IDMA_RX_FCS_RX_FCS_REG_MASK 0xffffffff
#define ETH_IDMA_RX_FCS_RX_FCS_REG_OFFSET 0
#define ETH_IDMA_RX_FCS_RX_FCS_REG_FIELD \
  ((bitfield_field32_t) { .mask = ETH_IDMA_RX_FCS_RX_FCS_REG_MASK, .index = ETH_IDMA_RX_FCS_RX_FCS_REG_OFFSET })

// Source Address
#define ETH_IDMA_SRC_ADDR_REG_OFFSET 0x20
#define ETH_IDMA_SRC_ADDR_SRC_ADDR_MASK 0xffffffff
#define ETH_IDMA_SRC_ADDR_SRC_ADDR_OFFSET 0
#define ETH_IDMA_SRC_ADDR_SRC_ADDR_FIELD \
  ((bitfield_field32_t) { .mask = ETH_IDMA_SRC_ADDR_SRC_ADDR_MASK, .index = ETH_IDMA_SRC_ADDR_SRC_ADDR_OFFSET })

// Destination Address
#define ETH_IDMA_DST_ADDR_REG_OFFSET 0x28
#define ETH_IDMA_DST_ADDR_DST_ADDR_MASK 0xffffffff
#define ETH_IDMA_DST_ADDR_DST_ADDR_OFFSET 0
#define ETH_IDMA_DST_ADDR_DST_ADDR_FIELD \
  ((bitfield_field32_t) { .mask = ETH_IDMA_DST_ADDR_DST_ADDR_MASK, .index = ETH_IDMA_DST_ADDR_DST_ADDR_OFFSET })

// Number of bytes
#define ETH_IDMA_NUM_BYTES_REG_OFFSET 0x30
#define ETH_IDMA_NUM_BYTES_NUM_BYTES_MASK 0xffffffff
#define ETH_IDMA_NUM_BYTES_NUM_BYTES_OFFSET 0
#define ETH_IDMA_NUM_BYTES_NUM_BYTES_FIELD \
  ((bitfield_field32_t) { .mask = ETH_IDMA_NUM_BYTES_NUM_BYTES_MASK, .index = ETH_IDMA_NUM_BYTES_NUM_BYTES_OFFSET })

// DMA Status
#define ETH_IDMA_STATUS_REG_OFFSET 0x38
#define ETH_IDMA_STATUS_BUSY_BIT 0

// Next ID, launches transfer, returns 0 if transfer not set up properly.
#define ETH_IDMA_NEXT_ID_REG_OFFSET 0x40

// Get ID of finished transactions.
#define ETH_IDMA_DONE_REG_OFFSET 0x48

#ifdef __cplusplus
}  // extern "C"
#endif
#endif  // _ETH_IDMA_REG_DEFS_
// End generated register defines for eth_idma