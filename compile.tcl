# This script was generated automatically by bender.
set ROOT "/home/sem23f18/eth-proj/fe-ethernet"

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VSIM \
    "$ROOT/.bender/git/checkouts/common_verification-9b6c84a10b6d23a6/src/clk_rst_gen.sv" \
    "$ROOT/.bender/git/checkouts/common_verification-9b6c84a10b6d23a6/src/rand_id_queue.sv" \
    "$ROOT/.bender/git/checkouts/common_verification-9b6c84a10b6d23a6/src/rand_stream_mst.sv" \
    "$ROOT/.bender/git/checkouts/common_verification-9b6c84a10b6d23a6/src/rand_synch_holdable_driver.sv" \
    "$ROOT/.bender/git/checkouts/common_verification-9b6c84a10b6d23a6/src/rand_verif_pkg.sv" \
    "$ROOT/.bender/git/checkouts/common_verification-9b6c84a10b6d23a6/src/signal_highlighter.sv" \
    "$ROOT/.bender/git/checkouts/common_verification-9b6c84a10b6d23a6/src/sim_timeout.sv" \
    "$ROOT/.bender/git/checkouts/common_verification-9b6c84a10b6d23a6/src/stream_watchdog.sv" \
    "$ROOT/.bender/git/checkouts/common_verification-9b6c84a10b6d23a6/src/rand_synch_driver.sv" \
    "$ROOT/.bender/git/checkouts/common_verification-9b6c84a10b6d23a6/src/rand_stream_slv.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VSIM \
    "$ROOT/.bender/git/checkouts/common_verification-9b6c84a10b6d23a6/test/tb_clk_rst_gen.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VSIM \
    "$ROOT/.bender/git/checkouts/tech_cells_generic-a8af03e82b50457b/src/rtl/tc_sram.sv" \
    "$ROOT/.bender/git/checkouts/tech_cells_generic-a8af03e82b50457b/src/rtl/tc_sram_impl.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VSIM \
    "$ROOT/.bender/git/checkouts/tech_cells_generic-a8af03e82b50457b/src/rtl/tc_clk.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VSIM \
    "$ROOT/.bender/git/checkouts/tech_cells_generic-a8af03e82b50457b/src/deprecated/cluster_pwr_cells.sv" \
    "$ROOT/.bender/git/checkouts/tech_cells_generic-a8af03e82b50457b/src/deprecated/generic_memory.sv" \
    "$ROOT/.bender/git/checkouts/tech_cells_generic-a8af03e82b50457b/src/deprecated/generic_rom.sv" \
    "$ROOT/.bender/git/checkouts/tech_cells_generic-a8af03e82b50457b/src/deprecated/pad_functional.sv" \
    "$ROOT/.bender/git/checkouts/tech_cells_generic-a8af03e82b50457b/src/deprecated/pulp_buffer.sv" \
    "$ROOT/.bender/git/checkouts/tech_cells_generic-a8af03e82b50457b/src/deprecated/pulp_pwr_cells.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VSIM \
    "$ROOT/.bender/git/checkouts/tech_cells_generic-a8af03e82b50457b/src/tc_pwr.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VSIM \
    "$ROOT/.bender/git/checkouts/tech_cells_generic-a8af03e82b50457b/test/tb_tc_sram.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VSIM \
    "$ROOT/.bender/git/checkouts/tech_cells_generic-a8af03e82b50457b/src/deprecated/pulp_clock_gating_async.sv" \
    "$ROOT/.bender/git/checkouts/tech_cells_generic-a8af03e82b50457b/src/deprecated/cluster_clk_cells.sv" \
    "$ROOT/.bender/git/checkouts/tech_cells_generic-a8af03e82b50457b/src/deprecated/pulp_clk_cells.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/include" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/binary_to_gray.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/include" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/cb_filter_pkg.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/include" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/cc_onehot.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/cf_math_pkg.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/clk_int_div.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/delta_counter.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/ecc_pkg.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/edge_propagator_tx.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/exp_backoff.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/fifo_v3.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/gray_to_binary.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/isochronous_4phase_handshake.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/isochronous_spill_register.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/lfsr.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/lfsr_16bit.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/lfsr_8bit.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/mv_filter.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/onehot_to_bin.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/plru_tree.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/popcount.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/rr_arb_tree.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/rstgen_bypass.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/serial_deglitch.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/shift_reg.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/shift_reg_gated.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/spill_register_flushable.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/stream_demux.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/stream_filter.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/stream_fork.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/stream_intf.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/stream_join.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/stream_mux.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/stream_throttle.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/sub_per_hash.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/sync.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/sync_wedge.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/unread.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/read.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/cdc_reset_ctrlr_pkg.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/addr_decode_napot.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/cdc_2phase.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/cdc_4phase.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/addr_decode.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/include" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/cb_filter.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/include" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/cdc_fifo_2phase.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/counter.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/ecc_decode.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/ecc_encode.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/edge_detect.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/lzc.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/max_counter.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/rstgen.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/spill_register.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/stream_delay.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/stream_fifo.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/stream_fork_dynamic.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/clk_mux_glitch_free.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/cdc_reset_ctrlr.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/cdc_fifo_gray.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/fall_through_register.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/id_queue.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/stream_to_mem.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/stream_arbiter_flushable.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/stream_fifo_optimal_wrap.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/stream_register.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/stream_xbar.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/cdc_fifo_gray_clearable.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/cdc_2phase_clearable.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/mem_to_banks.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/stream_arbiter.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/stream_omega_net.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/include" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/deprecated/sram.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/include" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/test/addr_decode_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/test/cb_filter_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/test/cdc_2phase_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/test/cdc_2phase_clearable_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/test/cdc_fifo_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/test/cdc_fifo_clearable_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/test/fifo_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/test/graycode_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/test/id_queue_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/test/popcount_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/test/rr_arb_tree_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/test/stream_test.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/test/stream_register_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/test/stream_to_mem_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/test/sub_per_hash_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/test/isochronous_crossing_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/test/stream_omega_net_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/test/stream_xbar_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/test/clk_int_div_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/test/clk_mux_glitch_free_tb.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/include" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/deprecated/clock_divider_counter.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/deprecated/clk_div.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/deprecated/find_first_one.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/deprecated/generic_LFSR_8bit.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/deprecated/generic_fifo.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/deprecated/prioarbiter.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/deprecated/pulp_sync.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/deprecated/pulp_sync_wedge.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/deprecated/rrarbiter.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/deprecated/clock_divider.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/deprecated/fifo_v2.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/deprecated/fifo_v1.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/edge_propagator_ack.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/edge_propagator.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/src/edge_propagator_rx.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/apb-35c2e79deae2aa36/include" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/include" \
    "$ROOT/.bender/git/checkouts/apb-35c2e79deae2aa36/src/apb_pkg.sv" \
    "$ROOT/.bender/git/checkouts/apb-35c2e79deae2aa36/src/apb_intf.sv" \
    "$ROOT/.bender/git/checkouts/apb-35c2e79deae2aa36/src/apb_err_slv.sv" \
    "$ROOT/.bender/git/checkouts/apb-35c2e79deae2aa36/src/apb_regs.sv" \
    "$ROOT/.bender/git/checkouts/apb-35c2e79deae2aa36/src/apb_cdc.sv" \
    "$ROOT/.bender/git/checkouts/apb-35c2e79deae2aa36/src/apb_demux.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/apb-35c2e79deae2aa36/include" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/include" \
    "$ROOT/.bender/git/checkouts/apb-35c2e79deae2aa36/src/apb_test.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/include" \
    "+incdir+$ROOT/.bender/git/checkouts/apb-35c2e79deae2aa36/include" \
    "$ROOT/.bender/git/checkouts/apb-35c2e79deae2aa36/test/tb_apb_regs.sv" \
    "$ROOT/.bender/git/checkouts/apb-35c2e79deae2aa36/test/tb_apb_cdc.sv" \
    "$ROOT/.bender/git/checkouts/apb-35c2e79deae2aa36/test/tb_apb_demux.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    -lint -pedanticerrors \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/include" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/include" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/src/axi_pkg.sv" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/src/axi_intf.sv" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/src/axi_atop_filter.sv" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/src/axi_burst_splitter.sv" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/src/axi_cdc_dst.sv" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/src/axi_cdc_src.sv" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/src/axi_cut.sv" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/src/axi_delayer.sv" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/src/axi_demux.sv" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/src/axi_dw_downsizer.sv" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/src/axi_dw_upsizer.sv" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/src/axi_fifo.sv" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/src/axi_id_remap.sv" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/src/axi_id_prepend.sv" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/src/axi_isolate.sv" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/src/axi_join.sv" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/src/axi_lite_demux.sv" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/src/axi_lite_join.sv" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/src/axi_lite_lfsr.sv" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/src/axi_lite_mailbox.sv" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/src/axi_lite_mux.sv" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/src/axi_lite_regs.sv" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/src/axi_lite_to_apb.sv" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/src/axi_lite_to_axi.sv" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/src/axi_modify_address.sv" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/src/axi_mux.sv" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/src/axi_serializer.sv" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/src/axi_throttle.sv" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/src/axi_to_mem.sv" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/src/axi_cdc.sv" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/src/axi_err_slv.sv" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/src/axi_dw_converter.sv" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/src/axi_id_serialize.sv" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/src/axi_lfsr.sv" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/src/axi_multicut.sv" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/src/axi_to_axi_lite.sv" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/src/axi_to_mem_banked.sv" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/src/axi_to_mem_interleaved.sv" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/src/axi_to_mem_split.sv" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/src/axi_iw_converter.sv" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/src/axi_lite_xbar.sv" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/src/axi_xbar.sv" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/src/axi_xp.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/include" \
    "+incdir+$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/include" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/src/axi_dumper.sv" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/src/axi_sim_mem.sv" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/src/axi_test.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/include" \
    "+incdir+$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/include" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/test/tb_axi_dw_pkg.sv" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/test/tb_axi_xbar_pkg.sv" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/test/tb_axi_addr_test.sv" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/test/tb_axi_atop_filter.sv" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/test/tb_axi_cdc.sv" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/test/tb_axi_delayer.sv" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/test/tb_axi_dw_downsizer.sv" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/test/tb_axi_dw_upsizer.sv" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/test/tb_axi_fifo.sv" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/test/tb_axi_isolate.sv" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/test/tb_axi_lite_mailbox.sv" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/test/tb_axi_lite_regs.sv" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/test/tb_axi_iw_converter.sv" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/test/tb_axi_lite_to_apb.sv" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/test/tb_axi_lite_to_axi.sv" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/test/tb_axi_lite_xbar.sv" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/test/tb_axi_modify_address.sv" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/test/tb_axi_serializer.sv" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/test/tb_axi_sim_mem.sv" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/test/tb_axi_to_axi_lite.sv" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/test/tb_axi_to_mem_banked.sv" \
    "$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/test/tb_axi_xbar.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/include" \
    "$ROOT/.bender/git/checkouts/axi_mem_if-aaa8deb36a2876e1/src/axi2mem.sv" \
    "$ROOT/.bender/git/checkouts/axi_mem_if-aaa8deb36a2876e1/src/deprecated/axi_mem_if.sv" \
    "$ROOT/.bender/git/checkouts/axi_mem_if-aaa8deb36a2876e1/src/deprecated/axi_mem_if_var_latency.sv" \
    "$ROOT/.bender/git/checkouts/axi_mem_if-aaa8deb36a2876e1/src/deprecated/axi_mem_if_wrap.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/include" \
    "+incdir+$ROOT/.bender/git/checkouts/axi_stream-c93293e8e7a7f6d7/include" \
    "$ROOT/.bender/git/checkouts/axi_stream-c93293e8e7a7f6d7/src/axi_stream_intf.sv" \
    "$ROOT/.bender/git/checkouts/axi_stream-c93293e8e7a7f6d7/src/axi_stream_cut.sv" \
    "$ROOT/.bender/git/checkouts/axi_stream-c93293e8e7a7f6d7/src/axi_stream_dw_downsizer.sv" \
    "$ROOT/.bender/git/checkouts/axi_stream-c93293e8e7a7f6d7/src/axi_stream_dw_upsizer.sv" \
    "$ROOT/.bender/git/checkouts/axi_stream-c93293e8e7a7f6d7/src/axi_stream_multicut.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/axi_stream-c93293e8e7a7f6d7/include" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/include" \
    "$ROOT/.bender/git/checkouts/axi_stream-c93293e8e7a7f6d7/test/axi_stream_test.sv" \
    "$ROOT/.bender/git/checkouts/axi_stream-c93293e8e7a7f6d7/test/tb_axi_stream_dw_downsizer.sv" \
    "$ROOT/.bender/git/checkouts/axi_stream-c93293e8e7a7f6d7/test/tb_axi_stream_dw_upsizer.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/include" \
    "+incdir+$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/include" \
    "+incdir+$ROOT/.bender/git/checkouts/register_interface-55d4a861c0a3a573/include" \
    "+incdir+$ROOT/.bender/git/checkouts/apb-35c2e79deae2aa36/include" \
    "$ROOT/.bender/git/checkouts/register_interface-55d4a861c0a3a573/src/reg_intf.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-55d4a861c0a3a573/vendor/lowrisc_opentitan/src/prim_subreg_arb.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-55d4a861c0a3a573/vendor/lowrisc_opentitan/src/prim_subreg_ext.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-55d4a861c0a3a573/src/apb_to_reg.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-55d4a861c0a3a573/src/axi_to_reg.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-55d4a861c0a3a573/src/periph_to_reg.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-55d4a861c0a3a573/src/reg_cdc.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-55d4a861c0a3a573/src/reg_demux.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-55d4a861c0a3a573/src/reg_err_slv.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-55d4a861c0a3a573/src/reg_mux.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-55d4a861c0a3a573/src/reg_to_apb.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-55d4a861c0a3a573/src/reg_to_mem.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-55d4a861c0a3a573/src/reg_uniform.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-55d4a861c0a3a573/src/reg_to_tlul.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-55d4a861c0a3a573/vendor/lowrisc_opentitan/src/prim_subreg_shadow.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-55d4a861c0a3a573/vendor/lowrisc_opentitan/src/prim_subreg.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-55d4a861c0a3a573/src/axi_lite_to_reg.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/include" \
    "+incdir+$ROOT/.bender/git/checkouts/register_interface-55d4a861c0a3a573/include" \
    "+incdir+$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/include" \
    "+incdir+$ROOT/.bender/git/checkouts/apb-35c2e79deae2aa36/include" \
    "$ROOT/.bender/git/checkouts/register_interface-55d4a861c0a3a573/src/reg_test.sv"
}]} {return 1}

if {[catch {vlog -incr -sv \
    -svinputport=compat \
    -override_timescale 1ns/1ps \
    -suppress 2583 \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VSIM \
    "+incdir+$ROOT/.bender/git/checkouts/register_interface-55d4a861c0a3a573/include" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-16a65734bb06714f/include" \
    "+incdir+$ROOT/.bender/git/checkouts/axi-4896f1a06c022fee/include" \
    "+incdir+$ROOT/.bender/git/checkouts/axi_stream-c93293e8e7a7f6d7/include" \
    "+incdir+$ROOT/include" \
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
    "$ROOT/tb/eth_tb.sv" \
    "$ROOT/rtl/framing_synth.sv"
}]} {return 1}
return 0
