# This script was generated automatically by bender.
set ROOT "/home/aalice/TESI/ethernet"

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_VSIM \
    "$ROOT/.bender/git/checkouts/common_verification-c3c1b1ba529322db/src/clk_rst_gen.sv" \
    "$ROOT/.bender/git/checkouts/common_verification-c3c1b1ba529322db/src/rand_id_queue.sv" \
    "$ROOT/.bender/git/checkouts/common_verification-c3c1b1ba529322db/src/rand_stream_mst.sv" \
    "$ROOT/.bender/git/checkouts/common_verification-c3c1b1ba529322db/src/rand_synch_holdable_driver.sv" \
    "$ROOT/.bender/git/checkouts/common_verification-c3c1b1ba529322db/src/rand_verif_pkg.sv" \
    "$ROOT/.bender/git/checkouts/common_verification-c3c1b1ba529322db/src/signal_highlighter.sv" \
    "$ROOT/.bender/git/checkouts/common_verification-c3c1b1ba529322db/src/sim_timeout.sv" \
    "$ROOT/.bender/git/checkouts/common_verification-c3c1b1ba529322db/src/stream_watchdog.sv" \
    "$ROOT/.bender/git/checkouts/common_verification-c3c1b1ba529322db/src/rand_synch_driver.sv" \
    "$ROOT/.bender/git/checkouts/common_verification-c3c1b1ba529322db/src/rand_stream_slv.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_VSIM \
    "$ROOT/.bender/git/checkouts/tech_cells_generic-83a0200eb9af51ee/src/rtl/tc_sram.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_VSIM \
    "$ROOT/.bender/git/checkouts/tech_cells_generic-83a0200eb9af51ee/src/rtl/tc_clk.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_VSIM \
    "$ROOT/.bender/git/checkouts/tech_cells_generic-83a0200eb9af51ee/src/deprecated/cluster_pwr_cells.sv" \
    "$ROOT/.bender/git/checkouts/tech_cells_generic-83a0200eb9af51ee/src/deprecated/generic_memory.sv" \
    "$ROOT/.bender/git/checkouts/tech_cells_generic-83a0200eb9af51ee/src/deprecated/generic_rom.sv" \
    "$ROOT/.bender/git/checkouts/tech_cells_generic-83a0200eb9af51ee/src/deprecated/pad_functional.sv" \
    "$ROOT/.bender/git/checkouts/tech_cells_generic-83a0200eb9af51ee/src/deprecated/pulp_buffer.sv" \
    "$ROOT/.bender/git/checkouts/tech_cells_generic-83a0200eb9af51ee/src/deprecated/pulp_pwr_cells.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_VSIM \
    "$ROOT/.bender/git/checkouts/tech_cells_generic-83a0200eb9af51ee/src/tc_pwr.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_VSIM \
    "$ROOT/.bender/git/checkouts/tech_cells_generic-83a0200eb9af51ee/src/deprecated/pulp_clock_gating_async.sv" \
    "$ROOT/.bender/git/checkouts/tech_cells_generic-83a0200eb9af51ee/src/deprecated/cluster_clk_cells.sv" \
    "$ROOT/.bender/git/checkouts/tech_cells_generic-83a0200eb9af51ee/src/deprecated/pulp_clk_cells.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/include" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/binary_to_gray.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/include" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/cb_filter_pkg.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/include" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/cc_onehot.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/cf_math_pkg.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/clk_int_div.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/delta_counter.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/ecc_pkg.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/edge_propagator_tx.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/exp_backoff.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/fifo_v3.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/gray_to_binary.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/isochronous_4phase_handshake.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/isochronous_spill_register.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/lfsr.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/lfsr_16bit.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/lfsr_8bit.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/mv_filter.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/onehot_to_bin.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/plru_tree.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/popcount.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/rr_arb_tree.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/rstgen_bypass.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/serial_deglitch.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/shift_reg.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/spill_register_flushable.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/stream_demux.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/stream_filter.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/stream_fork.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/stream_intf.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/stream_join.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/stream_mux.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/stream_throttle.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/sub_per_hash.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/sync.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/sync_wedge.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/unread.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/cdc_reset_ctrlr_pkg.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/addr_decode_napot.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/cdc_2phase.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/cdc_4phase.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/addr_decode.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/include" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/cb_filter.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/include" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/cdc_fifo_2phase.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/counter.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/ecc_decode.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/ecc_encode.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/edge_detect.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/lzc.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/max_counter.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/rstgen.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/spill_register.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/stream_delay.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/stream_fifo.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/stream_fork_dynamic.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/cdc_reset_ctrlr.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/cdc_fifo_gray.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/fall_through_register.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/id_queue.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/stream_to_mem.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/stream_arbiter_flushable.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/stream_fifo_optimal_wrap.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/stream_register.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/stream_xbar.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/cdc_fifo_gray_clearable.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/cdc_2phase_clearable.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/stream_arbiter.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/stream_omega_net.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/include" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/deprecated/sram.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/include" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/deprecated/clock_divider_counter.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/deprecated/clk_div.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/deprecated/find_first_one.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/deprecated/generic_LFSR_8bit.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/deprecated/generic_fifo.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/deprecated/prioarbiter.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/deprecated/pulp_sync.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/deprecated/pulp_sync_wedge.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/deprecated/rrarbiter.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/deprecated/clock_divider.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/deprecated/fifo_v2.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/deprecated/fifo_v1.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/edge_propagator_ack.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/edge_propagator.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/src/edge_propagator_rx.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -lint -pedanticerrors \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/include" \
    "+incdir+$ROOT/.bender/git/checkouts/axi-11b2a12c3381592b/include" \
    "$ROOT/.bender/git/checkouts/axi-11b2a12c3381592b/src/axi_pkg.sv" \
    "$ROOT/.bender/git/checkouts/axi-11b2a12c3381592b/src/axi_intf.sv" \
    "$ROOT/.bender/git/checkouts/axi-11b2a12c3381592b/src/axi_atop_filter.sv" \
    "$ROOT/.bender/git/checkouts/axi-11b2a12c3381592b/src/axi_burst_splitter.sv" \
    "$ROOT/.bender/git/checkouts/axi-11b2a12c3381592b/src/axi_cdc_dst.sv" \
    "$ROOT/.bender/git/checkouts/axi-11b2a12c3381592b/src/axi_cdc_src.sv" \
    "$ROOT/.bender/git/checkouts/axi-11b2a12c3381592b/src/axi_cut.sv" \
    "$ROOT/.bender/git/checkouts/axi-11b2a12c3381592b/src/axi_delayer.sv" \
    "$ROOT/.bender/git/checkouts/axi-11b2a12c3381592b/src/axi_demux.sv" \
    "$ROOT/.bender/git/checkouts/axi-11b2a12c3381592b/src/axi_dw_downsizer.sv" \
    "$ROOT/.bender/git/checkouts/axi-11b2a12c3381592b/src/axi_dw_upsizer.sv" \
    "$ROOT/.bender/git/checkouts/axi-11b2a12c3381592b/src/axi_id_remap.sv" \
    "$ROOT/.bender/git/checkouts/axi-11b2a12c3381592b/src/axi_id_prepend.sv" \
    "$ROOT/.bender/git/checkouts/axi-11b2a12c3381592b/src/axi_isolate.sv" \
    "$ROOT/.bender/git/checkouts/axi-11b2a12c3381592b/src/axi_join.sv" \
    "$ROOT/.bender/git/checkouts/axi-11b2a12c3381592b/src/axi_lite_demux.sv" \
    "$ROOT/.bender/git/checkouts/axi-11b2a12c3381592b/src/axi_lite_join.sv" \
    "$ROOT/.bender/git/checkouts/axi-11b2a12c3381592b/src/axi_lite_mailbox.sv" \
    "$ROOT/.bender/git/checkouts/axi-11b2a12c3381592b/src/axi_lite_mux.sv" \
    "$ROOT/.bender/git/checkouts/axi-11b2a12c3381592b/src/axi_lite_regs.sv" \
    "$ROOT/.bender/git/checkouts/axi-11b2a12c3381592b/src/axi_lite_to_apb.sv" \
    "$ROOT/.bender/git/checkouts/axi-11b2a12c3381592b/src/axi_lite_to_axi.sv" \
    "$ROOT/.bender/git/checkouts/axi-11b2a12c3381592b/src/axi_modify_address.sv" \
    "$ROOT/.bender/git/checkouts/axi-11b2a12c3381592b/src/axi_mux.sv" \
    "$ROOT/.bender/git/checkouts/axi-11b2a12c3381592b/src/axi_serializer.sv" \
    "$ROOT/.bender/git/checkouts/axi-11b2a12c3381592b/src/axi_cdc.sv" \
    "$ROOT/.bender/git/checkouts/axi-11b2a12c3381592b/src/axi_err_slv.sv" \
    "$ROOT/.bender/git/checkouts/axi-11b2a12c3381592b/src/axi_dw_converter.sv" \
    "$ROOT/.bender/git/checkouts/axi-11b2a12c3381592b/src/axi_id_serialize.sv" \
    "$ROOT/.bender/git/checkouts/axi-11b2a12c3381592b/src/axi_multicut.sv" \
    "$ROOT/.bender/git/checkouts/axi-11b2a12c3381592b/src/axi_to_axi_lite.sv" \
    "$ROOT/.bender/git/checkouts/axi-11b2a12c3381592b/src/axi_iw_converter.sv" \
    "$ROOT/.bender/git/checkouts/axi-11b2a12c3381592b/src/axi_lite_xbar.sv" \
    "$ROOT/.bender/git/checkouts/axi-11b2a12c3381592b/src/axi_xbar.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-a8ef7ae99cfa196c/include" \
    "+incdir+$ROOT/.bender/git/checkouts/axi-11b2a12c3381592b/include" \
    "$ROOT/.bender/git/checkouts/axi-11b2a12c3381592b/src/axi_sim_mem.sv" \
    "$ROOT/.bender/git/checkouts/axi-11b2a12c3381592b/src/axi_test.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/axi-11b2a12c3381592b/include" \
    "$ROOT/.bender/git/checkouts/axi_mem_if-89743a3710e8fb19/src/axi2mem.sv" \
    "$ROOT/.bender/git/checkouts/axi_mem_if-89743a3710e8fb19/src/deprecated/axi_mem_if.sv" \
    "$ROOT/.bender/git/checkouts/axi_mem_if-89743a3710e8fb19/src/deprecated/axi_mem_if_var_latency.sv" \
    "$ROOT/.bender/git/checkouts/axi_mem_if-89743a3710e8fb19/src/deprecated/axi_mem_if_wrap.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/axi-11b2a12c3381592b/include" \
    "+incdir+$ROOT/include" \
    "$ROOT/rtl/asym_ram_sdp_read_wider.v" \
    "$ROOT/rtl/axis_async_fifo.sv" \
    "$ROOT/rtl/axis_gmii_rx.sv" \
    "$ROOT/rtl/axis_gmii_tx.sv" \
    "$ROOT/rtl/dualmem_widen8.sv" \
    "$ROOT/rtl/dualmem_widen.sv" \
    "$ROOT/rtl/eth_mac_1g_rgmii_fifo.sv" \
    "$ROOT/rtl/eth_mac_1g_rgmii.sv" \
    "$ROOT/rtl/eth_mac_1g.sv" \
    "$ROOT/rtl/eth_rgmii.sv" \
    "$ROOT/rtl/framing_top.sv" \
    "$ROOT/rtl/iddr.sv" \
    "$ROOT/rtl/oddr.sv" \
    "$ROOT/rtl/rgmii_core.sv" \
    "$ROOT/rtl/rgmii_lfsr.sv" \
    "$ROOT/rtl/rgmii_phy_if.sv" \
    "$ROOT/rtl/rgmii_soc.sv" \
    "$ROOT/rtl/ssio_ddr_in.sv" \
    "$ROOT/tb/eth_tb.sv" \
    "$ROOT/tb/fixture_eth.sv" \
    "$ROOT/rtl/IN22FDX_R2PV_WFVG_W00512B032M04C128.v" \
    "$ROOT/rtl/GF22_wrapper.sv" \
    "$ROOT/tb/tb_wrapper.sv"
}]} {return 1}
return 0
