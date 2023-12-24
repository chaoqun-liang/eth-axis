onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group tx_backend /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/clk_i
add wave -noupdate -group tx_backend /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/rst_ni
add wave -noupdate -group tx_backend /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/testmode_i
add wave -noupdate -group tx_backend -expand -subitemconfig {/eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/idma_req_i.opt -expand} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/idma_req_i
add wave -noupdate -group tx_backend /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/req_valid_i
add wave -noupdate -group tx_backend /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/req_ready_o
add wave -noupdate -group tx_backend /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/idma_rsp_o
add wave -noupdate -group tx_backend /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/rsp_valid_o
add wave -noupdate -group tx_backend /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/rsp_ready_i
add wave -noupdate -group tx_backend /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/idma_eh_req_i
add wave -noupdate -group tx_backend /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/eh_req_valid_i
add wave -noupdate -group tx_backend /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/eh_req_ready_o
add wave -noupdate -group tx_backend /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/axi_read_req_o
add wave -noupdate -group tx_backend /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/axi_read_rsp_i
add wave -noupdate -group tx_backend /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/axis_read_req_o
add wave -noupdate -group tx_backend /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/axis_read_rsp_i
add wave -noupdate -group tx_backend /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/axi_write_req_o
add wave -noupdate -group tx_backend /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/axi_write_rsp_i
add wave -noupdate -group tx_backend /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/axis_write_req_o
add wave -noupdate -group tx_backend /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/axis_write_rsp_i
add wave -noupdate -group tx_backend /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/busy_o
add wave -noupdate -group tx_backend /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/dp_busy
add wave -noupdate -group tx_backend /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/dp_poison
add wave -noupdate -group tx_backend /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/r_req
add wave -noupdate -group tx_backend /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/w_req
add wave -noupdate -group tx_backend /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/r_valid
add wave -noupdate -group tx_backend /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/w_valid
add wave -noupdate -group tx_backend /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/r_ready
add wave -noupdate -group tx_backend /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/w_ready
add wave -noupdate -group tx_backend /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/r_meta_req_tagged
add wave -noupdate -group tx_backend /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/w_meta_req_tagged
add wave -noupdate -group tx_backend /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/w_last_burst
add wave -noupdate -group tx_backend /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/w_last_ready
add wave -noupdate -group tx_backend /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/w_super_last
add wave -noupdate -group tx_backend /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/r_dp_req_in_ready
add wave -noupdate -group tx_backend /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/w_dp_req_in_ready
add wave -noupdate -group tx_backend /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/r_dp_req_out_valid
add wave -noupdate -group tx_backend /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/w_dp_req_out_valid
add wave -noupdate -group tx_backend /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/r_dp_req_out_ready
add wave -noupdate -group tx_backend /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/w_dp_req_out_ready
add wave -noupdate -group tx_backend /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/r_dp_req_out
add wave -noupdate -group tx_backend /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/w_dp_req_out
add wave -noupdate -group tx_backend /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/r_dp_rsp
add wave -noupdate -group tx_backend /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/w_dp_rsp
add wave -noupdate -group tx_backend /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/r_dp_rsp_valid
add wave -noupdate -group tx_backend /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/w_dp_rsp_valid
add wave -noupdate -group tx_backend /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/r_dp_rsp_ready
add wave -noupdate -group tx_backend /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/w_dp_rsp_ready
add wave -noupdate -group tx_backend /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/ar_ready
add wave -noupdate -group tx_backend /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/ar_ready_dp
add wave -noupdate -group tx_backend /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/aw_ready
add wave -noupdate -group tx_backend /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/aw_ready_dp
add wave -noupdate -group tx_backend /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/aw_valid_dp
add wave -noupdate -group tx_backend /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/ar_valid_dp
add wave -noupdate -group tx_backend /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/aw_req_dp
add wave -noupdate -group tx_backend /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/ar_req_dp
add wave -noupdate -group tx_backend /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/legalizer_flush
add wave -noupdate -group tx_backend /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/legalizer_kill
add wave -noupdate -group tx_backend /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/is_length_zero
add wave -noupdate -group tx_backend /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/req_valid
add wave -noupdate -group tx_backend /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/idma_rsp
add wave -noupdate -group tx_backend /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/rsp_valid
add wave -noupdate -group tx_backend /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/rsp_ready
add wave -noupdate -group tx_backend /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/r_chan_valid
add wave -noupdate -group tx_backend /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/r_chan_ready
add wave -noupdate -group tx_eth /eth_idma_tb/i_tx_eth_idma_wrap/i_eth_top/clk_i
add wave -noupdate -group tx_eth /eth_idma_tb/i_tx_eth_idma_wrap/i_eth_top/rst_ni
add wave -noupdate -group tx_eth /eth_idma_tb/i_tx_eth_idma_wrap/i_eth_top/clk90_int
add wave -noupdate -group tx_eth /eth_idma_tb/i_tx_eth_idma_wrap/i_eth_top/clk_200_int
add wave -noupdate -group tx_eth /eth_idma_tb/i_tx_eth_idma_wrap/i_eth_top/phy_rx_clk
add wave -noupdate -group tx_eth /eth_idma_tb/i_tx_eth_idma_wrap/i_eth_top/phy_rxd
add wave -noupdate -group tx_eth /eth_idma_tb/i_tx_eth_idma_wrap/i_eth_top/phy_rx_ctl
add wave -noupdate -group tx_eth /eth_idma_tb/i_tx_eth_idma_wrap/i_eth_top/phy_tx_clk
add wave -noupdate -group tx_eth /eth_idma_tb/i_tx_eth_idma_wrap/i_eth_top/phy_txd
add wave -noupdate -group tx_eth /eth_idma_tb/i_tx_eth_idma_wrap/i_eth_top/phy_tx_ctl
add wave -noupdate -group tx_eth /eth_idma_tb/i_tx_eth_idma_wrap/i_eth_top/phy_reset_n
add wave -noupdate -group tx_eth /eth_idma_tb/i_tx_eth_idma_wrap/i_eth_top/phy_int_n
add wave -noupdate -group tx_eth /eth_idma_tb/i_tx_eth_idma_wrap/i_eth_top/phy_pme_n
add wave -noupdate -group tx_eth /eth_idma_tb/i_tx_eth_idma_wrap/i_eth_top/phy_mdio_i
add wave -noupdate -group tx_eth /eth_idma_tb/i_tx_eth_idma_wrap/i_eth_top/phy_mdio_o
add wave -noupdate -group tx_eth /eth_idma_tb/i_tx_eth_idma_wrap/i_eth_top/phy_mdio_oe
add wave -noupdate -group tx_eth /eth_idma_tb/i_tx_eth_idma_wrap/i_eth_top/phy_mdc
add wave -noupdate -group tx_eth /eth_idma_tb/i_tx_eth_idma_wrap/i_eth_top/tx_axis_req_i
add wave -noupdate -group tx_eth /eth_idma_tb/i_tx_eth_idma_wrap/i_eth_top/tx_axis_rsp_o
add wave -noupdate -group tx_eth /eth_idma_tb/i_tx_eth_idma_wrap/i_eth_top/rx_axis_req_o
add wave -noupdate -group tx_eth /eth_idma_tb/i_tx_eth_idma_wrap/i_eth_top/rx_axis_rsp_i
add wave -noupdate -group tx_eth /eth_idma_tb/i_tx_eth_idma_wrap/i_eth_top/reg2hw_i
add wave -noupdate -group tx_eth /eth_idma_tb/i_tx_eth_idma_wrap/i_eth_top/hw2reg_o
add wave -noupdate -group tx_eth /eth_idma_tb/i_tx_eth_idma_wrap/i_eth_top/s_framing_tx_req
add wave -noupdate -group tx_eth /eth_idma_tb/i_tx_eth_idma_wrap/i_eth_top/s_framing_rx_req
add wave -noupdate -group tx_eth /eth_idma_tb/i_tx_eth_idma_wrap/i_eth_top/s_framing_tx_rsp
add wave -noupdate -group tx_eth /eth_idma_tb/i_tx_eth_idma_wrap/i_eth_top/s_framing_rx_rsp
add wave -noupdate -group tb /eth_idma_tb/s_clk
add wave -noupdate -group tb /eth_idma_tb/s_clk_125MHz_0
add wave -noupdate -group tb /eth_idma_tb/s_clk_125MHz_90
add wave -noupdate -group tb /eth_idma_tb/s_clk_200MHz
add wave -noupdate -group tb /eth_idma_tb/s_rst_n
add wave -noupdate -group tb /eth_idma_tb/done
add wave -noupdate -group tb /eth_idma_tb/eth_rxck
add wave -noupdate -group tb /eth_idma_tb/eth_rxctl
add wave -noupdate -group tb /eth_idma_tb/eth_rxd
add wave -noupdate -group tb /eth_idma_tb/eth_txck
add wave -noupdate -group tb /eth_idma_tb/eth_txctl
add wave -noupdate -group tb /eth_idma_tb/eth_txd
add wave -noupdate -group tb /eth_idma_tb/eth_tx_rstn
add wave -noupdate -group tb /eth_idma_tb/eth_rx_rstn
add wave -noupdate -group tb /eth_idma_tb/tx_idma_req_valid
add wave -noupdate -group tb /eth_idma_tb/tx_idma_req_ready
add wave -noupdate -group tb /eth_idma_tb/tx_idma_rsp_valid
add wave -noupdate -group tb /eth_idma_tb/tx_idma_rsp_ready
add wave -noupdate -group tb /eth_idma_tb/rx_idma_req_valid
add wave -noupdate -group tb /eth_idma_tb/rx_idma_req_ready
add wave -noupdate -group tb /eth_idma_tb/rx_idma_rsp_valid
add wave -noupdate -group tb /eth_idma_tb/rx_idma_rsp_ready
add wave -noupdate -group tb -expand /eth_idma_tb/axi_tx_read_req
add wave -noupdate -group tb -expand /eth_idma_tb/axi_tx_write_req
add wave -noupdate -group tb /eth_idma_tb/axi_rx_read_req
add wave -noupdate -group tb /eth_idma_tb/axi_rx_write_req
add wave -noupdate -group tb /eth_idma_tb/axi_tx_read_rsp
add wave -noupdate -group tb /eth_idma_tb/axi_tx_write_rsp
add wave -noupdate -group tb /eth_idma_tb/axi_rx_read_rsp
add wave -noupdate -group tb /eth_idma_tb/axi_rx_write_rsp
add wave -noupdate -group tb -expand /eth_idma_tb/axi_tx_req_mem
add wave -noupdate -group tb -expand /eth_idma_tb/axi_rx_req_mem
add wave -noupdate -group tb -expand /eth_idma_tb/axi_tx_rsp_mem
add wave -noupdate -group tb /eth_idma_tb/axi_rx_rsp_mem
add wave -noupdate -group tb /eth_idma_tb/idma_eh_req
add wave -noupdate -group tb /eth_idma_tb/eh_req_valid
add wave -noupdate -group tb /eth_idma_tb/eh_req_ready
add wave -noupdate -group tb /eth_idma_tb/tx_busy
add wave -noupdate -group tb /eth_idma_tb/rx_busy
add wave -noupdate -group tb /eth_idma_tb/reg_error
add wave -noupdate -group tb /eth_idma_tb/reg_bus_tx_req
add wave -noupdate -group tb /eth_idma_tb/reg_bus_rx_req
add wave -noupdate -group tb /eth_idma_tb/reg_bus_tx_rsp
add wave -noupdate -group tb /eth_idma_tb/reg_bus_rx_rsp
add wave -noupdate -group tb /eth_idma_tb/rx_reg_idma_req
add wave -noupdate -group tb /eth_idma_tb/tx_reg_idma_req
add wave -noupdate -group tb /eth_idma_tb/rx_reg_idma_rsp
add wave -noupdate -group tb /eth_idma_tb/tx_reg_idma_rsp
add wave -noupdate -group tx_sim_mem /eth_idma_tb/i_tx_axi_sim_mem/clk_i
add wave -noupdate -group tx_sim_mem /eth_idma_tb/i_tx_axi_sim_mem/rst_ni
add wave -noupdate -group tx_sim_mem -expand /eth_idma_tb/i_tx_axi_sim_mem/axi_req_i
add wave -noupdate -group tx_sim_mem -expand /eth_idma_tb/i_tx_axi_sim_mem/axi_rsp_o
add wave -noupdate -group tx_sim_mem /eth_idma_tb/i_tx_axi_sim_mem/mon_w_valid_o
add wave -noupdate -group tx_sim_mem /eth_idma_tb/i_tx_axi_sim_mem/mon_w_addr_o
add wave -noupdate -group tx_sim_mem /eth_idma_tb/i_tx_axi_sim_mem/mon_w_data_o
add wave -noupdate -group tx_sim_mem /eth_idma_tb/i_tx_axi_sim_mem/mon_w_id_o
add wave -noupdate -group tx_sim_mem /eth_idma_tb/i_tx_axi_sim_mem/mon_w_user_o
add wave -noupdate -group tx_sim_mem /eth_idma_tb/i_tx_axi_sim_mem/mon_w_beat_count_o
add wave -noupdate -group tx_sim_mem /eth_idma_tb/i_tx_axi_sim_mem/mon_w_last_o
add wave -noupdate -group tx_sim_mem /eth_idma_tb/i_tx_axi_sim_mem/mon_r_valid_o
add wave -noupdate -group tx_sim_mem /eth_idma_tb/i_tx_axi_sim_mem/mon_r_addr_o
add wave -noupdate -group tx_sim_mem /eth_idma_tb/i_tx_axi_sim_mem/mon_r_data_o
add wave -noupdate -group tx_sim_mem /eth_idma_tb/i_tx_axi_sim_mem/mon_r_id_o
add wave -noupdate -group tx_sim_mem /eth_idma_tb/i_tx_axi_sim_mem/mon_r_user_o
add wave -noupdate -group tx_sim_mem /eth_idma_tb/i_tx_axi_sim_mem/mon_r_beat_count_o
add wave -noupdate -group tx_sim_mem /eth_idma_tb/i_tx_axi_sim_mem/mon_r_last_o
add wave -noupdate -group tx_sim_mem /eth_idma_tb/i_tx_axi_sim_mem/mon_w
add wave -noupdate -group tx_sim_mem /eth_idma_tb/i_tx_axi_sim_mem/mon_r
add wave -noupdate -group tx_sim_mem /eth_idma_tb/i_tx_axi_sim_mem/error_happened
add wave -noupdate -group rx_backend /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/clk_i
add wave -noupdate -group rx_backend /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/rst_ni
add wave -noupdate -group rx_backend /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/testmode_i
add wave -noupdate -group rx_backend -expand -subitemconfig {/eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/idma_req_i.opt -expand} /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/idma_req_i
add wave -noupdate -group rx_backend /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/req_valid_i
add wave -noupdate -group rx_backend /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/req_ready_o
add wave -noupdate -group rx_backend /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/idma_rsp_o
add wave -noupdate -group rx_backend /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/rsp_valid_o
add wave -noupdate -group rx_backend /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/rsp_ready_i
add wave -noupdate -group rx_backend /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/idma_eh_req_i
add wave -noupdate -group rx_backend /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/eh_req_valid_i
add wave -noupdate -group rx_backend /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/eh_req_ready_o
add wave -noupdate -group rx_backend /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/axi_read_req_o
add wave -noupdate -group rx_backend /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/axi_read_rsp_i
add wave -noupdate -group rx_backend /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/axis_read_req_o
add wave -noupdate -group rx_backend /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/axis_read_rsp_i
add wave -noupdate -group rx_backend /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/axi_write_req_o
add wave -noupdate -group rx_backend /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/axi_write_rsp_i
add wave -noupdate -group rx_backend /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/axis_write_req_o
add wave -noupdate -group rx_backend /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/axis_write_rsp_i
add wave -noupdate -group rx_backend /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/busy_o
add wave -noupdate -group rx_backend /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/dp_busy
add wave -noupdate -group rx_backend /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/dp_poison
add wave -noupdate -group rx_backend -expand /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/r_req
add wave -noupdate -group rx_backend /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/w_req
add wave -noupdate -group rx_backend /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/r_valid
add wave -noupdate -group rx_backend /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/w_valid
add wave -noupdate -group rx_backend /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/r_ready
add wave -noupdate -group rx_backend /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/w_ready
add wave -noupdate -group rx_backend /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/r_meta_req_tagged
add wave -noupdate -group rx_backend /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/w_meta_req_tagged
add wave -noupdate -group rx_backend /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/w_last_burst
add wave -noupdate -group rx_backend /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/w_last_ready
add wave -noupdate -group rx_backend /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/w_super_last
add wave -noupdate -group rx_backend /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/r_dp_req_in_ready
add wave -noupdate -group rx_backend /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/w_dp_req_in_ready
add wave -noupdate -group rx_backend /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/r_dp_req_out_valid
add wave -noupdate -group rx_backend /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/w_dp_req_out_valid
add wave -noupdate -group rx_backend /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/r_dp_req_out_ready
add wave -noupdate -group rx_backend /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/w_dp_req_out_ready
add wave -noupdate -group rx_backend /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/r_dp_req_out
add wave -noupdate -group rx_backend /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/w_dp_req_out
add wave -noupdate -group rx_backend /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/r_dp_rsp
add wave -noupdate -group rx_backend /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/w_dp_rsp
add wave -noupdate -group rx_backend /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/r_dp_rsp_valid
add wave -noupdate -group rx_backend /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/w_dp_rsp_valid
add wave -noupdate -group rx_backend /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/r_dp_rsp_ready
add wave -noupdate -group rx_backend /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/w_dp_rsp_ready
add wave -noupdate -group rx_backend /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/ar_ready
add wave -noupdate -group rx_backend /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/ar_ready_dp
add wave -noupdate -group rx_backend /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/aw_ready
add wave -noupdate -group rx_backend /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/aw_ready_dp
add wave -noupdate -group rx_backend /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/aw_valid_dp
add wave -noupdate -group rx_backend /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/ar_valid_dp
add wave -noupdate -group rx_backend /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/aw_req_dp
add wave -noupdate -group rx_backend /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/ar_req_dp
add wave -noupdate -group rx_backend /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/legalizer_flush
add wave -noupdate -group rx_backend /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/legalizer_kill
add wave -noupdate -group rx_backend /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/is_length_zero
add wave -noupdate -group rx_backend /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/req_valid
add wave -noupdate -group rx_backend /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/idma_rsp
add wave -noupdate -group rx_backend /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/rsp_valid
add wave -noupdate -group rx_backend /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/rsp_ready
add wave -noupdate -group rx_backend /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/r_chan_valid
add wave -noupdate -group rx_backend /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/r_chan_ready
add wave -noupdate -group tx_legalizer /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/clk_i
add wave -noupdate -group tx_legalizer /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/rst_ni
add wave -noupdate -group tx_legalizer /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/req_i
add wave -noupdate -group tx_legalizer /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/valid_i
add wave -noupdate -group tx_legalizer /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/ready_o
add wave -noupdate -group tx_legalizer /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/r_req_o
add wave -noupdate -group tx_legalizer /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/r_valid_o
add wave -noupdate -group tx_legalizer /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/r_ready_i
add wave -noupdate -group tx_legalizer /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/w_req_o
add wave -noupdate -group tx_legalizer /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/w_valid_o
add wave -noupdate -group tx_legalizer /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/w_ready_i
add wave -noupdate -group tx_legalizer /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/flush_i
add wave -noupdate -group tx_legalizer /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/kill_i
add wave -noupdate -group tx_legalizer /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/r_busy_o
add wave -noupdate -group tx_legalizer /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/w_busy_o
add wave -noupdate -group tx_legalizer /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/r_tf_d
add wave -noupdate -group tx_legalizer /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/r_tf_q
add wave -noupdate -group tx_legalizer /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/w_tf_d
add wave -noupdate -group tx_legalizer /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/w_tf_q
add wave -noupdate -group tx_legalizer /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/opt_tf_d
add wave -noupdate -group tx_legalizer /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/opt_tf_q
add wave -noupdate -group tx_legalizer /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/r_tf_ena
add wave -noupdate -group tx_legalizer /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/w_tf_ena
add wave -noupdate -group tx_legalizer /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/r_page_num_bytes_to_pb
add wave -noupdate -group tx_legalizer /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/r_num_bytes_to_pb
add wave -noupdate -group tx_legalizer /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/w_page_num_bytes_to_pb
add wave -noupdate -group tx_legalizer /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/w_num_bytes_to_pb
add wave -noupdate -group tx_legalizer /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/c_num_bytes_to_pb
add wave -noupdate -group tx_legalizer /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/r_num_bytes_possible
add wave -noupdate -group tx_legalizer /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/r_num_bytes
add wave -noupdate -group tx_legalizer /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/r_addr_offset
add wave -noupdate -group tx_legalizer /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/r_done
add wave -noupdate -group tx_legalizer /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/w_num_bytes_possible
add wave -noupdate -group tx_legalizer /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/w_num_bytes
add wave -noupdate -group tx_legalizer /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/w_addr_offset
add wave -noupdate -group tx_legalizer /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/w_done
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/clk_i
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/rst_ni
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/testmode_i
add wave -noupdate -group {tx_transport layer} -expand /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axi_read_req_o
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axi_read_rsp_i
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axis_read_req_o
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axis_read_rsp_i
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axi_write_req_o
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axi_write_rsp_i
add wave -noupdate -group {tx_transport layer} -expand -subitemconfig {/eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axis_write_req_o.t -expand} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axis_write_req_o
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axis_write_rsp_i
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/r_dp_req_i
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/r_dp_valid_i
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/r_dp_ready_o
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/r_dp_rsp_o
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/r_dp_valid_o
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/r_dp_ready_i
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/w_dp_req_i
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/w_dp_valid_i
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/w_dp_ready_o
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/w_dp_rsp_o
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/w_dp_valid_o
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/w_dp_ready_i
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/ar_req_i
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/ar_valid_i
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/ar_ready_o
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/aw_req_i
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/aw_valid_i
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/aw_ready_o
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/dp_poison_i
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/r_chan_ready_o
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/r_chan_valid_o
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/r_dp_busy_o
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/w_dp_busy_o
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/buffer_busy_o
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axi_buffer_in_valid
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axis_buffer_in_valid
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/buffer_in_valid
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/buffer_in_ready
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/buffer_out_valid
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/buffer_out_valid_shifted
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axi_buffer_out_ready
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axis_buffer_out_ready
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/buffer_out_ready
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/buffer_out_ready_shifted
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axi_buffer_in
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axis_buffer_in
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/buffer_in
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/buffer_in_shifted
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/buffer_out
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/buffer_out_shifted
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axi_r_chan_valid
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axis_r_chan_valid
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axi_r_chan_ready
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axis_r_chan_ready
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axi_r_dp_valid
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axis_r_dp_valid
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axi_r_dp_ready
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axis_r_dp_ready
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axi_r_dp_rsp
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axis_r_dp_rsp
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axi_ar_ready
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axis_ar_ready
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axi_w_dp_rsp_valid
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axis_w_dp_rsp_valid
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axi_w_dp_rsp_ready
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axis_w_dp_rsp_ready
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axi_w_dp_ready
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axis_w_dp_ready
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axi_w_dp_rsp
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axis_w_dp_rsp
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axi_aw_ready
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axis_aw_ready
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/w_dp_req_valid
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/w_dp_req_ready
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/w_dp_rsp_mux_valid
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/w_dp_rsp_mux_ready
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/w_dp_rsp_valid
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/w_dp_rsp_ready
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/w_dp_rsp_mux
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/w_resp_fifo_in_valid
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/w_resp_fifo_in_ready
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/w_resp_fifo_out_protocol
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/w_resp_fifo_out_valid
add wave -noupdate -group {tx_transport layer} /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/w_resp_fifo_out_ready
add wave -noupdate -group tx_axis_write /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/i_idma_axis_write/clk_i
add wave -noupdate -group tx_axis_write /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/i_idma_axis_write/rst_ni
add wave -noupdate -group tx_axis_write /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/i_idma_axis_write/w_dp_req_i
add wave -noupdate -group tx_axis_write /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/i_idma_axis_write/w_dp_req_valid_i
add wave -noupdate -group tx_axis_write /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/i_idma_axis_write/w_dp_req_ready_o
add wave -noupdate -group tx_axis_write /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/i_idma_axis_write/dp_poison_i
add wave -noupdate -group tx_axis_write /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/i_idma_axis_write/w_dp_rsp_o
add wave -noupdate -group tx_axis_write /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/i_idma_axis_write/w_dp_rsp_valid_o
add wave -noupdate -group tx_axis_write /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/i_idma_axis_write/w_dp_rsp_ready_i
add wave -noupdate -group tx_axis_write /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/i_idma_axis_write/aw_req_i
add wave -noupdate -group tx_axis_write /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/i_idma_axis_write/aw_valid_i
add wave -noupdate -group tx_axis_write /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/i_idma_axis_write/aw_ready_o
add wave -noupdate -group tx_axis_write /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/i_idma_axis_write/write_req_o
add wave -noupdate -group tx_axis_write /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/i_idma_axis_write/write_rsp_i
add wave -noupdate -group tx_axis_write /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/i_idma_axis_write/buffer_out_i
add wave -noupdate -group tx_axis_write /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/i_idma_axis_write/buffer_out_valid_i
add wave -noupdate -group tx_axis_write /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/i_idma_axis_write/buffer_out_ready_o
add wave -noupdate -group tx_axis_write /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/i_idma_axis_write/mask_out
add wave -noupdate -group tx_axis_write /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/i_idma_axis_write/ready_to_write
add wave -noupdate -group tx_axis_write /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/i_idma_axis_write/buffer_clean
add wave -noupdate -group tx_axis_write /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/i_idma_axis_write/write_happening
add wave -noupdate -group tx_axis_write /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/i_idma_axis_write/buffer_data_masked
add wave -noupdate -group tx_axis_write /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/i_idma_axis_write/write_ready
add wave -noupdate -group tx_dataflow /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/i_dataflow_element/clk_i
add wave -noupdate -group tx_dataflow /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/i_dataflow_element/rst_ni
add wave -noupdate -group tx_dataflow /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/i_dataflow_element/testmode_i
add wave -noupdate -group tx_dataflow /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/i_dataflow_element/data_i
add wave -noupdate -group tx_dataflow /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/i_dataflow_element/valid_i
add wave -noupdate -group tx_dataflow /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/i_dataflow_element/ready_o
add wave -noupdate -group tx_dataflow /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/i_dataflow_element/data_o
add wave -noupdate -group tx_dataflow /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/i_dataflow_element/valid_o
add wave -noupdate -group tx_dataflow /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/i_dataflow_element/ready_i
add wave -noupdate -group idma_axi_read /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/i_idma_axi_read/clk_i
add wave -noupdate -group idma_axi_read /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/i_idma_axi_read/rst_ni
add wave -noupdate -group idma_axi_read /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/i_idma_axi_read/r_dp_req_i
add wave -noupdate -group idma_axi_read /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/i_idma_axi_read/r_dp_valid_i
add wave -noupdate -group idma_axi_read /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/i_idma_axi_read/r_dp_ready_o
add wave -noupdate -group idma_axi_read /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/i_idma_axi_read/r_dp_rsp_o
add wave -noupdate -group idma_axi_read /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/i_idma_axi_read/r_dp_valid_o
add wave -noupdate -group idma_axi_read /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/i_idma_axi_read/r_dp_ready_i
add wave -noupdate -group idma_axi_read /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/i_idma_axi_read/ar_req_i
add wave -noupdate -group idma_axi_read /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/i_idma_axi_read/ar_valid_i
add wave -noupdate -group idma_axi_read /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/i_idma_axi_read/ar_ready_o
add wave -noupdate -group idma_axi_read /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/i_idma_axi_read/read_req_o
add wave -noupdate -group idma_axi_read -expand /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/i_idma_axi_read/read_rsp_i
add wave -noupdate -group idma_axi_read /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/i_idma_axi_read/r_chan_ready_o
add wave -noupdate -group idma_axi_read /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/i_idma_axi_read/r_chan_valid_o
add wave -noupdate -group idma_axi_read /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/i_idma_axi_read/buffer_in_o
add wave -noupdate -group idma_axi_read -expand /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/i_idma_axi_read/buffer_in_valid_o
add wave -noupdate -group idma_axi_read /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/i_idma_axi_read/buffer_in_ready_i
add wave -noupdate -group idma_axi_read /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/i_idma_axi_read/r_first_mask
add wave -noupdate -group idma_axi_read /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/i_idma_axi_read/r_last_mask
add wave -noupdate -group idma_axi_read /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/i_idma_axi_read/read_aligned_in_mask
add wave -noupdate -group idma_axi_read /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/i_idma_axi_read/first_r_d
add wave -noupdate -group idma_axi_read /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/i_idma_axi_read/first_r_q
add wave -noupdate -group idma_axi_read /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/i_idma_axi_read/mask_in
add wave -noupdate -group idma_axi_read /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/i_idma_axi_read/in_valid
add wave -noupdate -group idma_axi_read /eth_idma_tb/i_tx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/i_idma_axi_read/in_ready
add wave -noupdate -group ry_eth /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/clk_i
add wave -noupdate -group ry_eth /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/rst_ni
add wave -noupdate -group ry_eth /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/clk90_int
add wave -noupdate -group ry_eth /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/clk_200_int
add wave -noupdate -group ry_eth /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/phy_rx_clk
add wave -noupdate -group ry_eth /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/phy_rxd
add wave -noupdate -group ry_eth /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/phy_rx_ctl
add wave -noupdate -group ry_eth /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/phy_tx_clk
add wave -noupdate -group ry_eth /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/phy_txd
add wave -noupdate -group ry_eth /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/phy_tx_ctl
add wave -noupdate -group ry_eth /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/phy_reset_n
add wave -noupdate -group ry_eth /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/phy_int_n
add wave -noupdate -group ry_eth /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/phy_pme_n
add wave -noupdate -group ry_eth /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/phy_mdio_i
add wave -noupdate -group ry_eth /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/phy_mdio_o
add wave -noupdate -group ry_eth /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/phy_mdio_oe
add wave -noupdate -group ry_eth /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/phy_mdc
add wave -noupdate -group ry_eth /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/tx_axis_req_i
add wave -noupdate -group ry_eth /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/tx_axis_rsp_o
add wave -noupdate -group ry_eth /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/rx_axis_req_o
add wave -noupdate -group ry_eth /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/rx_axis_rsp_i
add wave -noupdate -group ry_eth /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/reg2hw_i
add wave -noupdate -group ry_eth /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/hw2reg_o
add wave -noupdate -group ry_eth /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/s_framing_tx_req
add wave -noupdate -group ry_eth /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/s_framing_rx_req
add wave -noupdate -group ry_eth /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/s_framing_tx_rsp
add wave -noupdate -group ry_eth /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/s_framing_rx_rsp
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/clk_i
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rst_ni
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/clk90_int
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/clk_200_int
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/phy_rx_clk
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/phy_rxd
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/phy_rx_ctl
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/phy_tx_clk
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/phy_txd
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/phy_tx_ctl
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/phy_reset_n
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/phy_int_n
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/phy_pme_n
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/phy_mdio_i
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/phy_mdio_o
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/phy_mdio_oe
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/phy_mdc
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/tx_axis_req_i
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/tx_axis_rsp_o
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rx_axis_req_o
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rx_axis_rsp_i
add wave -noupdate -group rx_framing -expand -subitemconfig {/eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/reg2hw_i.machi_mdio -expand} /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/reg2hw_i
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/hw2reg_o
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/mac_gmii_tx_en
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/accept_frame_q
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/accept_frame_d
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/mac_address
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rx_dest_mac
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/promiscuous
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rx_axis_tdata_5_q
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rx_axis_tdata_4_q
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rx_axis_tdata_3_q
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rx_axis_tdata_2_q
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rx_axis_tdata_1_q
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rx_axis_tdata_0_q
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rx_axis_tdata_5_d
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rx_axis_tdata_4_d
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rx_axis_tdata_3_d
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rx_axis_tdata_2_d
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rx_axis_tdata_1_d
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rx_axis_tdata_0_d
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rx_axis_tvalid_5_q
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rx_axis_tvalid_4_q
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rx_axis_tvalid_3_q
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rx_axis_tvalid_2_q
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rx_axis_tvalid_1_q
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rx_axis_tvalid_0_q
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rx_axis_tvalid_5_d
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rx_axis_tvalid_4_d
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rx_axis_tvalid_3_d
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rx_axis_tvalid_2_d
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rx_axis_tvalid_1_d
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rx_axis_tvalid_0_d
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rx_axis_tlast_5_q
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rx_axis_tlast_4_q
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rx_axis_tlast_3_q
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rx_axis_tlast_2_q
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rx_axis_tlast_1_q
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rx_axis_tlast_0_q
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rx_axis_tlast_5_d
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rx_axis_tlast_4_d
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rx_axis_tlast_3_d
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rx_axis_tlast_2_d
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rx_axis_tlast_1_d
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rx_axis_tlast_0_d
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rx_axis_tuser_5_q
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rx_axis_tuser_4_q
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rx_axis_tuser_3_q
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rx_axis_tuser_2_q
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rx_axis_tuser_1_q
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rx_axis_tuser_0_q
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rx_axis_tuser_5_d
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rx_axis_tuser_4_d
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rx_axis_tuser_3_d
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rx_axis_tuser_2_d
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rx_axis_tuser_1_d
add wave -noupdate -group rx_framing /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rx_axis_tuser_0_d
add wave -noupdate -group rx_rgmii_soc /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rgmii_soc1/clk_int
add wave -noupdate -group rx_rgmii_soc /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rgmii_soc1/rst_int
add wave -noupdate -group rx_rgmii_soc /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rgmii_soc1/clk90_int
add wave -noupdate -group rx_rgmii_soc /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rgmii_soc1/clk_200_int
add wave -noupdate -group rx_rgmii_soc /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rgmii_soc1/phy_rx_clk
add wave -noupdate -group rx_rgmii_soc /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rgmii_soc1/phy_rxd
add wave -noupdate -group rx_rgmii_soc /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rgmii_soc1/phy_rx_ctl
add wave -noupdate -group rx_rgmii_soc /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rgmii_soc1/phy_tx_clk
add wave -noupdate -group rx_rgmii_soc /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rgmii_soc1/phy_txd
add wave -noupdate -group rx_rgmii_soc /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rgmii_soc1/phy_tx_ctl
add wave -noupdate -group rx_rgmii_soc /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rgmii_soc1/phy_reset_n
add wave -noupdate -group rx_rgmii_soc /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rgmii_soc1/phy_int_n
add wave -noupdate -group rx_rgmii_soc /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rgmii_soc1/phy_pme_n
add wave -noupdate -group rx_rgmii_soc /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rgmii_soc1/mac_gmii_tx_en
add wave -noupdate -group rx_rgmii_soc /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rgmii_soc1/tx_axis_tvalid
add wave -noupdate -group rx_rgmii_soc /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rgmii_soc1/tx_axis_tlast
add wave -noupdate -group rx_rgmii_soc /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rgmii_soc1/tx_axis_tdata
add wave -noupdate -group rx_rgmii_soc /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rgmii_soc1/tx_axis_tready
add wave -noupdate -group rx_rgmii_soc /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rgmii_soc1/tx_axis_tuser
add wave -noupdate -group rx_rgmii_soc /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rgmii_soc1/rx_axis_tdata
add wave -noupdate -group rx_rgmii_soc /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rgmii_soc1/rx_axis_tvalid
add wave -noupdate -group rx_rgmii_soc /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rgmii_soc1/rx_axis_tlast
add wave -noupdate -group rx_rgmii_soc /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rgmii_soc1/rx_axis_tuser
add wave -noupdate -group rx_rgmii_soc /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rgmii_soc1/rx_fcs_reg
add wave -noupdate -group rx_rgmii_soc /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rgmii_soc1/tx_fcs_reg
add wave -noupdate -group rx_rgmii_soc /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rgmii_soc1/phy_rxd_delay
add wave -noupdate -group rx_rgmii_soc /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_framing_top/rgmii_soc1/phy_rx_ctl_delay
add wave -noupdate -group rx_upsizer /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_axi_stream_dw_upsizer/clk_i
add wave -noupdate -group rx_upsizer /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_axi_stream_dw_upsizer/rst_ni
add wave -noupdate -group rx_upsizer /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_axi_stream_dw_upsizer/in_req_i
add wave -noupdate -group rx_upsizer /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_axi_stream_dw_upsizer/in_rsp_o
add wave -noupdate -group rx_upsizer /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_axi_stream_dw_upsizer/out_req_o
add wave -noupdate -group rx_upsizer /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_axi_stream_dw_upsizer/out_rsp_i
add wave -noupdate -group rx_upsizer /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_axi_stream_dw_upsizer/tdata_received_d
add wave -noupdate -group rx_upsizer /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_axi_stream_dw_upsizer/tdata_received_q
add wave -noupdate -group rx_upsizer /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_axi_stream_dw_upsizer/tstrb_received_d
add wave -noupdate -group rx_upsizer /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_axi_stream_dw_upsizer/tstrb_received_q
add wave -noupdate -group rx_upsizer /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_axi_stream_dw_upsizer/tkeep_received_d
add wave -noupdate -group rx_upsizer /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_axi_stream_dw_upsizer/tkeep_received_q
add wave -noupdate -group rx_upsizer /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_axi_stream_dw_upsizer/tlast_received_d
add wave -noupdate -group rx_upsizer /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_axi_stream_dw_upsizer/tlast_received_q
add wave -noupdate -group rx_upsizer /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_axi_stream_dw_upsizer/tid_received_d
add wave -noupdate -group rx_upsizer /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_axi_stream_dw_upsizer/tid_received_q
add wave -noupdate -group rx_upsizer /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_axi_stream_dw_upsizer/tdest_received_d
add wave -noupdate -group rx_upsizer /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_axi_stream_dw_upsizer/tdest_received_q
add wave -noupdate -group rx_upsizer /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_axi_stream_dw_upsizer/tuser_received_d
add wave -noupdate -group rx_upsizer /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_axi_stream_dw_upsizer/tuser_received_q
add wave -noupdate -group rx_upsizer /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_axi_stream_dw_upsizer/counter_d
add wave -noupdate -group rx_upsizer /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_axi_stream_dw_upsizer/counter_q
add wave -noupdate -group rx_upsizer /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_axi_stream_dw_upsizer/last_subtransfer
add wave -noupdate -group rx_upsizer /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_axi_stream_dw_upsizer/state_d
add wave -noupdate -group rx_upsizer /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_axi_stream_dw_upsizer/state_q
add wave -noupdate -group rx_downsizer /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_axi_stream_dw_downsizer/clk_i
add wave -noupdate -group rx_downsizer /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_axi_stream_dw_downsizer/rst_ni
add wave -noupdate -group rx_downsizer /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_axi_stream_dw_downsizer/in_req_i
add wave -noupdate -group rx_downsizer /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_axi_stream_dw_downsizer/in_rsp_o
add wave -noupdate -group rx_downsizer /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_axi_stream_dw_downsizer/out_req_o
add wave -noupdate -group rx_downsizer /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_axi_stream_dw_downsizer/out_rsp_i
add wave -noupdate -group rx_downsizer /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_axi_stream_dw_downsizer/tdata_received_d
add wave -noupdate -group rx_downsizer /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_axi_stream_dw_downsizer/tdata_received_q
add wave -noupdate -group rx_downsizer /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_axi_stream_dw_downsizer/tstrb_received_d
add wave -noupdate -group rx_downsizer /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_axi_stream_dw_downsizer/tstrb_received_q
add wave -noupdate -group rx_downsizer /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_axi_stream_dw_downsizer/tkeep_received_d
add wave -noupdate -group rx_downsizer /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_axi_stream_dw_downsizer/tkeep_received_q
add wave -noupdate -group rx_downsizer /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_axi_stream_dw_downsizer/tlast_received_d
add wave -noupdate -group rx_downsizer /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_axi_stream_dw_downsizer/tlast_received_q
add wave -noupdate -group rx_downsizer /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_axi_stream_dw_downsizer/tid_received_d
add wave -noupdate -group rx_downsizer /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_axi_stream_dw_downsizer/tid_received_q
add wave -noupdate -group rx_downsizer /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_axi_stream_dw_downsizer/tdest_received_d
add wave -noupdate -group rx_downsizer /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_axi_stream_dw_downsizer/tdest_received_q
add wave -noupdate -group rx_downsizer /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_axi_stream_dw_downsizer/tuser_received_d
add wave -noupdate -group rx_downsizer /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_axi_stream_dw_downsizer/tuser_received_q
add wave -noupdate -group rx_downsizer /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_axi_stream_dw_downsizer/counter_d
add wave -noupdate -group rx_downsizer /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_axi_stream_dw_downsizer/counter_q
add wave -noupdate -group rx_downsizer /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_axi_stream_dw_downsizer/last_subtransfer
add wave -noupdate -group rx_downsizer /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_axi_stream_dw_downsizer/state_d
add wave -noupdate -group rx_downsizer /eth_idma_tb/i_rx_eth_idma_wrap/i_eth_top/i_axi_stream_dw_downsizer/state_q
add wave -noupdate -group rx_legaliter /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/clk_i
add wave -noupdate -group rx_legaliter /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/rst_ni
add wave -noupdate -group rx_legaliter /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/req_i
add wave -noupdate -group rx_legaliter /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/valid_i
add wave -noupdate -group rx_legaliter /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/ready_o
add wave -noupdate -group rx_legaliter /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/r_req_o
add wave -noupdate -group rx_legaliter /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/r_valid_o
add wave -noupdate -group rx_legaliter /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/r_ready_i
add wave -noupdate -group rx_legaliter /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/w_req_o
add wave -noupdate -group rx_legaliter /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/w_valid_o
add wave -noupdate -group rx_legaliter /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/w_ready_i
add wave -noupdate -group rx_legaliter /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/flush_i
add wave -noupdate -group rx_legaliter /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/kill_i
add wave -noupdate -group rx_legaliter /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/r_busy_o
add wave -noupdate -group rx_legaliter /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/w_busy_o
add wave -noupdate -group rx_legaliter /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/r_tf_d
add wave -noupdate -group rx_legaliter /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/r_tf_q
add wave -noupdate -group rx_legaliter /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/w_tf_d
add wave -noupdate -group rx_legaliter /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/w_tf_q
add wave -noupdate -group rx_legaliter /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/opt_tf_d
add wave -noupdate -group rx_legaliter /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/opt_tf_q
add wave -noupdate -group rx_legaliter /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/r_tf_ena
add wave -noupdate -group rx_legaliter /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/w_tf_ena
add wave -noupdate -group rx_legaliter /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/r_page_num_bytes_to_pb
add wave -noupdate -group rx_legaliter /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/r_num_bytes_to_pb
add wave -noupdate -group rx_legaliter /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/w_page_num_bytes_to_pb
add wave -noupdate -group rx_legaliter /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/w_num_bytes_to_pb
add wave -noupdate -group rx_legaliter /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/c_num_bytes_to_pb
add wave -noupdate -group rx_legaliter /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/r_num_bytes_possible
add wave -noupdate -group rx_legaliter /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/r_num_bytes
add wave -noupdate -group rx_legaliter /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/r_addr_offset
add wave -noupdate -group rx_legaliter /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/r_done
add wave -noupdate -group rx_legaliter /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/w_num_bytes_possible
add wave -noupdate -group rx_legaliter /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/w_num_bytes
add wave -noupdate -group rx_legaliter /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/w_addr_offset
add wave -noupdate -group rx_legaliter /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/gen_hw_legalizer/i_idma_legalizer/w_done
add wave -noupdate -group rx_mem /eth_idma_tb/i_rx_axi_sim_mem/clk_i
add wave -noupdate -group rx_mem /eth_idma_tb/i_rx_axi_sim_mem/rst_ni
add wave -noupdate -group rx_mem /eth_idma_tb/i_rx_axi_sim_mem/axi_req_i
add wave -noupdate -group rx_mem /eth_idma_tb/i_rx_axi_sim_mem/axi_rsp_o
add wave -noupdate -group rx_mem /eth_idma_tb/i_rx_axi_sim_mem/mon_w_valid_o
add wave -noupdate -group rx_mem /eth_idma_tb/i_rx_axi_sim_mem/mon_w_addr_o
add wave -noupdate -group rx_mem /eth_idma_tb/i_rx_axi_sim_mem/mon_w_data_o
add wave -noupdate -group rx_mem /eth_idma_tb/i_rx_axi_sim_mem/mon_w_id_o
add wave -noupdate -group rx_mem /eth_idma_tb/i_rx_axi_sim_mem/mon_w_user_o
add wave -noupdate -group rx_mem /eth_idma_tb/i_rx_axi_sim_mem/mon_w_beat_count_o
add wave -noupdate -group rx_mem /eth_idma_tb/i_rx_axi_sim_mem/mon_w_last_o
add wave -noupdate -group rx_mem /eth_idma_tb/i_rx_axi_sim_mem/mon_r_valid_o
add wave -noupdate -group rx_mem /eth_idma_tb/i_rx_axi_sim_mem/mon_r_addr_o
add wave -noupdate -group rx_mem /eth_idma_tb/i_rx_axi_sim_mem/mon_r_data_o
add wave -noupdate -group rx_mem /eth_idma_tb/i_rx_axi_sim_mem/mon_r_id_o
add wave -noupdate -group rx_mem /eth_idma_tb/i_rx_axi_sim_mem/mon_r_user_o
add wave -noupdate -group rx_mem /eth_idma_tb/i_rx_axi_sim_mem/mon_r_beat_count_o
add wave -noupdate -group rx_mem /eth_idma_tb/i_rx_axi_sim_mem/mon_r_last_o
add wave -noupdate -group rx_mem /eth_idma_tb/i_rx_axi_sim_mem/mon_w
add wave -noupdate -group rx_mem /eth_idma_tb/i_rx_axi_sim_mem/mon_r
add wave -noupdate -group rx_mem /eth_idma_tb/i_rx_axi_sim_mem/error_happened
add wave -noupdate -expand -group rx_join /eth_idma_tb/i_axi_rx_rw_join/clk_i
add wave -noupdate -expand -group rx_join /eth_idma_tb/i_axi_rx_rw_join/rst_ni
add wave -noupdate -expand -group rx_join /eth_idma_tb/i_axi_rx_rw_join/slv_read_req_i
add wave -noupdate -expand -group rx_join /eth_idma_tb/i_axi_rx_rw_join/slv_read_resp_o
add wave -noupdate -expand -group rx_join /eth_idma_tb/i_axi_rx_rw_join/slv_write_req_i
add wave -noupdate -expand -group rx_join /eth_idma_tb/i_axi_rx_rw_join/slv_write_resp_o
add wave -noupdate -expand -group rx_join /eth_idma_tb/i_axi_rx_rw_join/mst_req_o
add wave -noupdate -expand -group rx_join /eth_idma_tb/i_axi_rx_rw_join/mst_resp_i
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/clk_i
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/rst_ni
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/testmode_i
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axi_read_req_o
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axi_read_rsp_i
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axis_read_req_o
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axis_read_rsp_i
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axi_write_req_o
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axi_write_rsp_i
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axis_write_req_o
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axis_write_rsp_i
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/r_dp_req_i
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/r_dp_valid_i
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/r_dp_ready_o
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/r_dp_rsp_o
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/r_dp_valid_o
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/r_dp_ready_i
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/w_dp_req_i
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/w_dp_valid_i
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/w_dp_ready_o
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/w_dp_rsp_o
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/w_dp_valid_o
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/w_dp_ready_i
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/ar_req_i
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/ar_valid_i
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/ar_ready_o
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/aw_req_i
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/aw_valid_i
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/aw_ready_o
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/dp_poison_i
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/r_chan_ready_o
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/r_chan_valid_o
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/r_dp_busy_o
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/w_dp_busy_o
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/buffer_busy_o
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axi_buffer_in_valid
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axis_buffer_in_valid
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/buffer_in_valid
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/buffer_in_ready
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/buffer_out_valid
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/buffer_out_valid_shifted
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axi_buffer_out_ready
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axis_buffer_out_ready
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/buffer_out_ready
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/buffer_out_ready_shifted
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axi_buffer_in
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axis_buffer_in
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/buffer_in
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/buffer_in_shifted
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/buffer_out
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/buffer_out_shifted
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axi_r_chan_valid
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axis_r_chan_valid
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axi_r_chan_ready
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axis_r_chan_ready
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axi_r_dp_valid
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axis_r_dp_valid
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axi_r_dp_ready
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axis_r_dp_ready
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axi_r_dp_rsp
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axis_r_dp_rsp
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axi_ar_ready
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axis_ar_ready
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axi_w_dp_rsp_valid
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axis_w_dp_rsp_valid
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axi_w_dp_rsp_ready
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axis_w_dp_rsp_ready
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axi_w_dp_ready
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axis_w_dp_ready
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axi_w_dp_rsp
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axis_w_dp_rsp
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axi_aw_ready
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/axis_aw_ready
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/w_dp_req_valid
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/w_dp_req_ready
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/w_dp_rsp_mux_valid
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/w_dp_rsp_mux_ready
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/w_dp_rsp_valid
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/w_dp_rsp_ready
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/w_dp_rsp_mux
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/w_resp_fifo_in_valid
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/w_resp_fifo_in_ready
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/w_resp_fifo_out_protocol
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/w_resp_fifo_out_valid
add wave -noupdate -expand -group rx_tl /eth_idma_tb/i_rx_eth_idma_wrap/i_idma_backend/i_idma_transport_layer/w_resp_fifo_out_ready
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {254 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 205
configure wave -valuecolwidth 158
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
WaveRestoreZoom {0 ns} {648 ns}
