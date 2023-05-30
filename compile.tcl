# This script was generated automatically by bender.
set ROOT "/home/sem23f18/eth-proj/sourcecode/fe-ethernet"

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VSIM \
    "$ROOT/.bender/git/checkouts/common_verification-9f118928b2f7d54d/src/clk_rst_gen.sv" \
    "$ROOT/.bender/git/checkouts/common_verification-9f118928b2f7d54d/src/rand_id_queue.sv" \
    "$ROOT/.bender/git/checkouts/common_verification-9f118928b2f7d54d/src/rand_stream_mst.sv" \
    "$ROOT/.bender/git/checkouts/common_verification-9f118928b2f7d54d/src/rand_synch_holdable_driver.sv" \
    "$ROOT/.bender/git/checkouts/common_verification-9f118928b2f7d54d/src/rand_verif_pkg.sv" \
    "$ROOT/.bender/git/checkouts/common_verification-9f118928b2f7d54d/src/signal_highlighter.sv" \
    "$ROOT/.bender/git/checkouts/common_verification-9f118928b2f7d54d/src/sim_timeout.sv" \
    "$ROOT/.bender/git/checkouts/common_verification-9f118928b2f7d54d/src/stream_watchdog.sv" \
    "$ROOT/.bender/git/checkouts/common_verification-9f118928b2f7d54d/src/rand_synch_driver.sv" \
    "$ROOT/.bender/git/checkouts/common_verification-9f118928b2f7d54d/src/rand_stream_slv.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VSIM \
    "$ROOT/.bender/git/checkouts/common_verification-9f118928b2f7d54d/test/tb_clk_rst_gen.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VSIM \
    "$ROOT/.bender/git/checkouts/tech_cells_generic-17a37e73b7e88e75/src/rtl/tc_sram.sv" \
    "$ROOT/.bender/git/checkouts/tech_cells_generic-17a37e73b7e88e75/src/rtl/tc_sram_impl.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VSIM \
    "$ROOT/.bender/git/checkouts/tech_cells_generic-17a37e73b7e88e75/src/rtl/tc_clk.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VSIM \
    "$ROOT/.bender/git/checkouts/tech_cells_generic-17a37e73b7e88e75/src/deprecated/cluster_pwr_cells.sv" \
    "$ROOT/.bender/git/checkouts/tech_cells_generic-17a37e73b7e88e75/src/deprecated/generic_memory.sv" \
    "$ROOT/.bender/git/checkouts/tech_cells_generic-17a37e73b7e88e75/src/deprecated/generic_rom.sv" \
    "$ROOT/.bender/git/checkouts/tech_cells_generic-17a37e73b7e88e75/src/deprecated/pad_functional.sv" \
    "$ROOT/.bender/git/checkouts/tech_cells_generic-17a37e73b7e88e75/src/deprecated/pulp_buffer.sv" \
    "$ROOT/.bender/git/checkouts/tech_cells_generic-17a37e73b7e88e75/src/deprecated/pulp_pwr_cells.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VSIM \
    "$ROOT/.bender/git/checkouts/tech_cells_generic-17a37e73b7e88e75/src/tc_pwr.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VSIM \
    "$ROOT/.bender/git/checkouts/tech_cells_generic-17a37e73b7e88e75/test/tb_tc_sram.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VSIM \
    "$ROOT/.bender/git/checkouts/tech_cells_generic-17a37e73b7e88e75/src/deprecated/pulp_clock_gating_async.sv" \
    "$ROOT/.bender/git/checkouts/tech_cells_generic-17a37e73b7e88e75/src/deprecated/cluster_clk_cells.sv" \
    "$ROOT/.bender/git/checkouts/tech_cells_generic-17a37e73b7e88e75/src/deprecated/pulp_clk_cells.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/include" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/binary_to_gray.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/include" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/cb_filter_pkg.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/include" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/cc_onehot.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/cf_math_pkg.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/clk_int_div.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/delta_counter.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/ecc_pkg.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/edge_propagator_tx.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/exp_backoff.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/fifo_v3.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/gray_to_binary.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/isochronous_4phase_handshake.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/isochronous_spill_register.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/lfsr.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/lfsr_16bit.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/lfsr_8bit.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/mv_filter.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/onehot_to_bin.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/plru_tree.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/popcount.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/rr_arb_tree.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/rstgen_bypass.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/serial_deglitch.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/shift_reg.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/shift_reg_gated.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/spill_register_flushable.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/stream_demux.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/stream_filter.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/stream_fork.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/stream_intf.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/stream_join.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/stream_mux.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/stream_throttle.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/sub_per_hash.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/sync.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/sync_wedge.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/unread.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/read.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/cdc_reset_ctrlr_pkg.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/addr_decode_napot.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/cdc_2phase.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/cdc_4phase.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/addr_decode.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/include" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/cb_filter.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/include" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/cdc_fifo_2phase.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/counter.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/ecc_decode.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/ecc_encode.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/edge_detect.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/lzc.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/max_counter.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/rstgen.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/spill_register.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/stream_delay.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/stream_fifo.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/stream_fork_dynamic.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/clk_mux_glitch_free.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/cdc_reset_ctrlr.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/cdc_fifo_gray.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/fall_through_register.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/id_queue.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/stream_to_mem.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/stream_arbiter_flushable.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/stream_fifo_optimal_wrap.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/stream_register.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/stream_xbar.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/cdc_fifo_gray_clearable.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/cdc_2phase_clearable.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/mem_to_banks.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/stream_arbiter.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/stream_omega_net.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/include" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/deprecated/sram.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/include" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/test/addr_decode_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/test/cb_filter_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/test/cdc_2phase_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/test/cdc_2phase_clearable_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/test/cdc_fifo_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/test/cdc_fifo_clearable_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/test/fifo_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/test/graycode_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/test/id_queue_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/test/popcount_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/test/rr_arb_tree_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/test/stream_test.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/test/stream_register_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/test/stream_to_mem_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/test/sub_per_hash_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/test/isochronous_crossing_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/test/stream_omega_net_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/test/stream_xbar_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/test/clk_int_div_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/test/clk_mux_glitch_free_tb.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/include" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/deprecated/clock_divider_counter.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/deprecated/clk_div.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/deprecated/find_first_one.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/deprecated/generic_LFSR_8bit.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/deprecated/generic_fifo.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/deprecated/prioarbiter.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/deprecated/pulp_sync.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/deprecated/pulp_sync_wedge.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/deprecated/rrarbiter.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/deprecated/clock_divider.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/deprecated/fifo_v2.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/deprecated/fifo_v1.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/edge_propagator_ack.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/edge_propagator.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/src/edge_propagator_rx.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/include" \
    "+incdir+$ROOT/.bender/git/checkouts/apb-85228c1cf9c2e102/include" \
    "$ROOT/.bender/git/checkouts/apb-85228c1cf9c2e102/src/apb_pkg.sv" \
    "$ROOT/.bender/git/checkouts/apb-85228c1cf9c2e102/src/apb_intf.sv" \
    "$ROOT/.bender/git/checkouts/apb-85228c1cf9c2e102/src/apb_err_slv.sv" \
    "$ROOT/.bender/git/checkouts/apb-85228c1cf9c2e102/src/apb_regs.sv" \
    "$ROOT/.bender/git/checkouts/apb-85228c1cf9c2e102/src/apb_cdc.sv" \
    "$ROOT/.bender/git/checkouts/apb-85228c1cf9c2e102/src/apb_demux.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/apb-85228c1cf9c2e102/include" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/include" \
    "$ROOT/.bender/git/checkouts/apb-85228c1cf9c2e102/src/apb_test.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/apb-85228c1cf9c2e102/include" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/include" \
    "$ROOT/.bender/git/checkouts/apb-85228c1cf9c2e102/test/tb_apb_regs.sv" \
    "$ROOT/.bender/git/checkouts/apb-85228c1cf9c2e102/test/tb_apb_cdc.sv" \
    "$ROOT/.bender/git/checkouts/apb-85228c1cf9c2e102/test/tb_apb_demux.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    -lint -pedanticerrors \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/axi-80907860171272a0/include" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/include" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/src/axi_pkg.sv" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/src/axi_intf.sv" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/src/axi_atop_filter.sv" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/src/axi_burst_splitter.sv" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/src/axi_cdc_dst.sv" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/src/axi_cdc_src.sv" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/src/axi_cut.sv" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/src/axi_delayer.sv" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/src/axi_demux.sv" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/src/axi_dw_downsizer.sv" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/src/axi_dw_upsizer.sv" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/src/axi_fifo.sv" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/src/axi_id_remap.sv" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/src/axi_id_prepend.sv" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/src/axi_isolate.sv" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/src/axi_join.sv" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/src/axi_lite_demux.sv" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/src/axi_lite_join.sv" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/src/axi_lite_lfsr.sv" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/src/axi_lite_mailbox.sv" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/src/axi_lite_mux.sv" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/src/axi_lite_regs.sv" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/src/axi_lite_to_apb.sv" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/src/axi_lite_to_axi.sv" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/src/axi_modify_address.sv" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/src/axi_mux.sv" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/src/axi_serializer.sv" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/src/axi_throttle.sv" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/src/axi_to_mem.sv" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/src/axi_cdc.sv" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/src/axi_err_slv.sv" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/src/axi_dw_converter.sv" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/src/axi_id_serialize.sv" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/src/axi_lfsr.sv" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/src/axi_multicut.sv" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/src/axi_to_axi_lite.sv" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/src/axi_to_mem_banked.sv" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/src/axi_to_mem_interleaved.sv" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/src/axi_to_mem_split.sv" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/src/axi_iw_converter.sv" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/src/axi_lite_xbar.sv" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/src/axi_xbar.sv" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/src/axi_xp.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/include" \
    "+incdir+$ROOT/.bender/git/checkouts/axi-80907860171272a0/include" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/src/axi_dumper.sv" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/src/axi_sim_mem.sv" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/src/axi_test.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/axi-80907860171272a0/include" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/include" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/test/tb_axi_dw_pkg.sv" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/test/tb_axi_xbar_pkg.sv" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/test/tb_axi_addr_test.sv" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/test/tb_axi_atop_filter.sv" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/test/tb_axi_cdc.sv" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/test/tb_axi_delayer.sv" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/test/tb_axi_dw_downsizer.sv" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/test/tb_axi_dw_upsizer.sv" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/test/tb_axi_fifo.sv" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/test/tb_axi_isolate.sv" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/test/tb_axi_lite_mailbox.sv" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/test/tb_axi_lite_regs.sv" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/test/tb_axi_iw_converter.sv" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/test/tb_axi_lite_to_apb.sv" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/test/tb_axi_lite_to_axi.sv" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/test/tb_axi_lite_xbar.sv" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/test/tb_axi_modify_address.sv" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/test/tb_axi_serializer.sv" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/test/tb_axi_sim_mem.sv" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/test/tb_axi_to_axi_lite.sv" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/test/tb_axi_to_mem_banked.sv" \
    "$ROOT/.bender/git/checkouts/axi-80907860171272a0/test/tb_axi_xbar.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/axi-80907860171272a0/include" \
    "$ROOT/.bender/git/checkouts/axi_mem_if-1c2f4dc2ee07a65a/src/axi2mem.sv" \
    "$ROOT/.bender/git/checkouts/axi_mem_if-1c2f4dc2ee07a65a/src/deprecated/axi_mem_if.sv" \
    "$ROOT/.bender/git/checkouts/axi_mem_if-1c2f4dc2ee07a65a/src/deprecated/axi_mem_if_var_latency.sv" \
    "$ROOT/.bender/git/checkouts/axi_mem_if-1c2f4dc2ee07a65a/src/deprecated/axi_mem_if_wrap.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/include" \
    "+incdir+$ROOT/.bender/git/checkouts/axi_stream-bd48336ba70a16ef/include" \
    "$ROOT/.bender/git/checkouts/axi_stream-bd48336ba70a16ef/src/axi_stream_intf.sv" \
    "$ROOT/.bender/git/checkouts/axi_stream-bd48336ba70a16ef/src/axi_stream_cut.sv" \
    "$ROOT/.bender/git/checkouts/axi_stream-bd48336ba70a16ef/src/axi_stream_dw_downsizer.sv" \
    "$ROOT/.bender/git/checkouts/axi_stream-bd48336ba70a16ef/src/axi_stream_dw_upsizer.sv" \
    "$ROOT/.bender/git/checkouts/axi_stream-bd48336ba70a16ef/src/axi_stream_multicut.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/axi_stream-bd48336ba70a16ef/include" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/include" \
    "$ROOT/.bender/git/checkouts/axi_stream-bd48336ba70a16ef/test/axi_stream_test.sv" \
    "$ROOT/.bender/git/checkouts/axi_stream-bd48336ba70a16ef/test/tb_axi_stream_dw_downsizer.sv" \
    "$ROOT/.bender/git/checkouts/axi_stream-bd48336ba70a16ef/test/tb_axi_stream_dw_upsizer.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/register_interface-b279418e3e99a604/include" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/include" \
    "+incdir+$ROOT/.bender/git/checkouts/axi-80907860171272a0/include" \
    "+incdir+$ROOT/.bender/git/checkouts/apb-85228c1cf9c2e102/include" \
    "$ROOT/.bender/git/checkouts/register_interface-b279418e3e99a604/src/reg_intf.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-b279418e3e99a604/vendor/lowrisc_opentitan/src/prim_subreg_arb.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-b279418e3e99a604/vendor/lowrisc_opentitan/src/prim_subreg_ext.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-b279418e3e99a604/src/apb_to_reg.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-b279418e3e99a604/src/axi_to_reg.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-b279418e3e99a604/src/periph_to_reg.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-b279418e3e99a604/src/reg_cdc.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-b279418e3e99a604/src/reg_demux.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-b279418e3e99a604/src/reg_err_slv.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-b279418e3e99a604/src/reg_mux.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-b279418e3e99a604/src/reg_to_apb.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-b279418e3e99a604/src/reg_to_mem.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-b279418e3e99a604/src/reg_uniform.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-b279418e3e99a604/src/reg_to_tlul.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-b279418e3e99a604/vendor/lowrisc_opentitan/src/prim_subreg_shadow.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-b279418e3e99a604/vendor/lowrisc_opentitan/src/prim_subreg.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-b279418e3e99a604/src/axi_lite_to_reg.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/register_interface-b279418e3e99a604/include" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/include" \
    "+incdir+$ROOT/.bender/git/checkouts/apb-85228c1cf9c2e102/include" \
    "+incdir+$ROOT/.bender/git/checkouts/axi-80907860171272a0/include" \
    "$ROOT/.bender/git/checkouts/register_interface-b279418e3e99a604/src/reg_test.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/include" \
    "+incdir+$ROOT/.bender/git/checkouts/register_interface-b279418e3e99a604/include" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/include" \
    "+incdir+$ROOT/.bender/git/checkouts/axi_stream-bd48336ba70a16ef/include" \
    "+incdir+$ROOT/.bender/git/checkouts/axi-80907860171272a0/include" \
    "$ROOT/rtl/eth_framing_reg/eth_framing_reg_pkg.sv" \
    "$ROOT/rtl/eth_framing_reg/eth_framing_reg_top.sv" \
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
    "$ROOT/rtl/eth_top_synth.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/axi_stream-bd48336ba70a16ef/include" \
    "+incdir+$ROOT/.bender/git/checkouts/axi-80907860171272a0/include" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-2830de0c06763a55/include" \
    "+incdir+$ROOT/include" \
    "+incdir+$ROOT/.bender/git/checkouts/register_interface-b279418e3e99a604/include" \
    "$ROOT/tb/eth_tb.sv"
}]} {return 1}
return 0
