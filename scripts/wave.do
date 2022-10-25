onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /eth_tb/s_clk
add wave -noupdate /eth_tb/s_clk_200MHz
add wave -noupdate /eth_tb/s_clk_125MHz_0
add wave -noupdate /eth_tb/s_clk_125MHz_90
add wave -noupdate /eth_tb/s_rst_n
add wave -noupdate /eth_tb/done
add wave -noupdate /eth_tb/eth_rxck
add wave -noupdate /eth_tb/eth_rxctl
add wave -noupdate /eth_tb/eth_rxd
add wave -noupdate /eth_tb/eth_txck
add wave -noupdate /eth_tb/eth_txctl
add wave -noupdate /eth_tb/eth_txd
add wave -noupdate /eth_tb/eth_tx_rst_n
add wave -noupdate /eth_tb/eth_rx_rst_n
add wave -noupdate -group eth_rgmii_tx /eth_tb/i_eth_rgmii_tx/clk_i
add wave -noupdate -group eth_rgmii_tx /eth_tb/i_eth_rgmii_tx/clk_200MHz_i
add wave -noupdate -group eth_rgmii_tx /eth_tb/i_eth_rgmii_tx/rst_ni
add wave -noupdate -group eth_rgmii_tx /eth_tb/i_eth_rgmii_tx/eth_clk_i
add wave -noupdate -group eth_rgmii_tx /eth_tb/i_eth_rgmii_tx/eth_rxck
add wave -noupdate -group eth_rgmii_tx /eth_tb/i_eth_rgmii_tx/eth_rxctl
add wave -noupdate -group eth_rgmii_tx /eth_tb/i_eth_rgmii_tx/eth_rxd
add wave -noupdate -group eth_rgmii_tx /eth_tb/i_eth_rgmii_tx/eth_txck
add wave -noupdate -group eth_rgmii_tx /eth_tb/i_eth_rgmii_tx/eth_txctl
add wave -noupdate -group eth_rgmii_tx /eth_tb/i_eth_rgmii_tx/eth_txd
add wave -noupdate -group eth_rgmii_tx /eth_tb/i_eth_rgmii_tx/eth_rst_n
add wave -noupdate -group eth_rgmii_tx /eth_tb/i_eth_rgmii_tx/phy_tx_clk_i
add wave -noupdate -group eth_rgmii_tx /eth_tb/i_eth_rgmii_tx/eth_irq
add wave -noupdate -group eth_rgmii_tx /eth_tb/i_eth_rgmii_tx/eth_en
add wave -noupdate -group eth_rgmii_tx /eth_tb/i_eth_rgmii_tx/eth_we
add wave -noupdate -group eth_rgmii_tx /eth_tb/i_eth_rgmii_tx/eth_int_n
add wave -noupdate -group eth_rgmii_tx /eth_tb/i_eth_rgmii_tx/eth_pme_n
add wave -noupdate -group eth_rgmii_tx /eth_tb/i_eth_rgmii_tx/eth_mdio_i
add wave -noupdate -group eth_rgmii_tx /eth_tb/i_eth_rgmii_tx/eth_mdio_o
add wave -noupdate -group eth_rgmii_tx /eth_tb/i_eth_rgmii_tx/eth_mdio_oe
add wave -noupdate -group eth_rgmii_tx /eth_tb/i_eth_rgmii_tx/eth_addr
add wave -noupdate -group eth_rgmii_tx /eth_tb/i_eth_rgmii_tx/eth_wrdata
add wave -noupdate -group eth_rgmii_tx /eth_tb/i_eth_rgmii_tx/eth_rdata
add wave -noupdate -group eth_rgmii_tx /eth_tb/i_eth_rgmii_tx/eth_be
add wave -noupdate -group eth_rgmii_tx /eth_tb/i_eth_rgmii_tx/eth_mdc
add wave -noupdate -group axi2mem /eth_tb/i_eth_rgmii_tx/i_axi2rom/clk_i
add wave -noupdate -group axi2mem /eth_tb/i_eth_rgmii_tx/i_axi2rom/rst_ni
add wave -noupdate -group axi2mem /eth_tb/i_eth_rgmii_tx/i_axi2rom/req_o
add wave -noupdate -group axi2mem /eth_tb/i_eth_rgmii_tx/i_axi2rom/we_o
add wave -noupdate -group axi2mem /eth_tb/i_eth_rgmii_tx/i_axi2rom/addr_o
add wave -noupdate -group axi2mem -expand /eth_tb/i_eth_rgmii_tx/i_axi2rom/be_o
add wave -noupdate -group axi2mem /eth_tb/i_eth_rgmii_tx/i_axi2rom/data_o
add wave -noupdate -group axi2mem /eth_tb/i_eth_rgmii_tx/i_axi2rom/data_i
add wave -noupdate -group axi2mem /eth_tb/i_eth_rgmii_tx/i_axi2rom/state_d
add wave -noupdate -group axi2mem /eth_tb/i_eth_rgmii_tx/i_axi2rom/state_q
add wave -noupdate -group axi2mem /eth_tb/i_eth_rgmii_tx/i_axi2rom/ax_req_d
add wave -noupdate -group axi2mem /eth_tb/i_eth_rgmii_tx/i_axi2rom/ax_req_q
add wave -noupdate -group axi2mem /eth_tb/i_eth_rgmii_tx/i_axi2rom/req_addr_d
add wave -noupdate -group axi2mem /eth_tb/i_eth_rgmii_tx/i_axi2rom/req_addr_q
add wave -noupdate -group axi2mem /eth_tb/i_eth_rgmii_tx/i_axi2rom/cnt_d
add wave -noupdate -group axi2mem /eth_tb/i_eth_rgmii_tx/i_axi2rom/cnt_q
add wave -noupdate -group axi2mem /eth_tb/i_eth_rgmii_tx/i_axi2rom/aligned_address
add wave -noupdate -group axi2mem /eth_tb/i_eth_rgmii_tx/i_axi2rom/wrap_boundary
add wave -noupdate -group axi2mem /eth_tb/i_eth_rgmii_tx/i_axi2rom/upper_wrap_boundary
add wave -noupdate -group axi2mem /eth_tb/i_eth_rgmii_tx/i_axi2rom/cons_addr
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/msoc_clk
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/core_lsu_addr
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/core_lsu_wdata
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/core_lsu_be
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/ce_d
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/we_d
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/framing_sel
add wave -noupdate -group framing_top -radix hexadecimal /eth_tb/i_eth_rgmii_tx/eth_rgmii/framing_rdata
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/clk_int
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/rst_int
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/clk90_int
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/clk_200_int
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/phy_rx_clk
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/phy_rxd
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/phy_rx_ctl
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/phy_tx_clk
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/phy_txd
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/phy_tx_ctl
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/phy_reset_n
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/phy_int_n
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/phy_pme_n
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/phy_mdio_i
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/phy_mdio_o
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/phy_mdio_oe
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/phy_mdc
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/eth_irq
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/core_lsu_addr_dly
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/tx_enable_i
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/mac_gmii_tx_en
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/mac_address
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/rx_dest_mac
add wave -noupdate -group framing_top -radix binary /eth_tb/i_eth_rgmii_tx/eth_rgmii/tx_frame_addr
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/tx_packet_length
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/axis_tx_frame_size
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/ce_d_dly
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/avail
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/framing_rdata_pkt
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/framing_wdata_pkt
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/tx_enable_dly
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/firstbuf
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/nextbuf
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/lastbuf
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/last
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/byte_sync
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/sync
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/irq_en
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/tx_busy
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/m_enb
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/phy_mdclk
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/cooked
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/tx_enable_old
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/loopback
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/promiscuous
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/spare
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/rx_addr_axis
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/tx_axis_tvalid
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/tx_axis_tvalid_dly
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/tx_axis_tlast
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/tx_axis_tdata
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/tx_axis_tready
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/tx_axis_tuser
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/rx_axis_tdata
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/rx_axis_tvalid
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/rx_axis_tlast
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/rx_axis_tuser
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/tx_fcs_reg_rev
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/rx_fcs_reg_rev
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/rx_wr
add wave -noupdate -group framing_top -radix hexadecimal /eth_tb/i_eth_rgmii_tx/eth_rgmii/douta
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/tx_fcs_reg
add wave -noupdate -group framing_top /eth_tb/i_eth_rgmii_tx/eth_rgmii/rx_fcs_reg
add wave -noupdate -group dualmem_widen /eth_tb/i_eth_rgmii_tx/eth_rgmii/RAMB16_inst_tx/clka
add wave -noupdate -group dualmem_widen /eth_tb/i_eth_rgmii_tx/eth_rgmii/RAMB16_inst_tx/clkb
add wave -noupdate -group dualmem_widen /eth_tb/i_eth_rgmii_tx/eth_rgmii/RAMB16_inst_tx/dina
add wave -noupdate -group dualmem_widen /eth_tb/i_eth_rgmii_tx/eth_rgmii/RAMB16_inst_tx/dinb
add wave -noupdate -group dualmem_widen /eth_tb/i_eth_rgmii_tx/eth_rgmii/RAMB16_inst_tx/addra
add wave -noupdate -group dualmem_widen /eth_tb/i_eth_rgmii_tx/eth_rgmii/RAMB16_inst_tx/addrb
add wave -noupdate -group dualmem_widen /eth_tb/i_eth_rgmii_tx/eth_rgmii/RAMB16_inst_tx/wea
add wave -noupdate -group dualmem_widen /eth_tb/i_eth_rgmii_tx/eth_rgmii/RAMB16_inst_tx/web
add wave -noupdate -group dualmem_widen /eth_tb/i_eth_rgmii_tx/eth_rgmii/RAMB16_inst_tx/ena
add wave -noupdate -group dualmem_widen /eth_tb/i_eth_rgmii_tx/eth_rgmii/RAMB16_inst_tx/enb
add wave -noupdate -group dualmem_widen /eth_tb/i_eth_rgmii_tx/eth_rgmii/RAMB16_inst_tx/douta
add wave -noupdate -group dualmem_widen /eth_tb/i_eth_rgmii_tx/eth_rgmii/RAMB16_inst_tx/doutb
add wave -noupdate -group dualmem_widen /eth_tb/i_eth_rgmii_tx/eth_rgmii/RAMB16_inst_tx/dout
add wave -noupdate -group asym_ram0 {/eth_tb/i_eth_rgmii_tx/eth_rgmii/RAMB16_inst_tx/genblk1[0]/asym_ram_tdp_read_first_inst/clkA}
add wave -noupdate -group asym_ram0 {/eth_tb/i_eth_rgmii_tx/eth_rgmii/RAMB16_inst_tx/genblk1[0]/asym_ram_tdp_read_first_inst/clkB}
add wave -noupdate -group asym_ram0 {/eth_tb/i_eth_rgmii_tx/eth_rgmii/RAMB16_inst_tx/genblk1[0]/asym_ram_tdp_read_first_inst/weA}
add wave -noupdate -group asym_ram0 {/eth_tb/i_eth_rgmii_tx/eth_rgmii/RAMB16_inst_tx/genblk1[0]/asym_ram_tdp_read_first_inst/weB}
add wave -noupdate -group asym_ram0 {/eth_tb/i_eth_rgmii_tx/eth_rgmii/RAMB16_inst_tx/genblk1[0]/asym_ram_tdp_read_first_inst/enaA}
add wave -noupdate -group asym_ram0 {/eth_tb/i_eth_rgmii_tx/eth_rgmii/RAMB16_inst_tx/genblk1[0]/asym_ram_tdp_read_first_inst/enaB}
add wave -noupdate -group asym_ram0 {/eth_tb/i_eth_rgmii_tx/eth_rgmii/RAMB16_inst_tx/genblk1[0]/asym_ram_tdp_read_first_inst/addrA}
add wave -noupdate -group asym_ram0 {/eth_tb/i_eth_rgmii_tx/eth_rgmii/RAMB16_inst_tx/genblk1[0]/asym_ram_tdp_read_first_inst/addrB}
add wave -noupdate -group asym_ram0 {/eth_tb/i_eth_rgmii_tx/eth_rgmii/RAMB16_inst_tx/genblk1[0]/asym_ram_tdp_read_first_inst/diA}
add wave -noupdate -group asym_ram0 {/eth_tb/i_eth_rgmii_tx/eth_rgmii/RAMB16_inst_tx/genblk1[0]/asym_ram_tdp_read_first_inst/diB}
add wave -noupdate -group asym_ram0 {/eth_tb/i_eth_rgmii_tx/eth_rgmii/RAMB16_inst_tx/genblk1[0]/asym_ram_tdp_read_first_inst/doA}
add wave -noupdate -group asym_ram0 {/eth_tb/i_eth_rgmii_tx/eth_rgmii/RAMB16_inst_tx/genblk1[0]/asym_ram_tdp_read_first_inst/doB}
add wave -noupdate -group asym_ram0 {/eth_tb/i_eth_rgmii_tx/eth_rgmii/RAMB16_inst_tx/genblk1[0]/asym_ram_tdp_read_first_inst/readA}
add wave -noupdate -group asym_ram0 {/eth_tb/i_eth_rgmii_tx/eth_rgmii/RAMB16_inst_tx/genblk1[0]/asym_ram_tdp_read_first_inst/readB}
add wave -noupdate -group asym_ram0 {/eth_tb/i_eth_rgmii_tx/eth_rgmii/RAMB16_inst_tx/genblk1[0]/asym_ram_tdp_read_first_inst/RAM}
add wave -noupdate -group asym_ram1 {/eth_tb/i_eth_rgmii_tx/eth_rgmii/RAMB16_inst_tx/genblk1[1]/asym_ram_tdp_read_first_inst/clkA}
add wave -noupdate -group asym_ram1 {/eth_tb/i_eth_rgmii_tx/eth_rgmii/RAMB16_inst_tx/genblk1[1]/asym_ram_tdp_read_first_inst/clkB}
add wave -noupdate -group asym_ram1 {/eth_tb/i_eth_rgmii_tx/eth_rgmii/RAMB16_inst_tx/genblk1[1]/asym_ram_tdp_read_first_inst/weA}
add wave -noupdate -group asym_ram1 {/eth_tb/i_eth_rgmii_tx/eth_rgmii/RAMB16_inst_tx/genblk1[1]/asym_ram_tdp_read_first_inst/weB}
add wave -noupdate -group asym_ram1 {/eth_tb/i_eth_rgmii_tx/eth_rgmii/RAMB16_inst_tx/genblk1[1]/asym_ram_tdp_read_first_inst/enaA}
add wave -noupdate -group asym_ram1 {/eth_tb/i_eth_rgmii_tx/eth_rgmii/RAMB16_inst_tx/genblk1[1]/asym_ram_tdp_read_first_inst/enaB}
add wave -noupdate -group asym_ram1 {/eth_tb/i_eth_rgmii_tx/eth_rgmii/RAMB16_inst_tx/genblk1[1]/asym_ram_tdp_read_first_inst/addrA}
add wave -noupdate -group asym_ram1 {/eth_tb/i_eth_rgmii_tx/eth_rgmii/RAMB16_inst_tx/genblk1[1]/asym_ram_tdp_read_first_inst/addrB}
add wave -noupdate -group asym_ram1 {/eth_tb/i_eth_rgmii_tx/eth_rgmii/RAMB16_inst_tx/genblk1[1]/asym_ram_tdp_read_first_inst/diA}
add wave -noupdate -group asym_ram1 {/eth_tb/i_eth_rgmii_tx/eth_rgmii/RAMB16_inst_tx/genblk1[1]/asym_ram_tdp_read_first_inst/diB}
add wave -noupdate -group asym_ram1 {/eth_tb/i_eth_rgmii_tx/eth_rgmii/RAMB16_inst_tx/genblk1[1]/asym_ram_tdp_read_first_inst/doA}
add wave -noupdate -group asym_ram1 {/eth_tb/i_eth_rgmii_tx/eth_rgmii/RAMB16_inst_tx/genblk1[1]/asym_ram_tdp_read_first_inst/doB}
add wave -noupdate -group asym_ram1 {/eth_tb/i_eth_rgmii_tx/eth_rgmii/RAMB16_inst_tx/genblk1[1]/asym_ram_tdp_read_first_inst/readA}
add wave -noupdate -group asym_ram1 {/eth_tb/i_eth_rgmii_tx/eth_rgmii/RAMB16_inst_tx/genblk1[1]/asym_ram_tdp_read_first_inst/readB}
add wave -noupdate -group asym_ram1 {/eth_tb/i_eth_rgmii_tx/eth_rgmii/RAMB16_inst_tx/genblk1[1]/asym_ram_tdp_read_first_inst/RAM}
add wave -noupdate -group axis_gmii_tx /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/eth_mac_1g_rgmii_inst/eth_mac_1g_inst/axis_gmii_tx_inst/clk
add wave -noupdate -group axis_gmii_tx /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/eth_mac_1g_rgmii_inst/eth_mac_1g_inst/axis_gmii_tx_inst/rst
add wave -noupdate -group axis_gmii_tx /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/eth_mac_1g_rgmii_inst/eth_mac_1g_inst/axis_gmii_tx_inst/s_axis_tdata
add wave -noupdate -group axis_gmii_tx /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/eth_mac_1g_rgmii_inst/eth_mac_1g_inst/axis_gmii_tx_inst/s_axis_tvalid
add wave -noupdate -group axis_gmii_tx /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/eth_mac_1g_rgmii_inst/eth_mac_1g_inst/axis_gmii_tx_inst/s_axis_tready
add wave -noupdate -group axis_gmii_tx /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/eth_mac_1g_rgmii_inst/eth_mac_1g_inst/axis_gmii_tx_inst/s_axis_tlast
add wave -noupdate -group axis_gmii_tx /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/eth_mac_1g_rgmii_inst/eth_mac_1g_inst/axis_gmii_tx_inst/s_axis_tuser
add wave -noupdate -group axis_gmii_tx /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/eth_mac_1g_rgmii_inst/eth_mac_1g_inst/axis_gmii_tx_inst/gmii_txd
add wave -noupdate -group axis_gmii_tx /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/eth_mac_1g_rgmii_inst/eth_mac_1g_inst/axis_gmii_tx_inst/gmii_tx_en
add wave -noupdate -group axis_gmii_tx /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/eth_mac_1g_rgmii_inst/eth_mac_1g_inst/axis_gmii_tx_inst/gmii_tx_er
add wave -noupdate -group axis_gmii_tx /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/eth_mac_1g_rgmii_inst/eth_mac_1g_inst/axis_gmii_tx_inst/clk_enable
add wave -noupdate -group axis_gmii_tx /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/eth_mac_1g_rgmii_inst/eth_mac_1g_inst/axis_gmii_tx_inst/mii_select
add wave -noupdate -group axis_gmii_tx /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/eth_mac_1g_rgmii_inst/eth_mac_1g_inst/axis_gmii_tx_inst/ifg_delay
add wave -noupdate -group axis_gmii_tx /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/eth_mac_1g_rgmii_inst/eth_mac_1g_inst/axis_gmii_tx_inst/fcs_reg
add wave -noupdate -group axis_gmii_tx /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/eth_mac_1g_rgmii_inst/eth_mac_1g_inst/axis_gmii_tx_inst/state_reg
add wave -noupdate -group axis_gmii_tx /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/eth_mac_1g_rgmii_inst/eth_mac_1g_inst/axis_gmii_tx_inst/state_next
add wave -noupdate -group axis_gmii_tx /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/eth_mac_1g_rgmii_inst/eth_mac_1g_inst/axis_gmii_tx_inst/reset_crc
add wave -noupdate -group axis_gmii_tx /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/eth_mac_1g_rgmii_inst/eth_mac_1g_inst/axis_gmii_tx_inst/update_crc
add wave -noupdate -group axis_gmii_tx /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/eth_mac_1g_rgmii_inst/eth_mac_1g_inst/axis_gmii_tx_inst/s_tdata_reg
add wave -noupdate -group axis_gmii_tx /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/eth_mac_1g_rgmii_inst/eth_mac_1g_inst/axis_gmii_tx_inst/s_tdata_next
add wave -noupdate -group axis_gmii_tx /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/eth_mac_1g_rgmii_inst/eth_mac_1g_inst/axis_gmii_tx_inst/ifg_reg
add wave -noupdate -group axis_gmii_tx /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/eth_mac_1g_rgmii_inst/eth_mac_1g_inst/axis_gmii_tx_inst/ifg_next
add wave -noupdate -group axis_gmii_tx /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/eth_mac_1g_rgmii_inst/eth_mac_1g_inst/axis_gmii_tx_inst/mii_odd_reg
add wave -noupdate -group axis_gmii_tx /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/eth_mac_1g_rgmii_inst/eth_mac_1g_inst/axis_gmii_tx_inst/mii_odd_next
add wave -noupdate -group axis_gmii_tx /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/eth_mac_1g_rgmii_inst/eth_mac_1g_inst/axis_gmii_tx_inst/mii_msn_reg
add wave -noupdate -group axis_gmii_tx /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/eth_mac_1g_rgmii_inst/eth_mac_1g_inst/axis_gmii_tx_inst/mii_msn_next
add wave -noupdate -group axis_gmii_tx -radix hexadecimal /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/eth_mac_1g_rgmii_inst/eth_mac_1g_inst/axis_gmii_tx_inst/frame_ptr_reg
add wave -noupdate -group axis_gmii_tx /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/eth_mac_1g_rgmii_inst/eth_mac_1g_inst/axis_gmii_tx_inst/frame_ptr_next
add wave -noupdate -group axis_gmii_tx /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/eth_mac_1g_rgmii_inst/eth_mac_1g_inst/axis_gmii_tx_inst/gmii_txd_reg
add wave -noupdate -group axis_gmii_tx /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/eth_mac_1g_rgmii_inst/eth_mac_1g_inst/axis_gmii_tx_inst/gmii_txd_next
add wave -noupdate -group axis_gmii_tx /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/eth_mac_1g_rgmii_inst/eth_mac_1g_inst/axis_gmii_tx_inst/gmii_tx_en_reg
add wave -noupdate -group axis_gmii_tx /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/eth_mac_1g_rgmii_inst/eth_mac_1g_inst/axis_gmii_tx_inst/gmii_tx_en_next
add wave -noupdate -group axis_gmii_tx /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/eth_mac_1g_rgmii_inst/eth_mac_1g_inst/axis_gmii_tx_inst/gmii_tx_er_reg
add wave -noupdate -group axis_gmii_tx /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/eth_mac_1g_rgmii_inst/eth_mac_1g_inst/axis_gmii_tx_inst/gmii_tx_er_next
add wave -noupdate -group axis_gmii_tx /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/eth_mac_1g_rgmii_inst/eth_mac_1g_inst/axis_gmii_tx_inst/s_axis_tready_reg
add wave -noupdate -group axis_gmii_tx /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/eth_mac_1g_rgmii_inst/eth_mac_1g_inst/axis_gmii_tx_inst/s_axis_tready_next
add wave -noupdate -group axis_gmii_tx /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/eth_mac_1g_rgmii_inst/eth_mac_1g_inst/axis_gmii_tx_inst/crc_state
add wave -noupdate -group axis_gmii_tx /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/eth_mac_1g_rgmii_inst/eth_mac_1g_inst/axis_gmii_tx_inst/fcs_next
add wave -noupdate -group axis_gmii_tx /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/eth_mac_1g_rgmii_inst/eth_mac_1g_inst/axis_gmii_tx_inst/crc_next
add wave -noupdate -group tx_fifo /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/tx_fifo/async_rst
add wave -noupdate -group tx_fifo /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/tx_fifo/s_clk
add wave -noupdate -group tx_fifo /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/tx_fifo/s_axis_tdata
add wave -noupdate -group tx_fifo /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/tx_fifo/s_axis_tkeep
add wave -noupdate -group tx_fifo /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/tx_fifo/s_axis_tvalid
add wave -noupdate -group tx_fifo /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/tx_fifo/s_axis_tready
add wave -noupdate -group tx_fifo /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/tx_fifo/s_axis_tlast
add wave -noupdate -group tx_fifo /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/tx_fifo/s_axis_tid
add wave -noupdate -group tx_fifo /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/tx_fifo/s_axis_tdest
add wave -noupdate -group tx_fifo /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/tx_fifo/s_axis_tuser
add wave -noupdate -group tx_fifo /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/tx_fifo/m_clk
add wave -noupdate -group tx_fifo /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/tx_fifo/m_axis_tdata
add wave -noupdate -group tx_fifo /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/tx_fifo/m_axis_tkeep
add wave -noupdate -group tx_fifo /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/tx_fifo/m_axis_tvalid
add wave -noupdate -group tx_fifo /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/tx_fifo/m_axis_tready
add wave -noupdate -group tx_fifo /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/tx_fifo/m_axis_tlast
add wave -noupdate -group tx_fifo /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/tx_fifo/m_axis_tid
add wave -noupdate -group tx_fifo /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/tx_fifo/m_axis_tdest
add wave -noupdate -group tx_fifo /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/tx_fifo/m_axis_tuser
add wave -noupdate -group tx_fifo /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/tx_fifo/s_status_overflow
add wave -noupdate -group tx_fifo /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/tx_fifo/s_status_bad_frame
add wave -noupdate -group tx_fifo /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/tx_fifo/s_status_good_frame
add wave -noupdate -group tx_fifo /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/tx_fifo/m_status_overflow
add wave -noupdate -group tx_fifo /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/tx_fifo/m_status_bad_frame
add wave -noupdate -group tx_fifo /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/tx_fifo/m_status_good_frame
add wave -noupdate -group tx_fifo /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/tx_fifo/wr_ptr_reg
add wave -noupdate -group tx_fifo /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/tx_fifo/wr_ptr_next
add wave -noupdate -group tx_fifo /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/tx_fifo/wr_ptr_cur_reg
add wave -noupdate -group tx_fifo /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/tx_fifo/wr_ptr_cur_next
add wave -noupdate -group tx_fifo /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/tx_fifo/wr_ptr_gray_reg
add wave -noupdate -group tx_fifo /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/tx_fifo/wr_ptr_gray_next
add wave -noupdate -group tx_fifo /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/tx_fifo/wr_ptr_cur_gray_reg
add wave -noupdate -group tx_fifo /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/tx_fifo/wr_ptr_cur_gray_next
add wave -noupdate -group tx_fifo /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/tx_fifo/wr_addr_reg
add wave -noupdate -group tx_fifo /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/tx_fifo/rd_ptr_reg
add wave -noupdate -group tx_fifo /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/tx_fifo/rd_ptr_next
add wave -noupdate -group tx_fifo /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/tx_fifo/rd_ptr_gray_reg
add wave -noupdate -group tx_fifo /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/tx_fifo/rd_ptr_gray_next
add wave -noupdate -group tx_fifo /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/tx_fifo/rd_addr_reg
add wave -noupdate -group tx_fifo /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/tx_fifo/wr_ptr_gray_sync1_reg
add wave -noupdate -group tx_fifo /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/tx_fifo/wr_ptr_gray_sync2_reg
add wave -noupdate -group tx_fifo /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/tx_fifo/rd_ptr_gray_sync1_reg
add wave -noupdate -group tx_fifo /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/tx_fifo/rd_ptr_gray_sync2_reg
add wave -noupdate -group tx_fifo /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/tx_fifo/s_rst_sync1_reg
add wave -noupdate -group tx_fifo /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/tx_fifo/s_rst_sync2_reg
add wave -noupdate -group tx_fifo /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/tx_fifo/s_rst_sync3_reg
add wave -noupdate -group tx_fifo /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/tx_fifo/m_rst_sync1_reg
add wave -noupdate -group tx_fifo /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/tx_fifo/m_rst_sync2_reg
add wave -noupdate -group tx_fifo /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/tx_fifo/m_rst_sync3_reg
add wave -noupdate -group tx_fifo /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/tx_fifo/mem_read_data_reg
add wave -noupdate -group tx_fifo /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/tx_fifo/mem_read_data_valid_reg
add wave -noupdate -group tx_fifo /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/tx_fifo/mem_read_data_valid_next
add wave -noupdate -group tx_fifo /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/tx_fifo/s_axis
add wave -noupdate -group tx_fifo /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/tx_fifo/m_axis_reg
add wave -noupdate -group tx_fifo /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/tx_fifo/mem
add wave -noupdate -group tx_fifo /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/tx_fifo/m_axis_tvalid_reg
add wave -noupdate -group tx_fifo /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/tx_fifo/m_axis_tvalid_next
add wave -noupdate -group tx_fifo /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/tx_fifo/full
add wave -noupdate -group tx_fifo /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/tx_fifo/full_cur
add wave -noupdate -group tx_fifo /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/tx_fifo/empty
add wave -noupdate -group tx_fifo /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/tx_fifo/full_wr
add wave -noupdate -group tx_fifo /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/tx_fifo/write
add wave -noupdate -group tx_fifo /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/tx_fifo/read
add wave -noupdate -group tx_fifo /eth_tb/i_eth_rgmii_tx/eth_rgmii/rgmii_soc1/core_inst/eth_mac_inst/tx_fifo/store_output
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 2} {588 ns} 0} {{Cursor 3} {1862 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 240
configure wave -valuecolwidth 112
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {464 ns} {712 ns}
