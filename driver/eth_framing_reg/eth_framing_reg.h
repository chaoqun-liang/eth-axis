// Generated register defines for eth_framing

#ifndef _ETH_FRAMING_REG_DEFS_
#define _ETH_FRAMING_REG_DEFS_

#ifdef __cplusplus
extern "C" {
#endif
// Register width
#define ETH_FRAMING_PARAM_REG_WIDTH 32

// Configures the lower 4 bytes of the devices MAC address
#define ETH_FRAMING_CONFIG0_REG_OFFSET 0x0

// Configures the: upper 2 bytes of the devices MAC address, cooked flag,
// loopback flag, promiscuous flag, interupt request enable flag
#define ETH_FRAMING_CONFIG1_REG_OFFSET 0x4
#define ETH_FRAMING_CONFIG1_UPPER_MAC_ADDRESS_MASK 0xffff
#define ETH_FRAMING_CONFIG1_UPPER_MAC_ADDRESS_OFFSET 0
#define ETH_FRAMING_CONFIG1_UPPER_MAC_ADDRESS_FIELD \
  ((bitfield_field32_t) { .mask = ETH_FRAMING_CONFIG1_UPPER_MAC_ADDRESS_MASK, .index = ETH_FRAMING_CONFIG1_UPPER_MAC_ADDRESS_OFFSET })
#define ETH_FRAMING_CONFIG1_COOKED_BIT 16
#define ETH_FRAMING_CONFIG1_LOOPBACK_BIT 17
#define ETH_FRAMING_CONFIG1_SPARE_MASK 0xf
#define ETH_FRAMING_CONFIG1_SPARE_OFFSET 18
#define ETH_FRAMING_CONFIG1_SPARE_FIELD \
  ((bitfield_field32_t) { .mask = ETH_FRAMING_CONFIG1_SPARE_MASK, .index = ETH_FRAMING_CONFIG1_SPARE_OFFSET })
#define ETH_FRAMING_CONFIG1_PROMISCUOUS_BIT 22
#define ETH_FRAMING_CONFIG1_IRQ_EN_BIT 23

// Configures the: length of the packet to be sent, tx_enable flag, MDIO
// interface, last and first RX buffer byte location
#define ETH_FRAMING_CONFIG2_REG_OFFSET 0x8
#define ETH_FRAMING_CONFIG2_TX_PACKET_LENGTH_MASK 0x7ff
#define ETH_FRAMING_CONFIG2_TX_PACKET_LENGTH_OFFSET 0
#define ETH_FRAMING_CONFIG2_TX_PACKET_LENGTH_FIELD \
  ((bitfield_field32_t) { .mask = ETH_FRAMING_CONFIG2_TX_PACKET_LENGTH_MASK, .index = ETH_FRAMING_CONFIG2_TX_PACKET_LENGTH_OFFSET })
#define ETH_FRAMING_CONFIG2_TX_ENABLE_DLY_MASK 0xf
#define ETH_FRAMING_CONFIG2_TX_ENABLE_DLY_OFFSET 11
#define ETH_FRAMING_CONFIG2_TX_ENABLE_DLY_FIELD \
  ((bitfield_field32_t) { .mask = ETH_FRAMING_CONFIG2_TX_ENABLE_DLY_MASK, .index = ETH_FRAMING_CONFIG2_TX_ENABLE_DLY_OFFSET })
#define ETH_FRAMING_CONFIG2_PHY_MDCLK_BIT 15
#define ETH_FRAMING_CONFIG2_PHY_MDIO_O_BIT 16
#define ETH_FRAMING_CONFIG2_PHY_MDIO_OE_BIT 17
#define ETH_FRAMING_CONFIG2_LASTBUF_MASK 0xf
#define ETH_FRAMING_CONFIG2_LASTBUF_OFFSET 18
#define ETH_FRAMING_CONFIG2_LASTBUF_FIELD \
  ((bitfield_field32_t) { .mask = ETH_FRAMING_CONFIG2_LASTBUF_MASK, .index = ETH_FRAMING_CONFIG2_LASTBUF_OFFSET })
#define ETH_FRAMING_CONFIG2_FIRSTBUF_MASK 0xf
#define ETH_FRAMING_CONFIG2_FIRSTBUF_OFFSET 22
#define ETH_FRAMING_CONFIG2_FIRSTBUF_FIELD \
  ((bitfield_field32_t) { .mask = ETH_FRAMING_CONFIG2_FIRSTBUF_MASK, .index = ETH_FRAMING_CONFIG2_FIRSTBUF_OFFSET })

#ifdef __cplusplus
}  // extern "C"
#endif
#endif  // _ETH_FRAMING_REG_DEFS_
// End generated register defines for eth_framing