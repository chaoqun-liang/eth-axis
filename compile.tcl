# This script was generated automatically by bender.
set ROOT "/scratch/chaol/fe-ethernet"

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+ETHERNET_TESTBENCH \
    +define+TARGET_ETH_TEST \
    +define+TARGET_RTL \
    +define+TARGET_SIMULATION \
    +define+TARGET_VSIM \
    "$ROOT/.bender/git/checkouts/common_verification-9df560919331a527/src/clk_rst_gen.sv" \
    "$ROOT/.bender/git/checkouts/common_verification-9df560919331a527/src/rand_id_queue.sv" \
    "$ROOT/.bender/git/checkouts/common_verification-9df560919331a527/src/rand_stream_mst.sv" \
    "$ROOT/.bender/git/checkouts/common_verification-9df560919331a527/src/rand_synch_holdable_driver.sv" \
    "$ROOT/.bender/git/checkouts/common_verification-9df560919331a527/src/rand_verif_pkg.sv" \
    "$ROOT/.bender/git/checkouts/common_verification-9df560919331a527/src/signal_highlighter.sv" \
    "$ROOT/.bender/git/checkouts/common_verification-9df560919331a527/src/sim_timeout.sv" \
    "$ROOT/.bender/git/checkouts/common_verification-9df560919331a527/src/stream_watchdog.sv" \
    "$ROOT/.bender/git/checkouts/common_verification-9df560919331a527/src/rand_synch_driver.sv" \
    "$ROOT/.bender/git/checkouts/common_verification-9df560919331a527/src/rand_stream_slv.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+ETHERNET_TESTBENCH \
    +define+TARGET_ETH_TEST \
    +define+TARGET_RTL \
    +define+TARGET_SIMULATION \
    +define+TARGET_VSIM \
    "$ROOT/.bender/git/checkouts/tech_cells_generic-a289794a3a12c476/src/rtl/tc_sram.sv" \
    "$ROOT/.bender/git/checkouts/tech_cells_generic-a289794a3a12c476/src/rtl/tc_sram_impl.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+ETHERNET_TESTBENCH \
    +define+TARGET_ETH_TEST \
    +define+TARGET_RTL \
    +define+TARGET_SIMULATION \
    +define+TARGET_VSIM \
    "$ROOT/.bender/git/checkouts/tech_cells_generic-a289794a3a12c476/src/rtl/tc_clk.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+ETHERNET_TESTBENCH \
    +define+TARGET_ETH_TEST \
    +define+TARGET_RTL \
    +define+TARGET_SIMULATION \
    +define+TARGET_VSIM \
    "$ROOT/.bender/git/checkouts/tech_cells_generic-a289794a3a12c476/src/deprecated/cluster_pwr_cells.sv" \
    "$ROOT/.bender/git/checkouts/tech_cells_generic-a289794a3a12c476/src/deprecated/generic_memory.sv" \
    "$ROOT/.bender/git/checkouts/tech_cells_generic-a289794a3a12c476/src/deprecated/generic_rom.sv" \
    "$ROOT/.bender/git/checkouts/tech_cells_generic-a289794a3a12c476/src/deprecated/pad_functional.sv" \
    "$ROOT/.bender/git/checkouts/tech_cells_generic-a289794a3a12c476/src/deprecated/pulp_buffer.sv" \
    "$ROOT/.bender/git/checkouts/tech_cells_generic-a289794a3a12c476/src/deprecated/pulp_pwr_cells.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+ETHERNET_TESTBENCH \
    +define+TARGET_ETH_TEST \
    +define+TARGET_RTL \
    +define+TARGET_SIMULATION \
    +define+TARGET_VSIM \
    "$ROOT/.bender/git/checkouts/tech_cells_generic-a289794a3a12c476/src/tc_pwr.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+ETHERNET_TESTBENCH \
    +define+TARGET_ETH_TEST \
    +define+TARGET_RTL \
    +define+TARGET_SIMULATION \
    +define+TARGET_VSIM \
    "$ROOT/.bender/git/checkouts/tech_cells_generic-a289794a3a12c476/src/deprecated/pulp_clock_gating_async.sv" \
    "$ROOT/.bender/git/checkouts/tech_cells_generic-a289794a3a12c476/src/deprecated/cluster_clk_cells.sv" \
    "$ROOT/.bender/git/checkouts/tech_cells_generic-a289794a3a12c476/src/deprecated/pulp_clk_cells.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+ETHERNET_TESTBENCH \
    +define+TARGET_ETH_TEST \
    +define+TARGET_RTL \
    +define+TARGET_SIMULATION \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/include" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/binary_to_gray.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+ETHERNET_TESTBENCH \
    +define+TARGET_ETH_TEST \
    +define+TARGET_RTL \
    +define+TARGET_SIMULATION \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/include" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/cb_filter_pkg.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/cc_onehot.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/cdc_reset_ctrlr_pkg.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/cf_math_pkg.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/clk_int_div.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/delta_counter.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/ecc_pkg.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/edge_propagator_tx.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/exp_backoff.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/fifo_v3.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/gray_to_binary.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/isochronous_4phase_handshake.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/isochronous_spill_register.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/lfsr.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/lfsr_16bit.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/lfsr_8bit.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/lossy_valid_to_stream.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/mv_filter.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/onehot_to_bin.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/plru_tree.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/popcount.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/rr_arb_tree.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/rstgen_bypass.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/serial_deglitch.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/shift_reg.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/shift_reg_gated.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/spill_register_flushable.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/stream_demux.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/stream_filter.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/stream_fork.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/stream_intf.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/stream_join_dynamic.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/stream_mux.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/stream_throttle.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/sub_per_hash.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/sync.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/sync_wedge.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/unread.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/read.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/addr_decode_dync.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/cdc_2phase.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/cdc_4phase.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/clk_int_div_static.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/addr_decode.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/addr_decode_napot.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/multiaddr_decode.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+ETHERNET_TESTBENCH \
    +define+TARGET_ETH_TEST \
    +define+TARGET_RTL \
    +define+TARGET_SIMULATION \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/include" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/cb_filter.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/cdc_fifo_2phase.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/clk_mux_glitch_free.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/counter.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/ecc_decode.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/ecc_encode.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/edge_detect.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/lzc.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/max_counter.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/rstgen.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/spill_register.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/stream_delay.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/stream_fifo.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/stream_fork_dynamic.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/stream_join.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/cdc_reset_ctrlr.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/cdc_fifo_gray.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/fall_through_register.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/id_queue.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/stream_to_mem.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/stream_arbiter_flushable.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/stream_fifo_optimal_wrap.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/stream_register.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/stream_xbar.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/cdc_fifo_gray_clearable.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/cdc_2phase_clearable.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/mem_to_banks_detailed.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/stream_arbiter.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/stream_omega_net.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/mem_to_banks.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+ETHERNET_TESTBENCH \
    +define+TARGET_ETH_TEST \
    +define+TARGET_RTL \
    +define+TARGET_SIMULATION \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/include" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/deprecated/sram.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+ETHERNET_TESTBENCH \
    +define+TARGET_ETH_TEST \
    +define+TARGET_RTL \
    +define+TARGET_SIMULATION \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/include" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/deprecated/clock_divider_counter.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/deprecated/clk_div.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/deprecated/find_first_one.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/deprecated/generic_LFSR_8bit.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/deprecated/generic_fifo.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/deprecated/prioarbiter.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/deprecated/pulp_sync.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/deprecated/pulp_sync_wedge.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/deprecated/rrarbiter.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/deprecated/clock_divider.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/deprecated/fifo_v2.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/deprecated/fifo_v1.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/edge_propagator_ack.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/edge_propagator.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/src/edge_propagator_rx.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+ETHERNET_TESTBENCH \
    +define+TARGET_ETH_TEST \
    +define+TARGET_RTL \
    +define+TARGET_SIMULATION \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/apb-e71de999ceb6ca27/include" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/include" \
    "$ROOT/.bender/git/checkouts/apb-e71de999ceb6ca27/src/apb_pkg.sv" \
    "$ROOT/.bender/git/checkouts/apb-e71de999ceb6ca27/src/apb_intf.sv" \
    "$ROOT/.bender/git/checkouts/apb-e71de999ceb6ca27/src/apb_err_slv.sv" \
    "$ROOT/.bender/git/checkouts/apb-e71de999ceb6ca27/src/apb_regs.sv" \
    "$ROOT/.bender/git/checkouts/apb-e71de999ceb6ca27/src/apb_cdc.sv" \
    "$ROOT/.bender/git/checkouts/apb-e71de999ceb6ca27/src/apb_demux.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+ETHERNET_TESTBENCH \
    +define+TARGET_ETH_TEST \
    +define+TARGET_RTL \
    +define+TARGET_SIMULATION \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/apb-e71de999ceb6ca27/include" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/include" \
    "$ROOT/.bender/git/checkouts/apb-e71de999ceb6ca27/src/apb_test.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+ETHERNET_TESTBENCH \
    +define+TARGET_ETH_TEST \
    -lint -pedanticerrors \
    +define+TARGET_RTL \
    +define+TARGET_SIMULATION \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/axi-3abe871a39dbdd43/include" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/include" \
    "$ROOT/.bender/git/checkouts/axi-3abe871a39dbdd43/src/axi_pkg.sv" \
    "$ROOT/.bender/git/checkouts/axi-3abe871a39dbdd43/src/axi_intf.sv" \
    "$ROOT/.bender/git/checkouts/axi-3abe871a39dbdd43/src/axi_atop_filter.sv" \
    "$ROOT/.bender/git/checkouts/axi-3abe871a39dbdd43/src/axi_burst_splitter.sv" \
    "$ROOT/.bender/git/checkouts/axi-3abe871a39dbdd43/src/axi_bus_compare.sv" \
    "$ROOT/.bender/git/checkouts/axi-3abe871a39dbdd43/src/axi_cdc_dst.sv" \
    "$ROOT/.bender/git/checkouts/axi-3abe871a39dbdd43/src/axi_cdc_src.sv" \
    "$ROOT/.bender/git/checkouts/axi-3abe871a39dbdd43/src/axi_cut.sv" \
    "$ROOT/.bender/git/checkouts/axi-3abe871a39dbdd43/src/axi_delayer.sv" \
    "$ROOT/.bender/git/checkouts/axi-3abe871a39dbdd43/src/axi_demux_simple.sv" \
    "$ROOT/.bender/git/checkouts/axi-3abe871a39dbdd43/src/axi_dw_downsizer.sv" \
    "$ROOT/.bender/git/checkouts/axi-3abe871a39dbdd43/src/axi_dw_upsizer.sv" \
    "$ROOT/.bender/git/checkouts/axi-3abe871a39dbdd43/src/axi_fifo.sv" \
    "$ROOT/.bender/git/checkouts/axi-3abe871a39dbdd43/src/axi_id_remap.sv" \
    "$ROOT/.bender/git/checkouts/axi-3abe871a39dbdd43/src/axi_id_prepend.sv" \
    "$ROOT/.bender/git/checkouts/axi-3abe871a39dbdd43/src/axi_isolate.sv" \
    "$ROOT/.bender/git/checkouts/axi-3abe871a39dbdd43/src/axi_join.sv" \
    "$ROOT/.bender/git/checkouts/axi-3abe871a39dbdd43/src/axi_lite_demux.sv" \
    "$ROOT/.bender/git/checkouts/axi-3abe871a39dbdd43/src/axi_lite_dw_converter.sv" \
    "$ROOT/.bender/git/checkouts/axi-3abe871a39dbdd43/src/axi_lite_from_mem.sv" \
    "$ROOT/.bender/git/checkouts/axi-3abe871a39dbdd43/src/axi_lite_join.sv" \
    "$ROOT/.bender/git/checkouts/axi-3abe871a39dbdd43/src/axi_lite_lfsr.sv" \
    "$ROOT/.bender/git/checkouts/axi-3abe871a39dbdd43/src/axi_lite_mailbox.sv" \
    "$ROOT/.bender/git/checkouts/axi-3abe871a39dbdd43/src/axi_lite_mux.sv" \
    "$ROOT/.bender/git/checkouts/axi-3abe871a39dbdd43/src/axi_lite_regs.sv" \
    "$ROOT/.bender/git/checkouts/axi-3abe871a39dbdd43/src/axi_lite_to_apb.sv" \
    "$ROOT/.bender/git/checkouts/axi-3abe871a39dbdd43/src/axi_lite_to_axi.sv" \
    "$ROOT/.bender/git/checkouts/axi-3abe871a39dbdd43/src/axi_modify_address.sv" \
    "$ROOT/.bender/git/checkouts/axi-3abe871a39dbdd43/src/axi_mux.sv" \
    "$ROOT/.bender/git/checkouts/axi-3abe871a39dbdd43/src/axi_rw_join.sv" \
    "$ROOT/.bender/git/checkouts/axi-3abe871a39dbdd43/src/axi_rw_split.sv" \
    "$ROOT/.bender/git/checkouts/axi-3abe871a39dbdd43/src/axi_serializer.sv" \
    "$ROOT/.bender/git/checkouts/axi-3abe871a39dbdd43/src/axi_slave_compare.sv" \
    "$ROOT/.bender/git/checkouts/axi-3abe871a39dbdd43/src/axi_throttle.sv" \
    "$ROOT/.bender/git/checkouts/axi-3abe871a39dbdd43/src/axi_to_detailed_mem.sv" \
    "$ROOT/.bender/git/checkouts/axi-3abe871a39dbdd43/src/axi_cdc.sv" \
    "$ROOT/.bender/git/checkouts/axi-3abe871a39dbdd43/src/axi_demux.sv" \
    "$ROOT/.bender/git/checkouts/axi-3abe871a39dbdd43/src/axi_err_slv.sv" \
    "$ROOT/.bender/git/checkouts/axi-3abe871a39dbdd43/src/axi_dw_converter.sv" \
    "$ROOT/.bender/git/checkouts/axi-3abe871a39dbdd43/src/axi_from_mem.sv" \
    "$ROOT/.bender/git/checkouts/axi-3abe871a39dbdd43/src/axi_id_serialize.sv" \
    "$ROOT/.bender/git/checkouts/axi-3abe871a39dbdd43/src/axi_lfsr.sv" \
    "$ROOT/.bender/git/checkouts/axi-3abe871a39dbdd43/src/axi_multicut.sv" \
    "$ROOT/.bender/git/checkouts/axi-3abe871a39dbdd43/src/axi_to_axi_lite.sv" \
    "$ROOT/.bender/git/checkouts/axi-3abe871a39dbdd43/src/axi_to_mem.sv" \
    "$ROOT/.bender/git/checkouts/axi-3abe871a39dbdd43/src/axi_iw_converter.sv" \
    "$ROOT/.bender/git/checkouts/axi-3abe871a39dbdd43/src/axi_lite_xbar.sv" \
    "$ROOT/.bender/git/checkouts/axi-3abe871a39dbdd43/src/axi_xbar.sv" \
    "$ROOT/.bender/git/checkouts/axi-3abe871a39dbdd43/src/axi_to_mem_banked.sv" \
    "$ROOT/.bender/git/checkouts/axi-3abe871a39dbdd43/src/axi_to_mem_interleaved.sv" \
    "$ROOT/.bender/git/checkouts/axi-3abe871a39dbdd43/src/axi_to_mem_split.sv" \
    "$ROOT/.bender/git/checkouts/axi-3abe871a39dbdd43/src/axi_xp.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+ETHERNET_TESTBENCH \
    +define+TARGET_ETH_TEST \
    +define+TARGET_RTL \
    +define+TARGET_SIMULATION \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/axi-3abe871a39dbdd43/include" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/include" \
    "$ROOT/.bender/git/checkouts/axi-3abe871a39dbdd43/src/axi_chan_compare.sv" \
    "$ROOT/.bender/git/checkouts/axi-3abe871a39dbdd43/src/axi_dumper.sv" \
    "$ROOT/.bender/git/checkouts/axi-3abe871a39dbdd43/src/axi_sim_mem.sv" \
    "$ROOT/.bender/git/checkouts/axi-3abe871a39dbdd43/src/axi_test.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+ETHERNET_TESTBENCH \
    +define+TARGET_ETH_TEST \
    +define+TARGET_RTL \
    +define+TARGET_SIMULATION \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/register_interface-3304f8fa62ae3ce9/include" \
    "+incdir+$ROOT/.bender/git/checkouts/axi-3abe871a39dbdd43/include" \
    "+incdir+$ROOT/.bender/git/checkouts/apb-e71de999ceb6ca27/include" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/include" \
    "$ROOT/.bender/git/checkouts/register_interface-3304f8fa62ae3ce9/src/reg_intf.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-3304f8fa62ae3ce9/vendor/lowrisc_opentitan/src/prim_subreg_arb.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-3304f8fa62ae3ce9/vendor/lowrisc_opentitan/src/prim_subreg_ext.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-3304f8fa62ae3ce9/src/apb_to_reg.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-3304f8fa62ae3ce9/src/axi_lite_to_reg.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-3304f8fa62ae3ce9/src/axi_to_reg_v2.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-3304f8fa62ae3ce9/src/periph_to_reg.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-3304f8fa62ae3ce9/src/reg_cdc.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-3304f8fa62ae3ce9/src/reg_cut.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-3304f8fa62ae3ce9/src/reg_demux.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-3304f8fa62ae3ce9/src/reg_err_slv.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-3304f8fa62ae3ce9/src/reg_filter_empty_writes.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-3304f8fa62ae3ce9/src/reg_mux.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-3304f8fa62ae3ce9/src/reg_to_apb.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-3304f8fa62ae3ce9/src/reg_to_mem.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-3304f8fa62ae3ce9/src/reg_to_tlul.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-3304f8fa62ae3ce9/src/reg_uniform.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-3304f8fa62ae3ce9/vendor/lowrisc_opentitan/src/prim_subreg_shadow.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-3304f8fa62ae3ce9/vendor/lowrisc_opentitan/src/prim_subreg.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-3304f8fa62ae3ce9/src/deprecated/axi_to_reg.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+ETHERNET_TESTBENCH \
    +define+TARGET_ETH_TEST \
    +define+TARGET_RTL \
    +define+TARGET_SIMULATION \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/idma-ef0a94d962f8268b/target/rtl/../../src/include" \
    "+incdir+$ROOT/.bender/git/checkouts/idma-ef0a94d962f8268b/target/rtl/../../test" \
    "+incdir+$ROOT/.bender/git/checkouts/idma-ef0a94d962f8268b/target/rtl/include" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/include" \
    "+incdir+$ROOT/.bender/git/checkouts/axi-3abe871a39dbdd43/include" \
    "+incdir+$ROOT/.bender/git/checkouts/register_interface-3304f8fa62ae3ce9/include" \
    "$ROOT/.bender/git/checkouts/idma-ef0a94d962f8268b/target/rtl/../../src/idma_pkg.sv" \
    "$ROOT/.bender/git/checkouts/idma-ef0a94d962f8268b/target/rtl/idma_desc64_reg_pkg.sv" \
    "$ROOT/.bender/git/checkouts/idma-ef0a94d962f8268b/target/rtl/idma_reg32_3d_reg_pkg.sv" \
    "$ROOT/.bender/git/checkouts/idma-ef0a94d962f8268b/target/rtl/idma_reg64_2d_reg_pkg.sv" \
    "$ROOT/.bender/git/checkouts/idma-ef0a94d962f8268b/target/rtl/idma_desc64_reg_top.sv" \
    "$ROOT/.bender/git/checkouts/idma-ef0a94d962f8268b/target/rtl/idma_reg32_3d_reg_top.sv" \
    "$ROOT/.bender/git/checkouts/idma-ef0a94d962f8268b/target/rtl/idma_reg32_3d_top.sv" \
    "$ROOT/.bender/git/checkouts/idma-ef0a94d962f8268b/target/rtl/idma_reg64_2d_reg_top.sv" \
    "$ROOT/.bender/git/checkouts/idma-ef0a94d962f8268b/target/rtl/idma_reg64_2d_top.sv" \
    "$ROOT/.bender/git/checkouts/idma-ef0a94d962f8268b/target/rtl/idma_legalizer_rw_axi_rw_axis.sv" \
    "$ROOT/.bender/git/checkouts/idma-ef0a94d962f8268b/target/rtl/idma_transport_layer_rw_axi_rw_axis.sv" \
    "$ROOT/.bender/git/checkouts/idma-ef0a94d962f8268b/target/rtl/idma_backend_rw_axi_rw_axis.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+ETHERNET_TESTBENCH \
    +define+TARGET_ETH_TEST \
    +define+TARGET_RTL \
    +define+TARGET_SIMULATION \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/axi-3abe871a39dbdd43/include" \
    "$ROOT/.bender/git/checkouts/axi_mem_if-a44f9741a529135f/src/axi2mem.sv" \
    "$ROOT/.bender/git/checkouts/axi_mem_if-a44f9741a529135f/src/deprecated/axi_mem_if.sv" \
    "$ROOT/.bender/git/checkouts/axi_mem_if-a44f9741a529135f/src/deprecated/axi_mem_if_var_latency.sv" \
    "$ROOT/.bender/git/checkouts/axi_mem_if-a44f9741a529135f/src/deprecated/axi_mem_if_wrap.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+ETHERNET_TESTBENCH \
    +define+TARGET_ETH_TEST \
    +define+TARGET_RTL \
    +define+TARGET_SIMULATION \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/axi_stream-ef29b4224f17e33e/include" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/include" \
    "$ROOT/.bender/git/checkouts/axi_stream-ef29b4224f17e33e/src/axi_stream_intf.sv" \
    "$ROOT/.bender/git/checkouts/axi_stream-ef29b4224f17e33e/src/axi_stream_cut.sv" \
    "$ROOT/.bender/git/checkouts/axi_stream-ef29b4224f17e33e/src/axi_stream_dw_downsizer.sv" \
    "$ROOT/.bender/git/checkouts/axi_stream-ef29b4224f17e33e/src/axi_stream_dw_upsizer.sv" \
    "$ROOT/.bender/git/checkouts/axi_stream-ef29b4224f17e33e/src/axi_stream_multicut.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+ETHERNET_TESTBENCH \
    +define+TARGET_ETH_TEST \
    +define+TARGET_RTL \
    +define+TARGET_SIMULATION \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/idma-ef0a94d962f8268b/src/include" \
    "+incdir+$ROOT/.bender/git/checkouts/idma-ef0a94d962f8268b/target/rtl/include" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/include" \
    "+incdir+$ROOT/.bender/git/checkouts/axi-3abe871a39dbdd43/include" \
    "+incdir+$ROOT/.bender/git/checkouts/register_interface-3304f8fa62ae3ce9/include" \
    "+incdir+$ROOT/.bender/git/checkouts/idma-ef0a94d962f8268b/target/rtl/../../src/include" \
    "+incdir+$ROOT/.bender/git/checkouts/idma-ef0a94d962f8268b/target/rtl/../../test" \
    "$ROOT/.bender/git/checkouts/idma-ef0a94d962f8268b/src/backend/idma_axil_read.sv" \
    "$ROOT/.bender/git/checkouts/idma-ef0a94d962f8268b/src/backend/idma_axil_write.sv" \
    "$ROOT/.bender/git/checkouts/idma-ef0a94d962f8268b/src/backend/idma_axi_read.sv" \
    "$ROOT/.bender/git/checkouts/idma-ef0a94d962f8268b/src/backend/idma_axi_write.sv" \
    "$ROOT/.bender/git/checkouts/idma-ef0a94d962f8268b/src/backend/idma_axis_read.sv" \
    "$ROOT/.bender/git/checkouts/idma-ef0a94d962f8268b/src/backend/idma_axis_write.sv" \
    "$ROOT/.bender/git/checkouts/idma-ef0a94d962f8268b/src/backend/idma_channel_coupler.sv" \
    "$ROOT/.bender/git/checkouts/idma-ef0a94d962f8268b/src/backend/idma_dataflow_element.sv" \
    "$ROOT/.bender/git/checkouts/idma-ef0a94d962f8268b/src/backend/idma_error_handler.sv" \
    "$ROOT/.bender/git/checkouts/idma-ef0a94d962f8268b/src/backend/idma_init_read.sv" \
    "$ROOT/.bender/git/checkouts/idma-ef0a94d962f8268b/src/backend/idma_obi_read.sv" \
    "$ROOT/.bender/git/checkouts/idma-ef0a94d962f8268b/src/backend/idma_obi_write.sv" \
    "$ROOT/.bender/git/checkouts/idma-ef0a94d962f8268b/src/backend/idma_tilelink_read.sv" \
    "$ROOT/.bender/git/checkouts/idma-ef0a94d962f8268b/src/backend/idma_tilelink_write.sv" \
    "$ROOT/.bender/git/checkouts/idma-ef0a94d962f8268b/src/future/idma_improved_fifo.sv" \
    "$ROOT/.bender/git/checkouts/idma-ef0a94d962f8268b/src/future/idma_legalizer_page_splitter.sv" \
    "$ROOT/.bender/git/checkouts/idma-ef0a94d962f8268b/src/future/idma_legalizer_pow2_splitter.sv" \
    "$ROOT/.bender/git/checkouts/idma-ef0a94d962f8268b/src/future/idma_reg_to_axi.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+ETHERNET_TESTBENCH \
    +define+TARGET_ETH_TEST \
    +define+TARGET_RTL \
    +define+TARGET_SIMULATION \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/idma-ef0a94d962f8268b/src/include" \
    "+incdir+$ROOT/.bender/git/checkouts/idma-ef0a94d962f8268b/target/rtl/include" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/include" \
    "+incdir+$ROOT/.bender/git/checkouts/axi-3abe871a39dbdd43/include" \
    "+incdir+$ROOT/.bender/git/checkouts/register_interface-3304f8fa62ae3ce9/include" \
    "+incdir+$ROOT/.bender/git/checkouts/idma-ef0a94d962f8268b/target/rtl/../../src/include" \
    "+incdir+$ROOT/.bender/git/checkouts/idma-ef0a94d962f8268b/target/rtl/../../test" \
    "$ROOT/.bender/git/checkouts/idma-ef0a94d962f8268b/src/midend/idma_mp_dist_midend.sv" \
    "$ROOT/.bender/git/checkouts/idma-ef0a94d962f8268b/src/midend/idma_mp_split_midend.sv" \
    "$ROOT/.bender/git/checkouts/idma-ef0a94d962f8268b/src/midend/idma_nd_midend.sv" \
    "$ROOT/.bender/git/checkouts/idma-ef0a94d962f8268b/src/midend/idma_rt_midend.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+ETHERNET_TESTBENCH \
    +define+TARGET_ETH_TEST \
    +define+TARGET_RTL \
    +define+TARGET_SIMULATION \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/idma-ef0a94d962f8268b/src/include" \
    "+incdir+$ROOT/.bender/git/checkouts/idma-ef0a94d962f8268b/target/rtl/include" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/include" \
    "+incdir+$ROOT/.bender/git/checkouts/axi-3abe871a39dbdd43/include" \
    "+incdir+$ROOT/.bender/git/checkouts/register_interface-3304f8fa62ae3ce9/include" \
    "+incdir+$ROOT/.bender/git/checkouts/idma-ef0a94d962f8268b/target/rtl/../../src/include" \
    "+incdir+$ROOT/.bender/git/checkouts/idma-ef0a94d962f8268b/target/rtl/../../test" \
    "$ROOT/.bender/git/checkouts/idma-ef0a94d962f8268b/src/frontend/desc64/idma_desc64_ar_gen.sv" \
    "$ROOT/.bender/git/checkouts/idma-ef0a94d962f8268b/src/frontend/desc64/idma_desc64_ar_gen_prefetch.sv" \
    "$ROOT/.bender/git/checkouts/idma-ef0a94d962f8268b/src/frontend/desc64/idma_desc64_reader.sv" \
    "$ROOT/.bender/git/checkouts/idma-ef0a94d962f8268b/src/frontend/desc64/idma_desc64_reader_gater.sv" \
    "$ROOT/.bender/git/checkouts/idma-ef0a94d962f8268b/src/frontend/desc64/idma_desc64_reshaper.sv" \
    "$ROOT/.bender/git/checkouts/idma-ef0a94d962f8268b/src/frontend/idma_transfer_id_gen.sv" \
    "$ROOT/.bender/git/checkouts/idma-ef0a94d962f8268b/src/frontend/desc64/idma_desc64_reg_wrapper.sv" \
    "$ROOT/.bender/git/checkouts/idma-ef0a94d962f8268b/src/frontend/desc64/idma_desc64_top.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+ETHERNET_TESTBENCH \
    +define+TARGET_ETH_TEST \
    +define+TARGET_RTL \
    +define+TARGET_SIMULATION \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/include" \
    "+incdir+$ROOT/.bender/git/checkouts/axi-3abe871a39dbdd43/include" \
    "+incdir+$ROOT/.bender/git/checkouts/register_interface-3304f8fa62ae3ce9/include" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/include" \
    "+incdir+$ROOT/.bender/git/checkouts/axi_stream-ef29b4224f17e33e/include" \
    "+incdir+$ROOT/.bender/git/checkouts/idma-ef0a94d962f8268b/src/include" \
    "+incdir+$ROOT/.bender/git/checkouts/idma-ef0a94d962f8268b/target/rtl/include" \
    "$ROOT/rtl/eth_idma_reg/eth_idma_reg_pkg.sv" \
    "$ROOT/rtl/eth_idma_reg/eth_idma_reg_top.sv" \
    "$ROOT/rtl/axis_gmii_rx.sv" \
    "$ROOT/rtl/axis_gmii_tx.sv" \
    "$ROOT/rtl/eth_mac_1g_rgmii_fifo.sv" \
    "$ROOT/rtl/eth_mac_1g_rgmii.sv" \
    "$ROOT/rtl/eth_mac_1g.sv" \
    "$ROOT/rtl/framing_top.sv" \
    "$ROOT/rtl/iddr.sv" \
    "$ROOT/rtl/oddr.sv" \
    "$ROOT/rtl/rgmii_core.sv" \
    "$ROOT/rtl/rgmii_lfsr.sv" \
    "$ROOT/rtl/rgmii_phy_if.sv" \
    "$ROOT/rtl/rgmii_soc.sv" \
    "$ROOT/rtl/ssio_ddr_in.sv" \
    "$ROOT/rtl/eth_top_pkg.sv" \
    "$ROOT/rtl/eth_top.sv" \
    "$ROOT/rtl/eth_top_synth.sv" \
    "$ROOT/rtl/eth_idma_pkg.sv" \
    "$ROOT/rtl/eth_idma_wrap.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+ETHERNET_TESTBENCH \
    +define+TARGET_ETH_TEST \
    +define+TARGET_RTL \
    +define+TARGET_SIMULATION \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/include" \
    "+incdir+$ROOT/.bender/git/checkouts/axi-3abe871a39dbdd43/include" \
    "+incdir+$ROOT/.bender/git/checkouts/register_interface-3304f8fa62ae3ce9/include" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-00db45f705b39319/include" \
    "+incdir+$ROOT/.bender/git/checkouts/axi_stream-ef29b4224f17e33e/include" \
    "+incdir+$ROOT/.bender/git/checkouts/idma-ef0a94d962f8268b/src/include" \
    "+incdir+$ROOT/.bender/git/checkouts/idma-ef0a94d962f8268b/target/rtl/include" \
    "$ROOT/tb/eth_idma_tb.sv"
}]} {return 1}
return 0
