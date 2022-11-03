//==========================================================================
//== INVECAS, Inc.
//== Generated: 12/02/2021 11:36:52
//== INVECAS Memory Release: V03R01_16AUG2018
//== 22fdsoi PDK 22FDX_V1.3_2.0
//==
//== IDTK_ROOT: /usr/pack/gf-22-kgf/invecas/mem/V03R01/IN22FDX_MEMR2PV_COMPILER_FDK/idtk
//== IDDK_ROOT: /usr/pack/gf-22-kgf/invecas/mem/V03R01/IN22FDX_MEMR2PV_COMPILER_FDK/iddk
//== IDDK_TECH: 22fdsoi
//==
//== Copyright (c) 2021 INVECAS, Inc.
//== All Rights Reserved.
//==
//== CONFIDENTIAL AND PROPRIETARY SOFTWARE OF INVECAS, INC.
//== This file may not be reproduced, modified or disclosed,
//== without express written permission of INVECAS Inc.
//==========================================================================

//==========================================================================
// Key parameters (exist only in the lower level *_memory_generic model inside of the verilog outer shell):
//
//  MSG_LVL  -- sets amount of messaging that appears in log.
//                0: least verbose,all erorr and warning messages are supressed
//                1: only prints 1st occurence of each errors
//                2: default, print 1st occurence of each error ,warning and informational message
//                3: most verbose, prints every occurence of the each error,warning and informational message
//
//  SKIP_POR -- enables memory operation when fuse inputs (MA margin adjust and RB / RW redundant steering) are 'x'.
//              - causes warning to be printed (fuse download simulation should be run to ensure these signals are initialized correctly).
//              - assigned to SKIP_POR_wire in case value needs to be forced/changed during simulation.
//
//  WL_FAIL* / BL_FAIL* / CELLx_FAIL* /CELL*FORCE_DATA -- used to inject fails into the memory during simulation.
//              - assigned to *_wire in case values need to be forced/changed during simulation.
//              - see parameter declaration section of *_memory_generic model for more details.
//
//  TESTCHIP  -- reserved for development use only (disables error messages related to T_STAB/T_WBT/MA when asserted, turns off DEEPSLEEP/POWERGATE sequence checking).
//                0: default
//
//  CLOCK_SEP -- used to adjust the amount of time that must be waited after one port's clock rising edge before a valid operation can be applied to the same address on the other port.
//               -only used if IVCS_RELAX_COLL_CHECK is defined.This is only used by true dual-port or two-port memories (like the SDP or R2P).
//                1: default value (1ns)
//
//  ROMDATA_FILE_NAME  -- this specifies the name of the file for initializing the ROM array.
//                        -accepts string for full path to file used to program the ROM.
//                        -supports ROM only
//                        -defaults to "NONE".
//
//  BINARY_FILE  -- this specifies whether the ROMDATA_FILE_NAME is in binary or hexadecimal format.
//                  -this is only used in ROM memories.
//                   1: Default.Indicates file is in binary format.
//                   0: Indicates file is in hex format.
//
//  PreloadArrayBinFile -- this specifies the name of the data file for intializing the memory array,data stored as binary data format in data file.
//                         -accepts string for full path to file used to program the memory.
//                         -Supports all the memories.
//                         -defaults to "NONE".
//
//  PreloadArrayHexFile -- this specifies the name of the data file for intializing the memory array,data stored as hexadecimal data format in data file.
//                         -accepts string for full path to file used to program the memory.
//                         -Supports all the memories.
//                         -defaults to "NONE".
//
//  Key defines:
//  ------------
//
//  IVCS_MSG_LVL     -- if defined this overrides the default MSG_LVL parameter.
//                      -this can be used to globally set a differnt MSG_LVL (See the MSG_LVL parameter description for more infomation on the allowed values ).
//
//  IVCS_PG          -- if defined enables power pins in design (VDD, VSS, VCS, VBN, VBP).
//                      -if this is defined at compile time these additional inout ports will be added to the memory.
//                      -they must be controlled to valid values (VDD=VCS=logical-1, VSS=logical-0) for the memory to function without error.
//
//  IVCS_INIT_MEM    -- if defined preloads memory with logical 0s when defined.
//                      -care should be taken to ensure the memory is initialized correctly at time 0 (otherwise the memory data will be corrupted and the pre-loaded value will be lost).
//                      -This is often used in conjunction with the SKIP_POR parameter.
//
//  IVCS_FAST_FUNC   -- if defined a "fast functional" memory model is enabled.
//                      -this model only supports functional operations (removes logic test, fail injection and redundancy modeling).
//                      -this model can be defined for faster simulations.
//
//  IVCS_CYCLE_SIM   -- if defined a simplified "synthesizable" memory model is enabled.
//                      -this is intended for use with most logic emulator based simulation flows.
//
//  IVCS_NO_SPEC_CHK -- if  defined then non-timing critical specify checks for DC test mode pins are disabled (e.g. T_LOGIC setup/hold or MA* setup/hold).
//
//  IVCS_MEM_T*      -- if defined various specparam values in specify statements in the shell can be overidden by globally defining new values.
//                        * IVCS_MEM_TXS  (input setup to clock rise)
//                        * IVCS_MEM_TXH  (input hold to clock rise)
//                        * IVCS_MEM_TCYC (minimum clock cycle time)
//                        * IVCS_MEM_TCKH (minimum clock high pulse width)
//                        * IVCS_MEM_TCKL (minimum clock low pulse width)
//                        * IVCS_MEM_TDSPGS (minimum CEN rise vs. Deep sleep / Powergate rise setup)
//                        * IVCS_MEM_TDSPGH (minimum Deep sleep / Powergate high pulse width)
//                        * IVCS_MEM_TPGH (minimum CEN fall vs. Powergate fall hold)
//                          --This value divided by IVCS_MEM_TCYC is used to generate the number of post powergate "wake up" cycles.  This number is used directly if IVCS_PGDS_DELAYCHK is asserted.
//                        * IVCS_MEM_TDSH (minimum CEN fall vs. Deep sleep fall hold)
//                          --This value divided by IVCS_MEM_TCYC is used to generate the number of post deep-sleep "wake up" cycles.  This number is used directly if IVCS_PGDS_DELAYCHK is asserted.
//                        * IVCS_MEM_TACC (minimum memory output access time)
//
//  IVCS_RELAX_COLL_CHECK -- if defined this relaxes some of the multi-port collision checking in any true dual-port or two-port memories (like the SDP or R2P).
//                           -it converts the default cycle-based checking to a time-based check.
//
//  IVCS_PGDS_DELAYCHK    -- if defined this overrides the normal checking of DEEPSLEEP/POWERGATE sequence checking (changes from counting clocked no-ops to just a CEN vs. DS/PG delay check)
//                           -this is only used in memories with DEEPSLEEP and/or POWERGATE inputs.
//                           -when using this mode is highly recommended that you set the following defines to an accurate/conservative value:
//                             --IVCS_MEM_TCYC to your slowest on chip cycle time (governs delay from CEN rise to entering a power mode)
//                             --IVCS_MEM_TPGH to the value recommended in the datasheet for your largest low power memory OR at least to 4x your cycle time (governs delay from exiting Powergate to when you can lower CEN)
//                             --IVCS_MEM_TDSH to the value recommended in the datasheet for your largest low power memory OR at least to 20x your cycle time (governs delay from exiting Deepsleep to when you can lower CEN)
//
//==========================================================================
`timescale 1ns / 1ps

`celldefine
  module IN22FDX_R2PV_WFVG_W00512B032M04C128
    (
`ifdef IVCS_PG
     inout VDD,
     inout VCS,
     inout VBN,
     inout VBP,
     inout VSS,
`endif

     input CLK_A,
     input CLK_B,
     input CEN_A,
     input CEN_B,
     input DEEPSLEEP,
     input POWERGATE,
     input [6:0] AW_A,
     input [1:0] AC_A,
     input [6:0] AW_B,
     input [1:0] AC_B,
     input [31:0] D,
     input [31:0] BW,
     input T_LOGIC,
     input MA_SAWL,
     input MA_WL,
     input MA_WRAS,
     input MA_WRASD,
     input MA_TPA,
     input MA_TPB,
     input RWE,
     input [5:0] RWFA,
     output [31:0] Q,
     output [31:0] OBSV_DBW,
     output OBSV_CTL_A,
     output OBSV_CTL_B

     );

   wire [31:0] n_Q;

   assign Q[31:0] = n_Q[31:0];

   //Notifier handling
   reg notifier_TCYC_CLKA;
   reg notifier_TCYC_CLKB;
   reg notifier_TPW_CLKA0;
   reg notifier_TPW_CLKA1;
   reg notifier_TPW_CLKB0;
   reg notifier_TPW_CLKB1;
   reg notifier_TPW_DSPG1;
   reg notifier_TSH_CLKA_ACA;
   reg notifier_TSH_CLKA_AWA;
   reg notifier_TSH_CLKA_CENA;
   reg notifier_TSH_CLKA_MASAWL;
   reg notifier_TSH_CLKA_MATPA;
   reg notifier_TSH_CLKA_MATPB;
   reg notifier_TSH_CLKA_MAWL;
   reg notifier_TSH_CLKA_MAWRAS;
   reg notifier_TSH_CLKA_MAWRASD;
   reg notifier_TSH_CLKA_RWE;
   reg notifier_TSH_CLKA_RWFA;
   reg notifier_TSH_CLKA_TLOGIC;
   reg notifier_TSH_CLKB_ACB;
   reg notifier_TSH_CLKB_AWB;
   reg notifier_TSH_CLKB_BW;
   reg notifier_TSH_CLKB_CENB;
   reg notifier_TSH_CLKB_D;
   reg notifier_TSH_CLKB_MASAWL;
   reg notifier_TSH_CLKB_MATPA;
   reg notifier_TSH_CLKB_MATPB;
   reg notifier_TSH_CLKB_MAWL;
   reg notifier_TSH_CLKB_MAWRAS;
   reg notifier_TSH_CLKB_MAWRASD;
   reg notifier_TSH_CLKB_RWE;
   reg notifier_TSH_CLKB_RWFA;
   reg notifier_TSH_CLKB_TLOGIC;
   reg notifier_TS_DSPG;

`ifdef IVCS_CYCLE_SIM
   wire notifier = 1'b0;
`else
   reg notifier1;
   reg notifier2;
   reg notifier3;
   reg notifier;

   always @(
               notifier_TCYC_CLKA
            or notifier_TCYC_CLKB
            or notifier_TPW_CLKA0
            or notifier_TPW_CLKA1
            or notifier_TPW_CLKB0
            or notifier_TPW_CLKB1
            or notifier_TPW_DSPG1
            or notifier_TSH_CLKA_CENA
            or notifier_TSH_CLKA_MASAWL
            or notifier_TSH_CLKA_MATPA
            or notifier_TSH_CLKA_MATPB
            or notifier_TSH_CLKA_MAWL
            or notifier_TSH_CLKA_MAWRAS
            or notifier_TSH_CLKA_MAWRASD
            or notifier_TSH_CLKA_RWE
            or notifier_TSH_CLKA_RWFA
            or notifier_TSH_CLKA_TLOGIC
            or notifier_TSH_CLKB_CENB
            or notifier_TSH_CLKB_MASAWL
            or notifier_TSH_CLKB_MATPA
            or notifier_TSH_CLKB_MATPB
            or notifier_TSH_CLKB_MAWL
            or notifier_TSH_CLKB_MAWRAS
            or notifier_TSH_CLKB_MAWRASD
            or notifier_TSH_CLKB_RWE
            or notifier_TSH_CLKB_RWFA
            or notifier_TSH_CLKB_TLOGIC
            or notifier_TS_DSPG
           )
     begin
        if(notifier1===1'b0) notifier1 = 1'b1;
        else                 notifier1 = 1'b0;
     end

   always @(   notifier_TSH_CLKA_ACA
            or notifier_TSH_CLKA_AWA
           )
     begin
        // Don't fire this notifier if CENA=1
        if(CEN_A!==1'b1) begin
           if(notifier2===1'b0) notifier2 = 1'b1;
           else                 notifier2 = 1'b0;
        end
     end

   always @(   notifier_TSH_CLKB_ACB
            or notifier_TSH_CLKB_AWB
            or notifier_TSH_CLKB_BW
            or notifier_TSH_CLKB_D
           )
     begin
        // Don't fire this notifier if CENB=1
        if(CEN_B!==1'b1) begin
           if(notifier3===1'b0) notifier3 = 1'b1;
           else                 notifier3 = 1'b0;
        end
     end

   always @(notifier1 or notifier2 or notifier3) begin
      if(notifier===1'b0) notifier = 1'b1;
      else                notifier = 1'b0;
   end
`endif

`ifdef IVCS_MEM_TCYC
   localparam CYCLE_TIME = `IVCS_MEM_TCYC;
`else
   localparam CYCLE_TIME = 0.9;
`endif

`ifdef IVCS_MEM_TXS
   localparam SETUP_TIME = `IVCS_MEM_TXS;
`else
   localparam SETUP_TIME = 0.01;
`endif

`ifdef IVCS_MEM_TPGH
   localparam PG_TO_CEN  = `IVCS_MEM_TPGH;
`else
   localparam PG_TO_CEN  = 1.3;
`endif

`ifdef IVCS_MEM_TDSH
   localparam DS_TO_CEN  = `IVCS_MEM_TDSH;
`else
   localparam DS_TO_CEN  = 2.5;
`endif

   IN22FDX_R2PV_WFVG_W00512B032M04C128_memory_generic
     #(
       .ALLOW_MA(1'b1),
       .W_DEPTH(512),
       .AW_SIZE(7),
       .AC_SIZE(2),
       .D_SIZE(32),
       .CYCLE_TIME_A(CYCLE_TIME),
       .CYCLE_TIME_B(CYCLE_TIME),
       .SETUP_TIME(SETUP_TIME),
       .PG_TO_CEN(PG_TO_CEN),
       .DS_TO_CEN(DS_TO_CEN)
       )
   mem0
     (
`ifdef IVCS_PG
      .VDD(VDD),
      .VCS(VCS),
      .VBN(VBN),
      .VBP(VBP),
      .VSS(VSS),
`endif
      .notifier(notifier),
      .clkA(CLK_A),
      .clkB(CLK_B),
      .cenA(CEN_A),
      .cenB(CEN_B),
      .deepsleep(DEEPSLEEP),
      .powergate(POWERGATE),
      .awA(AW_A[6:0]),
      .acA(AC_A[1:0]),
      .awB(AW_B[6:0]),
      .acB(AC_B[1:0]),
      .d(D[31:0]),
      .bw(BW[31:0]),
      .t_logic(T_LOGIC),
      .t_bist(1'b0),
      .t_deepsleep(1'b0),
      .t_powergate(1'b0),
      .t_cenA(1'b1),
      .t_cenB(1'b1),
      .t_awA({7{1'b0}}),
      .t_acA({2{1'b0}}),
      .t_awB({7{1'b0}}),
      .t_acB({2{1'b0}}),
      .t_d({32{1'b0}}),
      .t_bw({32{1'b0}}),
      .ma_sawl(MA_SAWL),
      .ma_wl(MA_WL),
      .ma_wras(MA_WRAS),
      .ma_wrasd(MA_WRASD),
      .ma_tpA(MA_TPA),
      .ma_tpB(MA_TPB),
      .rwe({1'b0,RWE}),
      .rwf1a({6{1'b0}}),
      .rwf0a(RWFA[5:0]),

      .rbe(2'b00),
      .rbf1a(8'b0000_0000),
      .rbf0a(8'b0000_0000),

      .q(n_Q),
      .obsv_dbw(OBSV_DBW[31:0]),
      .obsv_ctlA(OBSV_CTL_A),
      .obsv_ctlB(OBSV_CTL_B)

      );

   wire never;
   wire MASAWL_MAWL_MATPA     =  MA_SAWL &  MA_WL &  MA_TPA;
   wire MASAWL_MAWL_NMATPA    =  MA_SAWL &  MA_WL & ~MA_TPA;
   wire MASAWL_NMAWL_MATPA    =  MA_SAWL & ~MA_WL &  MA_TPA;
   wire MASAWL_NMAWL_NMATPA   =  MA_SAWL & ~MA_WL & ~MA_TPA;
   wire NMASAWL_MAWL_MATPA    = ~MA_SAWL &  MA_WL &  MA_TPA;
   wire NMASAWL_MAWL_NMATPA   = ~MA_SAWL &  MA_WL & ~MA_TPA;
   wire NMASAWL_NMAWL_MATPA   = ~MA_SAWL & ~MA_WL &  MA_TPA;
   wire NMASAWL_NMAWL_NMATPA  = ~MA_SAWL & ~MA_WL & ~MA_TPA;
   wire NTLOGIC = ~T_LOGIC;
   wire NMASAWL = ~MA_SAWL;

`ifdef IVCS_NO_SPEC_CHK
   //Define to turn off non-timing critical checks for typically asynchronous paths
   assign never = 0;
`else
   assign never = 1;
`endif

   specify

`ifdef IVCS_MEM_TCYC
      specparam tcyc_CLK          = `IVCS_MEM_TCYC;
`else
      specparam tcyc_CLK          = 0.9;
`endif

`ifdef IVCS_MEM_TACC
      specparam tdelay_CLK_X_01   = `IVCS_MEM_TACC;
      specparam tdelay_CLK_X_10   = `IVCS_MEM_TACC;
`else
      specparam tdelay_CLK_X_01   = 0.1;
      specparam tdelay_CLK_X_10   = 0.1;
`endif

`ifdef IVCS_MEM_TPROP
      specparam tdelay_PROP_X_01  = `IVCS_MEM_TPROP;
      specparam tdelay_PROP_X_10  = `IVCS_MEM_TPROP;
`else
      specparam tdelay_PROP_X_01  = 0.1;
      specparam tdelay_PROP_X_10  = 0.1;
`endif

`ifdef IVCS_MEM_TCKL
      specparam tpw_CLK_0         = `IVCS_MEM_TCKL;
`else
      specparam tpw_CLK_0         = 0.1;
`endif

`ifdef IVCS_MEM_TCKH
      specparam tpw_CLK_1         = `IVCS_MEM_TCKH;
`else
      specparam tpw_CLK_1         = 0.1;
`endif

`ifdef IVCS_MEM_TXS
      specparam tsetup_X_CLK      = `IVCS_MEM_TXS;
`else
      specparam tsetup_X_CLK      = 0.01;
`endif

`ifdef IVCS_MEM_TXH
      specparam thold_X_CLK       = `IVCS_MEM_TXH;
`else
      specparam thold_X_CLK       = 0.0;
`endif

`ifdef IVCS_MEM_TDSPGH
      specparam tpw_DSPG_1        = `IVCS_MEM_TDSPGH;
`else
      specparam tpw_DSPG_1        = 1.9;
`endif

`ifdef IVCS_MEM_TDSPGS
      specparam tsetup_DSPG       = `IVCS_MEM_TDSPGS;
`else
      specparam tsetup_DSPG       = 1.0;
`endif

`ifdef IVCS_MEM_TPGH
      specparam thold_PG          = `IVCS_MEM_TPGH;
`else
      specparam thold_PG          = 1.3;
`endif

`ifdef IVCS_MEM_TDSH
      specparam thold_DS          = `IVCS_MEM_TDSH;
`else
      specparam thold_DS          = 2.5;
`endif

      $period(posedge CLK_A &&& MASAWL_MAWL_MATPA   , tcyc_CLK, notifier_TCYC_CLKA);
      $period(posedge CLK_A &&& MASAWL_MAWL_NMATPA  , tcyc_CLK, notifier_TCYC_CLKA);
      $period(posedge CLK_A &&& MASAWL_NMAWL_MATPA  , tcyc_CLK, notifier_TCYC_CLKA);
      $period(posedge CLK_A &&& MASAWL_NMAWL_NMATPA , tcyc_CLK, notifier_TCYC_CLKA);
      $period(posedge CLK_A &&& NMASAWL_MAWL_MATPA  , tcyc_CLK, notifier_TCYC_CLKA);
      $period(posedge CLK_A &&& NMASAWL_MAWL_NMATPA , tcyc_CLK, notifier_TCYC_CLKA);
      $period(posedge CLK_A &&& NMASAWL_NMAWL_MATPA , tcyc_CLK, notifier_TCYC_CLKA);
      $period(posedge CLK_A &&& NMASAWL_NMAWL_NMATPA, tcyc_CLK, notifier_TCYC_CLKA);
      $period(posedge CLK_B &&& MASAWL_MAWL_MATPA   , tcyc_CLK, notifier_TCYC_CLKB);
      $period(posedge CLK_B &&& MASAWL_MAWL_NMATPA  , tcyc_CLK, notifier_TCYC_CLKB);
      $period(posedge CLK_B &&& MASAWL_NMAWL_MATPA  , tcyc_CLK, notifier_TCYC_CLKB);
      $period(posedge CLK_B &&& MASAWL_NMAWL_NMATPA , tcyc_CLK, notifier_TCYC_CLKB);
      $period(posedge CLK_B &&& NMASAWL_MAWL_MATPA  , tcyc_CLK, notifier_TCYC_CLKB);
      $period(posedge CLK_B &&& NMASAWL_MAWL_NMATPA , tcyc_CLK, notifier_TCYC_CLKB);
      $period(posedge CLK_B &&& NMASAWL_NMAWL_MATPA , tcyc_CLK, notifier_TCYC_CLKB);
      $period(posedge CLK_B &&& NMASAWL_NMAWL_NMATPA, tcyc_CLK, notifier_TCYC_CLKB);

      $width(posedge CLK_A, tpw_CLK_1, 0, notifier_TPW_CLKA1);
      $width(negedge CLK_A, tpw_CLK_0, 0, notifier_TPW_CLKA0);
      $width(posedge CLK_B, tpw_CLK_1, 0, notifier_TPW_CLKB1);
      $width(negedge CLK_B, tpw_CLK_0, 0, notifier_TPW_CLKB0);
      $width(posedge DEEPSLEEP &&& NTLOGIC, tpw_DSPG_1, 0, notifier_TPW_DSPG1);
      $width(posedge POWERGATE &&& NTLOGIC, tpw_DSPG_1, 0, notifier_TPW_DSPG1);

      $setup (posedge CEN_A, posedge DEEPSLEEP  &&& NTLOGIC, tsetup_DSPG,  notifier_TS_DSPG);
      $setup (posedge CEN_A, posedge POWERGATE  &&& NTLOGIC, tsetup_DSPG,  notifier_TS_DSPG);
      $hold (negedge DEEPSLEEP &&& NTLOGIC,negedge CEN_A, thold_DS,  notifier_TS_DSPG);
      $hold (negedge POWERGATE &&& NTLOGIC,negedge CEN_A, thold_PG,  notifier_TS_DSPG);
      $setup (posedge CEN_B, posedge DEEPSLEEP  &&& NTLOGIC, tsetup_DSPG,  notifier_TS_DSPG);
      $setup (posedge CEN_B, posedge POWERGATE  &&& NTLOGIC, tsetup_DSPG,  notifier_TS_DSPG);
      $hold (negedge DEEPSLEEP &&& NTLOGIC,negedge CEN_B, thold_DS,  notifier_TS_DSPG);
      $hold (negedge POWERGATE &&& NTLOGIC,negedge CEN_B, thold_PG,  notifier_TS_DSPG);

      $setuphold (posedge CLK_A, posedge CEN_A, tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKA_CENA);
      $setuphold (posedge CLK_A, negedge CEN_A, tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKA_CENA);
      $setuphold (posedge CLK_B, posedge CEN_B, tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_CENB);
      $setuphold (posedge CLK_B, negedge CEN_B, tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_CENB);
      $setuphold (posedge CLK_A, posedge AW_A[6], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKA_AWA);
      $setuphold (posedge CLK_A, posedge AW_A[5], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKA_AWA);
      $setuphold (posedge CLK_A, posedge AW_A[4], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKA_AWA);
      $setuphold (posedge CLK_A, posedge AW_A[3], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKA_AWA);
      $setuphold (posedge CLK_A, posedge AW_A[2], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKA_AWA);
      $setuphold (posedge CLK_A, posedge AW_A[1], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKA_AWA);
      $setuphold (posedge CLK_A, posedge AW_A[0], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKA_AWA);
      $setuphold (posedge CLK_A, negedge AW_A[6], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKA_AWA);
      $setuphold (posedge CLK_A, negedge AW_A[5], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKA_AWA);
      $setuphold (posedge CLK_A, negedge AW_A[4], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKA_AWA);
      $setuphold (posedge CLK_A, negedge AW_A[3], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKA_AWA);
      $setuphold (posedge CLK_A, negedge AW_A[2], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKA_AWA);
      $setuphold (posedge CLK_A, negedge AW_A[1], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKA_AWA);
      $setuphold (posedge CLK_A, negedge AW_A[0], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKA_AWA);
      $setuphold (posedge CLK_A, posedge AC_A[1], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKA_ACA);
      $setuphold (posedge CLK_A, posedge AC_A[0], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKA_ACA);
      $setuphold (posedge CLK_A, negedge AC_A[1], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKA_ACA);
      $setuphold (posedge CLK_A, negedge AC_A[0], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKA_ACA);
      $setuphold (posedge CLK_B, posedge AW_B[6], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_AWB);
      $setuphold (posedge CLK_B, posedge AW_B[5], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_AWB);
      $setuphold (posedge CLK_B, posedge AW_B[4], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_AWB);
      $setuphold (posedge CLK_B, posedge AW_B[3], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_AWB);
      $setuphold (posedge CLK_B, posedge AW_B[2], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_AWB);
      $setuphold (posedge CLK_B, posedge AW_B[1], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_AWB);
      $setuphold (posedge CLK_B, posedge AW_B[0], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_AWB);
      $setuphold (posedge CLK_B, negedge AW_B[6], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_AWB);
      $setuphold (posedge CLK_B, negedge AW_B[5], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_AWB);
      $setuphold (posedge CLK_B, negedge AW_B[4], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_AWB);
      $setuphold (posedge CLK_B, negedge AW_B[3], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_AWB);
      $setuphold (posedge CLK_B, negedge AW_B[2], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_AWB);
      $setuphold (posedge CLK_B, negedge AW_B[1], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_AWB);
      $setuphold (posedge CLK_B, negedge AW_B[0], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_AWB);
      $setuphold (posedge CLK_B, posedge AC_B[1], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_ACB);
      $setuphold (posedge CLK_B, posedge AC_B[0], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_ACB);
      $setuphold (posedge CLK_B, negedge AC_B[1], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_ACB);
      $setuphold (posedge CLK_B, negedge AC_B[0], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_ACB);
      $setuphold (posedge CLK_B, posedge D[31], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_D);
      $setuphold (posedge CLK_B, posedge D[30], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_D);
      $setuphold (posedge CLK_B, posedge D[29], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_D);
      $setuphold (posedge CLK_B, posedge D[28], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_D);
      $setuphold (posedge CLK_B, posedge D[27], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_D);
      $setuphold (posedge CLK_B, posedge D[26], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_D);
      $setuphold (posedge CLK_B, posedge D[25], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_D);
      $setuphold (posedge CLK_B, posedge D[24], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_D);
      $setuphold (posedge CLK_B, posedge D[23], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_D);
      $setuphold (posedge CLK_B, posedge D[22], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_D);
      $setuphold (posedge CLK_B, posedge D[21], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_D);
      $setuphold (posedge CLK_B, posedge D[20], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_D);
      $setuphold (posedge CLK_B, posedge D[19], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_D);
      $setuphold (posedge CLK_B, posedge D[18], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_D);
      $setuphold (posedge CLK_B, posedge D[17], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_D);
      $setuphold (posedge CLK_B, posedge D[16], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_D);
      $setuphold (posedge CLK_B, posedge D[15], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_D);
      $setuphold (posedge CLK_B, posedge D[14], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_D);
      $setuphold (posedge CLK_B, posedge D[13], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_D);
      $setuphold (posedge CLK_B, posedge D[12], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_D);
      $setuphold (posedge CLK_B, posedge D[11], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_D);
      $setuphold (posedge CLK_B, posedge D[10], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_D);
      $setuphold (posedge CLK_B, posedge D[9], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_D);
      $setuphold (posedge CLK_B, posedge D[8], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_D);
      $setuphold (posedge CLK_B, posedge D[7], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_D);
      $setuphold (posedge CLK_B, posedge D[6], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_D);
      $setuphold (posedge CLK_B, posedge D[5], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_D);
      $setuphold (posedge CLK_B, posedge D[4], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_D);
      $setuphold (posedge CLK_B, posedge D[3], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_D);
      $setuphold (posedge CLK_B, posedge D[2], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_D);
      $setuphold (posedge CLK_B, posedge D[1], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_D);
      $setuphold (posedge CLK_B, posedge D[0], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_D);
      $setuphold (posedge CLK_B, negedge D[31], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_D);
      $setuphold (posedge CLK_B, negedge D[30], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_D);
      $setuphold (posedge CLK_B, negedge D[29], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_D);
      $setuphold (posedge CLK_B, negedge D[28], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_D);
      $setuphold (posedge CLK_B, negedge D[27], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_D);
      $setuphold (posedge CLK_B, negedge D[26], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_D);
      $setuphold (posedge CLK_B, negedge D[25], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_D);
      $setuphold (posedge CLK_B, negedge D[24], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_D);
      $setuphold (posedge CLK_B, negedge D[23], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_D);
      $setuphold (posedge CLK_B, negedge D[22], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_D);
      $setuphold (posedge CLK_B, negedge D[21], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_D);
      $setuphold (posedge CLK_B, negedge D[20], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_D);
      $setuphold (posedge CLK_B, negedge D[19], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_D);
      $setuphold (posedge CLK_B, negedge D[18], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_D);
      $setuphold (posedge CLK_B, negedge D[17], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_D);
      $setuphold (posedge CLK_B, negedge D[16], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_D);
      $setuphold (posedge CLK_B, negedge D[15], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_D);
      $setuphold (posedge CLK_B, negedge D[14], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_D);
      $setuphold (posedge CLK_B, negedge D[13], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_D);
      $setuphold (posedge CLK_B, negedge D[12], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_D);
      $setuphold (posedge CLK_B, negedge D[11], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_D);
      $setuphold (posedge CLK_B, negedge D[10], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_D);
      $setuphold (posedge CLK_B, negedge D[9], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_D);
      $setuphold (posedge CLK_B, negedge D[8], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_D);
      $setuphold (posedge CLK_B, negedge D[7], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_D);
      $setuphold (posedge CLK_B, negedge D[6], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_D);
      $setuphold (posedge CLK_B, negedge D[5], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_D);
      $setuphold (posedge CLK_B, negedge D[4], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_D);
      $setuphold (posedge CLK_B, negedge D[3], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_D);
      $setuphold (posedge CLK_B, negedge D[2], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_D);
      $setuphold (posedge CLK_B, negedge D[1], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_D);
      $setuphold (posedge CLK_B, negedge D[0], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_D);
      $setuphold (posedge CLK_B, posedge BW[31], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_BW);
      $setuphold (posedge CLK_B, posedge BW[30], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_BW);
      $setuphold (posedge CLK_B, posedge BW[29], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_BW);
      $setuphold (posedge CLK_B, posedge BW[28], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_BW);
      $setuphold (posedge CLK_B, posedge BW[27], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_BW);
      $setuphold (posedge CLK_B, posedge BW[26], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_BW);
      $setuphold (posedge CLK_B, posedge BW[25], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_BW);
      $setuphold (posedge CLK_B, posedge BW[24], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_BW);
      $setuphold (posedge CLK_B, posedge BW[23], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_BW);
      $setuphold (posedge CLK_B, posedge BW[22], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_BW);
      $setuphold (posedge CLK_B, posedge BW[21], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_BW);
      $setuphold (posedge CLK_B, posedge BW[20], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_BW);
      $setuphold (posedge CLK_B, posedge BW[19], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_BW);
      $setuphold (posedge CLK_B, posedge BW[18], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_BW);
      $setuphold (posedge CLK_B, posedge BW[17], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_BW);
      $setuphold (posedge CLK_B, posedge BW[16], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_BW);
      $setuphold (posedge CLK_B, posedge BW[15], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_BW);
      $setuphold (posedge CLK_B, posedge BW[14], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_BW);
      $setuphold (posedge CLK_B, posedge BW[13], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_BW);
      $setuphold (posedge CLK_B, posedge BW[12], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_BW);
      $setuphold (posedge CLK_B, posedge BW[11], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_BW);
      $setuphold (posedge CLK_B, posedge BW[10], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_BW);
      $setuphold (posedge CLK_B, posedge BW[9], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_BW);
      $setuphold (posedge CLK_B, posedge BW[8], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_BW);
      $setuphold (posedge CLK_B, posedge BW[7], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_BW);
      $setuphold (posedge CLK_B, posedge BW[6], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_BW);
      $setuphold (posedge CLK_B, posedge BW[5], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_BW);
      $setuphold (posedge CLK_B, posedge BW[4], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_BW);
      $setuphold (posedge CLK_B, posedge BW[3], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_BW);
      $setuphold (posedge CLK_B, posedge BW[2], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_BW);
      $setuphold (posedge CLK_B, posedge BW[1], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_BW);
      $setuphold (posedge CLK_B, posedge BW[0], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_BW);
      $setuphold (posedge CLK_B, negedge BW[31], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_BW);
      $setuphold (posedge CLK_B, negedge BW[30], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_BW);
      $setuphold (posedge CLK_B, negedge BW[29], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_BW);
      $setuphold (posedge CLK_B, negedge BW[28], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_BW);
      $setuphold (posedge CLK_B, negedge BW[27], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_BW);
      $setuphold (posedge CLK_B, negedge BW[26], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_BW);
      $setuphold (posedge CLK_B, negedge BW[25], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_BW);
      $setuphold (posedge CLK_B, negedge BW[24], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_BW);
      $setuphold (posedge CLK_B, negedge BW[23], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_BW);
      $setuphold (posedge CLK_B, negedge BW[22], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_BW);
      $setuphold (posedge CLK_B, negedge BW[21], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_BW);
      $setuphold (posedge CLK_B, negedge BW[20], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_BW);
      $setuphold (posedge CLK_B, negedge BW[19], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_BW);
      $setuphold (posedge CLK_B, negedge BW[18], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_BW);
      $setuphold (posedge CLK_B, negedge BW[17], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_BW);
      $setuphold (posedge CLK_B, negedge BW[16], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_BW);
      $setuphold (posedge CLK_B, negedge BW[15], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_BW);
      $setuphold (posedge CLK_B, negedge BW[14], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_BW);
      $setuphold (posedge CLK_B, negedge BW[13], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_BW);
      $setuphold (posedge CLK_B, negedge BW[12], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_BW);
      $setuphold (posedge CLK_B, negedge BW[11], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_BW);
      $setuphold (posedge CLK_B, negedge BW[10], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_BW);
      $setuphold (posedge CLK_B, negedge BW[9], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_BW);
      $setuphold (posedge CLK_B, negedge BW[8], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_BW);
      $setuphold (posedge CLK_B, negedge BW[7], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_BW);
      $setuphold (posedge CLK_B, negedge BW[6], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_BW);
      $setuphold (posedge CLK_B, negedge BW[5], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_BW);
      $setuphold (posedge CLK_B, negedge BW[4], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_BW);
      $setuphold (posedge CLK_B, negedge BW[3], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_BW);
      $setuphold (posedge CLK_B, negedge BW[2], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_BW);
      $setuphold (posedge CLK_B, negedge BW[1], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_BW);
      $setuphold (posedge CLK_B, negedge BW[0], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_BW);
      $setuphold (posedge CLK_A &&& never, posedge T_LOGIC, tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKA_TLOGIC);
      $setuphold (posedge CLK_A &&& never, negedge T_LOGIC, tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKA_TLOGIC);
      $setuphold (posedge CLK_B &&& never, posedge T_LOGIC, tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_TLOGIC);
      $setuphold (posedge CLK_B &&& never, negedge T_LOGIC, tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_TLOGIC);
      $setuphold (posedge CLK_A &&& never, posedge MA_SAWL, tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKA_MASAWL);
      $setuphold (posedge CLK_A &&& never, negedge MA_SAWL, tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKA_MASAWL);
      $setuphold (posedge CLK_A &&& never, posedge MA_WL, tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKA_MAWL);
      $setuphold (posedge CLK_A &&& never, negedge MA_WL, tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKA_MAWL);
      $setuphold (posedge CLK_A &&& never, posedge MA_WRAS, tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKA_MAWRAS);
      $setuphold (posedge CLK_A &&& never, negedge MA_WRAS, tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKA_MAWRAS);
      $setuphold (posedge CLK_A &&& never, posedge MA_WRASD, tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKA_MAWRASD);
      $setuphold (posedge CLK_A &&& never, negedge MA_WRASD, tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKA_MAWRASD);
      $setuphold (posedge CLK_A &&& never, posedge MA_TPA, tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKA_MATPA);
      $setuphold (posedge CLK_A &&& never, negedge MA_TPA, tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKA_MATPA);
      $setuphold (posedge CLK_A &&& never, posedge MA_TPB, tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKA_MATPB);
      $setuphold (posedge CLK_A &&& never, negedge MA_TPB, tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKA_MATPB);
      $setuphold (posedge CLK_B &&& never, posedge MA_SAWL, tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_MASAWL);
      $setuphold (posedge CLK_B &&& never, negedge MA_SAWL, tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_MASAWL);
      $setuphold (posedge CLK_B &&& never, posedge MA_WL, tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_MAWL);
      $setuphold (posedge CLK_B &&& never, negedge MA_WL, tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_MAWL);
      $setuphold (posedge CLK_B &&& never, posedge MA_WRAS, tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_MAWRAS);
      $setuphold (posedge CLK_B &&& never, negedge MA_WRAS, tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_MAWRAS);
      $setuphold (posedge CLK_B &&& never, posedge MA_WRASD, tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_MAWRASD);
      $setuphold (posedge CLK_B &&& never, negedge MA_WRASD, tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_MAWRASD);
      $setuphold (posedge CLK_B &&& never, posedge MA_TPB, tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_MATPB);
      $setuphold (posedge CLK_B &&& never, negedge MA_TPB, tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_MATPB);
      $setuphold (posedge CLK_B &&& never, posedge MA_TPA, tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_MATPA);
      $setuphold (posedge CLK_B &&& never, negedge MA_TPA, tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_MATPA);
      $setuphold (posedge CLK_A &&& never, posedge RWE, tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKA_RWE);
      $setuphold (posedge CLK_A &&& never, negedge RWE, tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKA_RWE);
      $setuphold (posedge CLK_A &&& never, posedge RWFA[5], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKA_RWFA);
      $setuphold (posedge CLK_A &&& never, posedge RWFA[4], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKA_RWFA);
      $setuphold (posedge CLK_A &&& never, posedge RWFA[3], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKA_RWFA);
      $setuphold (posedge CLK_A &&& never, posedge RWFA[2], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKA_RWFA);
      $setuphold (posedge CLK_A &&& never, posedge RWFA[1], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKA_RWFA);
      $setuphold (posedge CLK_A &&& never, posedge RWFA[0], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKA_RWFA);
      $setuphold (posedge CLK_A &&& never, negedge RWFA[5], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKA_RWFA);
      $setuphold (posedge CLK_A &&& never, negedge RWFA[4], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKA_RWFA);
      $setuphold (posedge CLK_A &&& never, negedge RWFA[3], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKA_RWFA);
      $setuphold (posedge CLK_A &&& never, negedge RWFA[2], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKA_RWFA);
      $setuphold (posedge CLK_A &&& never, negedge RWFA[1], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKA_RWFA);
      $setuphold (posedge CLK_A &&& never, negedge RWFA[0], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKA_RWFA);
      $setuphold (posedge CLK_B &&& never, posedge RWE, tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_RWE);
      $setuphold (posedge CLK_B &&& never, negedge RWE, tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_RWE);
      $setuphold (posedge CLK_B &&& never, posedge RWFA[5], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_RWFA);
      $setuphold (posedge CLK_B &&& never, posedge RWFA[4], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_RWFA);
      $setuphold (posedge CLK_B &&& never, posedge RWFA[3], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_RWFA);
      $setuphold (posedge CLK_B &&& never, posedge RWFA[2], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_RWFA);
      $setuphold (posedge CLK_B &&& never, posedge RWFA[1], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_RWFA);
      $setuphold (posedge CLK_B &&& never, posedge RWFA[0], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_RWFA);
      $setuphold (posedge CLK_B &&& never, negedge RWFA[5], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_RWFA);
      $setuphold (posedge CLK_B &&& never, negedge RWFA[4], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_RWFA);
      $setuphold (posedge CLK_B &&& never, negedge RWFA[3], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_RWFA);
      $setuphold (posedge CLK_B &&& never, negedge RWFA[2], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_RWFA);
      $setuphold (posedge CLK_B &&& never, negedge RWFA[1], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_RWFA);
      $setuphold (posedge CLK_B &&& never, negedge RWFA[0], tsetup_X_CLK, thold_X_CLK, notifier_TSH_CLKB_RWFA);

      if (MA_SAWL) (posedge CLK_A *> (Q[31] : n_Q[31])) = (tdelay_CLK_X_01, tdelay_CLK_X_10);
      if (MA_SAWL) (posedge CLK_A *> (Q[30] : n_Q[30])) = (tdelay_CLK_X_01, tdelay_CLK_X_10);
      if (MA_SAWL) (posedge CLK_A *> (Q[29] : n_Q[29])) = (tdelay_CLK_X_01, tdelay_CLK_X_10);
      if (MA_SAWL) (posedge CLK_A *> (Q[28] : n_Q[28])) = (tdelay_CLK_X_01, tdelay_CLK_X_10);
      if (MA_SAWL) (posedge CLK_A *> (Q[27] : n_Q[27])) = (tdelay_CLK_X_01, tdelay_CLK_X_10);
      if (MA_SAWL) (posedge CLK_A *> (Q[26] : n_Q[26])) = (tdelay_CLK_X_01, tdelay_CLK_X_10);
      if (MA_SAWL) (posedge CLK_A *> (Q[25] : n_Q[25])) = (tdelay_CLK_X_01, tdelay_CLK_X_10);
      if (MA_SAWL) (posedge CLK_A *> (Q[24] : n_Q[24])) = (tdelay_CLK_X_01, tdelay_CLK_X_10);
      if (MA_SAWL) (posedge CLK_A *> (Q[23] : n_Q[23])) = (tdelay_CLK_X_01, tdelay_CLK_X_10);
      if (MA_SAWL) (posedge CLK_A *> (Q[22] : n_Q[22])) = (tdelay_CLK_X_01, tdelay_CLK_X_10);
      if (MA_SAWL) (posedge CLK_A *> (Q[21] : n_Q[21])) = (tdelay_CLK_X_01, tdelay_CLK_X_10);
      if (MA_SAWL) (posedge CLK_A *> (Q[20] : n_Q[20])) = (tdelay_CLK_X_01, tdelay_CLK_X_10);
      if (MA_SAWL) (posedge CLK_A *> (Q[19] : n_Q[19])) = (tdelay_CLK_X_01, tdelay_CLK_X_10);
      if (MA_SAWL) (posedge CLK_A *> (Q[18] : n_Q[18])) = (tdelay_CLK_X_01, tdelay_CLK_X_10);
      if (MA_SAWL) (posedge CLK_A *> (Q[17] : n_Q[17])) = (tdelay_CLK_X_01, tdelay_CLK_X_10);
      if (MA_SAWL) (posedge CLK_A *> (Q[16] : n_Q[16])) = (tdelay_CLK_X_01, tdelay_CLK_X_10);
      if (MA_SAWL) (posedge CLK_A *> (Q[15] : n_Q[15])) = (tdelay_CLK_X_01, tdelay_CLK_X_10);
      if (MA_SAWL) (posedge CLK_A *> (Q[14] : n_Q[14])) = (tdelay_CLK_X_01, tdelay_CLK_X_10);
      if (MA_SAWL) (posedge CLK_A *> (Q[13] : n_Q[13])) = (tdelay_CLK_X_01, tdelay_CLK_X_10);
      if (MA_SAWL) (posedge CLK_A *> (Q[12] : n_Q[12])) = (tdelay_CLK_X_01, tdelay_CLK_X_10);
      if (MA_SAWL) (posedge CLK_A *> (Q[11] : n_Q[11])) = (tdelay_CLK_X_01, tdelay_CLK_X_10);
      if (MA_SAWL) (posedge CLK_A *> (Q[10] : n_Q[10])) = (tdelay_CLK_X_01, tdelay_CLK_X_10);
      if (MA_SAWL) (posedge CLK_A *> (Q[9] : n_Q[9])) = (tdelay_CLK_X_01, tdelay_CLK_X_10);
      if (MA_SAWL) (posedge CLK_A *> (Q[8] : n_Q[8])) = (tdelay_CLK_X_01, tdelay_CLK_X_10);
      if (MA_SAWL) (posedge CLK_A *> (Q[7] : n_Q[7])) = (tdelay_CLK_X_01, tdelay_CLK_X_10);
      if (MA_SAWL) (posedge CLK_A *> (Q[6] : n_Q[6])) = (tdelay_CLK_X_01, tdelay_CLK_X_10);
      if (MA_SAWL) (posedge CLK_A *> (Q[5] : n_Q[5])) = (tdelay_CLK_X_01, tdelay_CLK_X_10);
      if (MA_SAWL) (posedge CLK_A *> (Q[4] : n_Q[4])) = (tdelay_CLK_X_01, tdelay_CLK_X_10);
      if (MA_SAWL) (posedge CLK_A *> (Q[3] : n_Q[3])) = (tdelay_CLK_X_01, tdelay_CLK_X_10);
      if (MA_SAWL) (posedge CLK_A *> (Q[2] : n_Q[2])) = (tdelay_CLK_X_01, tdelay_CLK_X_10);
      if (MA_SAWL) (posedge CLK_A *> (Q[1] : n_Q[1])) = (tdelay_CLK_X_01, tdelay_CLK_X_10);
      if (MA_SAWL) (posedge CLK_A *> (Q[0] : n_Q[0])) = (tdelay_CLK_X_01, tdelay_CLK_X_10);
      if (NMASAWL) (posedge CLK_A *> (Q[31] : n_Q[31])) = (tdelay_CLK_X_01, tdelay_CLK_X_10);
      if (NMASAWL) (posedge CLK_A *> (Q[30] : n_Q[30])) = (tdelay_CLK_X_01, tdelay_CLK_X_10);
      if (NMASAWL) (posedge CLK_A *> (Q[29] : n_Q[29])) = (tdelay_CLK_X_01, tdelay_CLK_X_10);
      if (NMASAWL) (posedge CLK_A *> (Q[28] : n_Q[28])) = (tdelay_CLK_X_01, tdelay_CLK_X_10);
      if (NMASAWL) (posedge CLK_A *> (Q[27] : n_Q[27])) = (tdelay_CLK_X_01, tdelay_CLK_X_10);
      if (NMASAWL) (posedge CLK_A *> (Q[26] : n_Q[26])) = (tdelay_CLK_X_01, tdelay_CLK_X_10);
      if (NMASAWL) (posedge CLK_A *> (Q[25] : n_Q[25])) = (tdelay_CLK_X_01, tdelay_CLK_X_10);
      if (NMASAWL) (posedge CLK_A *> (Q[24] : n_Q[24])) = (tdelay_CLK_X_01, tdelay_CLK_X_10);
      if (NMASAWL) (posedge CLK_A *> (Q[23] : n_Q[23])) = (tdelay_CLK_X_01, tdelay_CLK_X_10);
      if (NMASAWL) (posedge CLK_A *> (Q[22] : n_Q[22])) = (tdelay_CLK_X_01, tdelay_CLK_X_10);
      if (NMASAWL) (posedge CLK_A *> (Q[21] : n_Q[21])) = (tdelay_CLK_X_01, tdelay_CLK_X_10);
      if (NMASAWL) (posedge CLK_A *> (Q[20] : n_Q[20])) = (tdelay_CLK_X_01, tdelay_CLK_X_10);
      if (NMASAWL) (posedge CLK_A *> (Q[19] : n_Q[19])) = (tdelay_CLK_X_01, tdelay_CLK_X_10);
      if (NMASAWL) (posedge CLK_A *> (Q[18] : n_Q[18])) = (tdelay_CLK_X_01, tdelay_CLK_X_10);
      if (NMASAWL) (posedge CLK_A *> (Q[17] : n_Q[17])) = (tdelay_CLK_X_01, tdelay_CLK_X_10);
      if (NMASAWL) (posedge CLK_A *> (Q[16] : n_Q[16])) = (tdelay_CLK_X_01, tdelay_CLK_X_10);
      if (NMASAWL) (posedge CLK_A *> (Q[15] : n_Q[15])) = (tdelay_CLK_X_01, tdelay_CLK_X_10);
      if (NMASAWL) (posedge CLK_A *> (Q[14] : n_Q[14])) = (tdelay_CLK_X_01, tdelay_CLK_X_10);
      if (NMASAWL) (posedge CLK_A *> (Q[13] : n_Q[13])) = (tdelay_CLK_X_01, tdelay_CLK_X_10);
      if (NMASAWL) (posedge CLK_A *> (Q[12] : n_Q[12])) = (tdelay_CLK_X_01, tdelay_CLK_X_10);
      if (NMASAWL) (posedge CLK_A *> (Q[11] : n_Q[11])) = (tdelay_CLK_X_01, tdelay_CLK_X_10);
      if (NMASAWL) (posedge CLK_A *> (Q[10] : n_Q[10])) = (tdelay_CLK_X_01, tdelay_CLK_X_10);
      if (NMASAWL) (posedge CLK_A *> (Q[9] : n_Q[9])) = (tdelay_CLK_X_01, tdelay_CLK_X_10);
      if (NMASAWL) (posedge CLK_A *> (Q[8] : n_Q[8])) = (tdelay_CLK_X_01, tdelay_CLK_X_10);
      if (NMASAWL) (posedge CLK_A *> (Q[7] : n_Q[7])) = (tdelay_CLK_X_01, tdelay_CLK_X_10);
      if (NMASAWL) (posedge CLK_A *> (Q[6] : n_Q[6])) = (tdelay_CLK_X_01, tdelay_CLK_X_10);
      if (NMASAWL) (posedge CLK_A *> (Q[5] : n_Q[5])) = (tdelay_CLK_X_01, tdelay_CLK_X_10);
      if (NMASAWL) (posedge CLK_A *> (Q[4] : n_Q[4])) = (tdelay_CLK_X_01, tdelay_CLK_X_10);
      if (NMASAWL) (posedge CLK_A *> (Q[3] : n_Q[3])) = (tdelay_CLK_X_01, tdelay_CLK_X_10);
      if (NMASAWL) (posedge CLK_A *> (Q[2] : n_Q[2])) = (tdelay_CLK_X_01, tdelay_CLK_X_10);
      if (NMASAWL) (posedge CLK_A *> (Q[1] : n_Q[1])) = (tdelay_CLK_X_01, tdelay_CLK_X_10);
      if (NMASAWL) (posedge CLK_A *> (Q[0] : n_Q[0])) = (tdelay_CLK_X_01, tdelay_CLK_X_10);

      (posedge AW_A[6] => (OBSV_CTL_A : AW_A[6])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge AW_A[5] => (OBSV_CTL_A : AW_A[5])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge AW_A[4] => (OBSV_CTL_A : AW_A[4])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge AW_A[3] => (OBSV_CTL_A : AW_A[3])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge AW_A[2] => (OBSV_CTL_A : AW_A[2])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge AW_A[1] => (OBSV_CTL_A : AW_A[1])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge AW_A[0] => (OBSV_CTL_A : AW_A[0])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge AC_A[1] => (OBSV_CTL_A : AC_A[1])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge AC_A[0] => (OBSV_CTL_A : AC_A[0])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge CEN_A            => (OBSV_CTL_A : CEN_A))            = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge DEEPSLEEP        => (OBSV_CTL_A : DEEPSLEEP))        = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge POWERGATE        => (OBSV_CTL_A : POWERGATE))        = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge AW_A[6] => (OBSV_CTL_A : AW_A[6])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge AW_A[5] => (OBSV_CTL_A : AW_A[5])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge AW_A[4] => (OBSV_CTL_A : AW_A[4])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge AW_A[3] => (OBSV_CTL_A : AW_A[3])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge AW_A[2] => (OBSV_CTL_A : AW_A[2])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge AW_A[1] => (OBSV_CTL_A : AW_A[1])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge AW_A[0] => (OBSV_CTL_A : AW_A[0])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge AC_A[1] => (OBSV_CTL_A : AC_A[1])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge AC_A[0] => (OBSV_CTL_A : AC_A[0])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge CEN_A            => (OBSV_CTL_A : CEN_A))            = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge DEEPSLEEP        => (OBSV_CTL_A : DEEPSLEEP))        = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge POWERGATE        => (OBSV_CTL_A : POWERGATE))        = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge AW_B[6] => (OBSV_CTL_B : AW_B[6])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge AW_B[5] => (OBSV_CTL_B : AW_B[5])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge AW_B[4] => (OBSV_CTL_B : AW_B[4])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge AW_B[3] => (OBSV_CTL_B : AW_B[3])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge AW_B[2] => (OBSV_CTL_B : AW_B[2])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge AW_B[1] => (OBSV_CTL_B : AW_B[1])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge AW_B[0] => (OBSV_CTL_B : AW_B[0])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge AC_B[1] => (OBSV_CTL_B : AC_B[1])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge AC_B[0] => (OBSV_CTL_B : AC_B[0])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge CEN_B            => (OBSV_CTL_B : CEN_B))            = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge AW_B[6] => (OBSV_CTL_B : AW_B[6])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge AW_B[5] => (OBSV_CTL_B : AW_B[5])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge AW_B[4] => (OBSV_CTL_B : AW_B[4])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge AW_B[3] => (OBSV_CTL_B : AW_B[3])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge AW_B[2] => (OBSV_CTL_B : AW_B[2])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge AW_B[1] => (OBSV_CTL_B : AW_B[1])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge AW_B[0] => (OBSV_CTL_B : AW_B[0])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge AC_B[1] => (OBSV_CTL_B : AC_B[1])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge AC_B[0] => (OBSV_CTL_B : AC_B[0])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge CEN_B            => (OBSV_CTL_B : CEN_B))            = (tdelay_PROP_X_01, tdelay_PROP_X_10);

      (posedge D[31]  => (OBSV_DBW[31] : D[31]))  = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge D[30]  => (OBSV_DBW[30] : D[30]))  = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge D[29]  => (OBSV_DBW[29] : D[29]))  = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge D[28]  => (OBSV_DBW[28] : D[28]))  = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge D[27]  => (OBSV_DBW[27] : D[27]))  = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge D[26]  => (OBSV_DBW[26] : D[26]))  = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge D[25]  => (OBSV_DBW[25] : D[25]))  = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge D[24]  => (OBSV_DBW[24] : D[24]))  = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge D[23]  => (OBSV_DBW[23] : D[23]))  = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge D[22]  => (OBSV_DBW[22] : D[22]))  = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge D[21]  => (OBSV_DBW[21] : D[21]))  = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge D[20]  => (OBSV_DBW[20] : D[20]))  = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge D[19]  => (OBSV_DBW[19] : D[19]))  = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge D[18]  => (OBSV_DBW[18] : D[18]))  = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge D[17]  => (OBSV_DBW[17] : D[17]))  = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge D[16]  => (OBSV_DBW[16] : D[16]))  = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge D[15]  => (OBSV_DBW[15] : D[15]))  = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge D[14]  => (OBSV_DBW[14] : D[14]))  = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge D[13]  => (OBSV_DBW[13] : D[13]))  = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge D[12]  => (OBSV_DBW[12] : D[12]))  = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge D[11]  => (OBSV_DBW[11] : D[11]))  = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge D[10]  => (OBSV_DBW[10] : D[10]))  = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge D[9]  => (OBSV_DBW[9] : D[9]))  = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge D[8]  => (OBSV_DBW[8] : D[8]))  = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge D[7]  => (OBSV_DBW[7] : D[7]))  = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge D[6]  => (OBSV_DBW[6] : D[6]))  = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge D[5]  => (OBSV_DBW[5] : D[5]))  = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge D[4]  => (OBSV_DBW[4] : D[4]))  = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge D[3]  => (OBSV_DBW[3] : D[3]))  = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge D[2]  => (OBSV_DBW[2] : D[2]))  = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge D[1]  => (OBSV_DBW[1] : D[1]))  = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge D[0]  => (OBSV_DBW[0] : D[0]))  = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge BW[31] => (OBSV_DBW[31] : BW[31])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge BW[30] => (OBSV_DBW[30] : BW[30])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge BW[29] => (OBSV_DBW[29] : BW[29])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge BW[28] => (OBSV_DBW[28] : BW[28])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge BW[27] => (OBSV_DBW[27] : BW[27])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge BW[26] => (OBSV_DBW[26] : BW[26])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge BW[25] => (OBSV_DBW[25] : BW[25])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge BW[24] => (OBSV_DBW[24] : BW[24])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge BW[23] => (OBSV_DBW[23] : BW[23])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge BW[22] => (OBSV_DBW[22] : BW[22])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge BW[21] => (OBSV_DBW[21] : BW[21])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge BW[20] => (OBSV_DBW[20] : BW[20])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge BW[19] => (OBSV_DBW[19] : BW[19])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge BW[18] => (OBSV_DBW[18] : BW[18])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge BW[17] => (OBSV_DBW[17] : BW[17])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge BW[16] => (OBSV_DBW[16] : BW[16])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge BW[15] => (OBSV_DBW[15] : BW[15])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge BW[14] => (OBSV_DBW[14] : BW[14])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge BW[13] => (OBSV_DBW[13] : BW[13])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge BW[12] => (OBSV_DBW[12] : BW[12])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge BW[11] => (OBSV_DBW[11] : BW[11])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge BW[10] => (OBSV_DBW[10] : BW[10])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge BW[9] => (OBSV_DBW[9] : BW[9])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge BW[8] => (OBSV_DBW[8] : BW[8])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge BW[7] => (OBSV_DBW[7] : BW[7])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge BW[6] => (OBSV_DBW[6] : BW[6])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge BW[5] => (OBSV_DBW[5] : BW[5])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge BW[4] => (OBSV_DBW[4] : BW[4])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge BW[3] => (OBSV_DBW[3] : BW[3])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge BW[2] => (OBSV_DBW[2] : BW[2])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge BW[1] => (OBSV_DBW[1] : BW[1])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (posedge BW[0] => (OBSV_DBW[0] : BW[0])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge D[31]  => (OBSV_DBW[31] : D[31]))  = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge D[30]  => (OBSV_DBW[30] : D[30]))  = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge D[29]  => (OBSV_DBW[29] : D[29]))  = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge D[28]  => (OBSV_DBW[28] : D[28]))  = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge D[27]  => (OBSV_DBW[27] : D[27]))  = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge D[26]  => (OBSV_DBW[26] : D[26]))  = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge D[25]  => (OBSV_DBW[25] : D[25]))  = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge D[24]  => (OBSV_DBW[24] : D[24]))  = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge D[23]  => (OBSV_DBW[23] : D[23]))  = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge D[22]  => (OBSV_DBW[22] : D[22]))  = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge D[21]  => (OBSV_DBW[21] : D[21]))  = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge D[20]  => (OBSV_DBW[20] : D[20]))  = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge D[19]  => (OBSV_DBW[19] : D[19]))  = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge D[18]  => (OBSV_DBW[18] : D[18]))  = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge D[17]  => (OBSV_DBW[17] : D[17]))  = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge D[16]  => (OBSV_DBW[16] : D[16]))  = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge D[15]  => (OBSV_DBW[15] : D[15]))  = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge D[14]  => (OBSV_DBW[14] : D[14]))  = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge D[13]  => (OBSV_DBW[13] : D[13]))  = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge D[12]  => (OBSV_DBW[12] : D[12]))  = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge D[11]  => (OBSV_DBW[11] : D[11]))  = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge D[10]  => (OBSV_DBW[10] : D[10]))  = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge D[9]  => (OBSV_DBW[9] : D[9]))  = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge D[8]  => (OBSV_DBW[8] : D[8]))  = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge D[7]  => (OBSV_DBW[7] : D[7]))  = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge D[6]  => (OBSV_DBW[6] : D[6]))  = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge D[5]  => (OBSV_DBW[5] : D[5]))  = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge D[4]  => (OBSV_DBW[4] : D[4]))  = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge D[3]  => (OBSV_DBW[3] : D[3]))  = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge D[2]  => (OBSV_DBW[2] : D[2]))  = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge D[1]  => (OBSV_DBW[1] : D[1]))  = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge D[0]  => (OBSV_DBW[0] : D[0]))  = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge BW[31] => (OBSV_DBW[31] : BW[31])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge BW[30] => (OBSV_DBW[30] : BW[30])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge BW[29] => (OBSV_DBW[29] : BW[29])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge BW[28] => (OBSV_DBW[28] : BW[28])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge BW[27] => (OBSV_DBW[27] : BW[27])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge BW[26] => (OBSV_DBW[26] : BW[26])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge BW[25] => (OBSV_DBW[25] : BW[25])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge BW[24] => (OBSV_DBW[24] : BW[24])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge BW[23] => (OBSV_DBW[23] : BW[23])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge BW[22] => (OBSV_DBW[22] : BW[22])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge BW[21] => (OBSV_DBW[21] : BW[21])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge BW[20] => (OBSV_DBW[20] : BW[20])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge BW[19] => (OBSV_DBW[19] : BW[19])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge BW[18] => (OBSV_DBW[18] : BW[18])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge BW[17] => (OBSV_DBW[17] : BW[17])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge BW[16] => (OBSV_DBW[16] : BW[16])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge BW[15] => (OBSV_DBW[15] : BW[15])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge BW[14] => (OBSV_DBW[14] : BW[14])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge BW[13] => (OBSV_DBW[13] : BW[13])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge BW[12] => (OBSV_DBW[12] : BW[12])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge BW[11] => (OBSV_DBW[11] : BW[11])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge BW[10] => (OBSV_DBW[10] : BW[10])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge BW[9] => (OBSV_DBW[9] : BW[9])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge BW[8] => (OBSV_DBW[8] : BW[8])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge BW[7] => (OBSV_DBW[7] : BW[7])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge BW[6] => (OBSV_DBW[6] : BW[6])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge BW[5] => (OBSV_DBW[5] : BW[5])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge BW[4] => (OBSV_DBW[4] : BW[4])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge BW[3] => (OBSV_DBW[3] : BW[3])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge BW[2] => (OBSV_DBW[2] : BW[2])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge BW[1] => (OBSV_DBW[1] : BW[1])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);
      (negedge BW[0] => (OBSV_DBW[0] : BW[0])) = (tdelay_PROP_X_01, tdelay_PROP_X_10);

   endspecify

endmodule
`endcelldefine
module IN22FDX_R2PV_WFVG_W00512B032M04C128_memory_generic
  #(
`ifdef IVCS_MSG_LVL
    parameter MSG_LVL         = `IVCS_MSG_LVL,
`else
    parameter MSG_LVL         = 2,
`endif
    parameter SKIP_POR        = 0,
    parameter TESTCHIP        = 0,
    parameter ALLOW_MA        = 0, // =1 will allow ma_sawl to be at a non-zero value
    parameter CLOCK_SEP       = 1,

    parameter PreloadArrayBinFile = "NONE",
    parameter PreloadArrayHexFile = "NONE",

`ifndef IVCS_FAST_FUNC
    // The following parameters are locally defined to force W/L, B/L and
    // single cell fails. If they are not overridden with a heirarchical
    // defparam at a higher level, no fails will be injected
    parameter WL_FAIL         = 0, // =1 if a w/l fail is being forced
    parameter WL_FAIL_RWL     = 0, // =1 if this is a redundant w/l fail
    parameter WL_FAIL_ROW     = 0, // row address of w/l fail -- only 0-1 are valid if WL_FAIL_RWL=1
    parameter WL_FAIL_DATA    = 0, // data to force onto every bit of the failing WL

    parameter BL_FAIL         = 0, // =1 if a b/l fail is being forced
    parameter BL_FAIL_COL     = 0, // column address of b/l fail
    parameter BL_FAIL_BIT     = 0, // failing b/l
    parameter BL_FAIL_DATA    = 0, // data to force onto every bit of the failing BL

    parameter CELL0_FAIL      = 0, // =1 if 1st single cell fail is being forced
    parameter CELL0_FAIL_RWL  = 0, // =1 if this is a red. w/l fail
    parameter CELL0_FAIL_ROW  = 0, // row address of single cell fail 0    -- only 0-1 are valid if CELL0_FAIL_RWL=1
    parameter CELL0_FAIL_COL  = 0, // column address of single cell fail 0
    parameter CELL0_FAIL_BIT  = 0, // b/l of single cell fail 0
    parameter CELL0_FORCE_DATA= 0, // data to force on the read of failing cell 0

    parameter CELL1_FAIL      = 0, // =1 if 2nd single cell fail is being forced
    parameter CELL1_FAIL_RWL  = 0, // =1 if this is a red. w/l fail
    parameter CELL1_FAIL_ROW  = 0, // row address of single cell fail 1    -- only 0-1 are valid if CELL1_FAIL_RWL=1
    parameter CELL1_FAIL_COL  = 0, // column address of single cell fail 1
    parameter CELL1_FAIL_BIT  = 0, // b/l of single cell fail 1
    parameter CELL1_FORCE_DATA= 0, // data to force on the read of failing cell 1

    parameter CELL2_FAIL      = 0, // =1 if 3rd single cell fail is being forced
    parameter CELL2_FAIL_RWL  = 0, // =1 if this is a red. w/l fail
    parameter CELL2_FAIL_ROW  = 0, // row address of single cell fail 2    -- only 0-1 are valid if CELL2_FAIL_RWL=1
    parameter CELL2_FAIL_COL  = 0, // column address of single cell fail 2
    parameter CELL2_FAIL_BIT  = 0, // b/l of single cell fail 2
    parameter CELL2_FORCE_DATA= 0, // data to force on the read of failing cell 2

    parameter CELL3_FAIL      = 0, // =1 if 4th single cell fail is being forced
    parameter CELL3_FAIL_RWL  = 0, // =1 if this is a red. w/l fail
    parameter CELL3_FAIL_ROW  = 0, // row address of single cell fail 3    -- only 0-1 are valid if CELL3_FAIL_RWL=1
    parameter CELL3_FAIL_COL  = 0, // column address of single cell fail 3
    parameter CELL3_FAIL_BIT  = 0, // b/l of single cell fail 3
    parameter CELL3_FORCE_DATA= 0, // data to force on the read of failing cell 3
`endif

    // These parameters define the size and decode of the SRAM
    parameter W_DEPTH=8192,         // total array depth (banks x rows x cols)
    parameter AW_SIZE=8,            // bits required for row address
    parameter AC_SIZE=2,            // bits required for column address
    parameter D_SIZE=160,           // bit width of the SRAM
    parameter CYCLE_TIME_A = 1.000,
    parameter CYCLE_TIME_B = 1.000,
    parameter SETUP_TIME =   0.010,
    parameter PG_TO_CEN  =  40.000,
    parameter DS_TO_CEN  = 200.000
    )
   (
`ifdef IVCS_PG
    inout VDD,
    inout VCS,
    inout VBN,
    inout VBP,
    inout VSS,
`endif

    input notifier,

    input deepsleep,
    input powergate,

    input clkA,
    input cenA,
    input [AW_SIZE-1:0] awA,
    input [AC_SIZE-1:0] acA,

    input clkB,
    input cenB,
    input [AW_SIZE-1:0] awB,
    input [AC_SIZE-1:0] acB,
    input [D_SIZE-1:0] d,
    input [D_SIZE-1:0] bw,

    input t_deepsleep,
    input t_powergate,

    input t_cenA,
    input [AW_SIZE-1:0] t_awA,
    input [AC_SIZE-1:0] t_acA,

    input t_cenB,
    input [AW_SIZE-1:0] t_awB,
    input [AC_SIZE-1:0] t_acB,
    input [D_SIZE-1:0] t_d,
    input [D_SIZE-1:0] t_bw,

    input t_bist,
    input t_logic,
    input ma_sawl,
    input ma_wl,
    input ma_wras,
    input ma_wrasd,
    input ma_tpA,
    input ma_tpB,
    input [1:0] rbe,
    input [7:0] rbf1a,
    input [7:0] rbf0a,
    input [1:0] rwe,
    input [5:0] rwf1a,
    input [5:0] rwf0a,

    output [D_SIZE-1:0] q,

    output [D_SIZE-1:0] obsv_dbw,
    output obsv_ctlA,
    output obsv_ctlB
    );

`ifdef IVCS_CYCLE_SIM

   localparam A_SIZE = AW_SIZE + AC_SIZE;
   localparam ARRAY_DEPTH = W_DEPTH;

   reg [D_SIZE-1:0] array [0:ARRAY_DEPTH-1];
   reg [D_SIZE-1:0] dataA_l1;
   wire [A_SIZE-1:0] arrayAddrA;
   wire [A_SIZE-1:0] arrayAddrB;

   // BIST muxing
   wire               cenAI   = t_bist ? t_cenA   : cenA;
   wire [AW_SIZE-1:0] awAI    = t_bist ? t_awA    : awA;
   wire [AC_SIZE-1:0] acAI    = t_bist ? t_acA    : acA;
   wire               cenBI   = t_bist ? t_cenB   : cenB;
   wire [AW_SIZE-1:0] awBI    = t_bist ? t_awB    : awB;
   wire [AC_SIZE-1:0] acBI    = t_bist ? t_acB    : acB;
   wire [D_SIZE-1:0]  bwBI    = t_bist ? t_bw     : bw;
   wire [D_SIZE-1:0]  dBI     = t_bist ? t_d      : d;

   assign arrayAddrA = {awAI, acAI};
   assign arrayAddrB = {awBI, acBI};

   always @(posedge clkA) begin
      // Read
      if (!cenAI) begin
         dataA_l1 <= array[arrayAddrA];
      end
   end

   always @(posedge clkB) begin
      // Write
      if (!cenBI) begin
	 array[arrayAddrB] <= (bwBI & dBI) | (~bwBI & array[arrayAddrB]);
      end
   end

   // Generate Q output
   assign q = dataA_l1;

   // Tie unused outputs
   assign obsv_dbw = 0;
   assign obsv_ctlA = 0;
   assign obsv_ctlB = 0;

`else // !`ifdef  IVCS_CYCLE_SIM

   ////////////////////////////////////////////////////
   // Local parameter / wire / reg definition
   ////////////////////////////////////////////////////

   //Assign user controlled parameters to wires so they can be forced as needed
   wire        TESTCHIP_wire    = TESTCHIP;
   wire        SKIP_POR_wire    = SKIP_POR;

   // Segment math
   localparam MUX = (2**AC_SIZE);

 `ifndef IVCS_FAST_FUNC
   wire        WL_FAIL_wire          = WL_FAIL;
   wire        WL_FAIL_RWL_wire      = WL_FAIL_RWL;
   wire [31:0] WL_FAIL_ROW_wire      = WL_FAIL_ROW;
   wire        WL_FAIL_DATA_wire     = WL_FAIL_DATA;

   wire        BL_FAIL_wire          = BL_FAIL;
   wire [31:0] BL_FAIL_COL_wire      = BL_FAIL_COL;
   wire [31:0] BL_FAIL_BIT_wire      = BL_FAIL_BIT;
   wire        BL_FAIL_DATA_wire     = BL_FAIL_DATA;

   wire        CELL0_FAIL_wire       = CELL0_FAIL;
   wire        CELL0_FAIL_RWL_wire   = CELL0_FAIL_RWL;
   wire [31:0] CELL0_FAIL_ROW_wire   = CELL0_FAIL_ROW;
   wire [31:0] CELL0_FAIL_COL_wire   = CELL0_FAIL_COL;
   wire [31:0] CELL0_FAIL_BIT_wire   = CELL0_FAIL_BIT;
   wire        CELL0_FORCE_DATA_wire = CELL0_FORCE_DATA;

   wire        CELL1_FAIL_wire       = CELL1_FAIL;
   wire        CELL1_FAIL_RWL_wire   = CELL1_FAIL_RWL;
   wire [31:0] CELL1_FAIL_ROW_wire   = CELL1_FAIL_ROW;
   wire [31:0] CELL1_FAIL_COL_wire   = CELL1_FAIL_COL;
   wire [31:0] CELL1_FAIL_BIT_wire   = CELL1_FAIL_BIT;
   wire        CELL1_FORCE_DATA_wire = CELL1_FORCE_DATA;

   wire        CELL2_FAIL_wire       = CELL2_FAIL;
   wire        CELL2_FAIL_RWL_wire   = CELL2_FAIL_RWL;
   wire [31:0] CELL2_FAIL_ROW_wire   = CELL2_FAIL_ROW;
   wire [31:0] CELL2_FAIL_COL_wire   = CELL2_FAIL_COL;
   wire [31:0] CELL2_FAIL_BIT_wire   = CELL2_FAIL_BIT;
   wire        CELL2_FORCE_DATA_wire = CELL2_FORCE_DATA;

   wire        CELL3_FAIL_wire       = CELL3_FAIL;
   wire        CELL3_FAIL_RWL_wire   = CELL3_FAIL_RWL;
   wire [31:0] CELL3_FAIL_ROW_wire   = CELL3_FAIL_ROW;
   wire [31:0] CELL3_FAIL_COL_wire   = CELL3_FAIL_COL;
   wire [31:0] CELL3_FAIL_BIT_wire   = CELL3_FAIL_BIT;
   wire        CELL3_FORCE_DATA_wire = CELL3_FORCE_DATA;

   wire any_fail = CELL0_FAIL_wire | CELL1_FAIL_wire | CELL2_FAIL_wire | CELL3_FAIL_wire | WL_FAIL_wire | BL_FAIL_wire;
 `endif

   // Internal versions of the inputs after muxing/gating
   wire cenAI;
   wire [AW_SIZE-1:0] awAI;
   wire [AC_SIZE-1:0] acAI;
   wire cenBI;
   wire [AW_SIZE-1:0] awBI;
   wire [AC_SIZE-1:0] acBI;
   wire [D_SIZE-1:0]  dBI;
   wire [D_SIZE-1:0]  bwBI;
   wire deepsleepI;
   wire powergateI;
   wire [1:0] rbeI;
   wire [7:0] rbfI [1:0];
   wire [1:0] rweI;
   wire [5:0] rwfI [1:0];
   wire ma_sawlI;
   wire ma_wlI;
   wire ma_wrasI;
   wire ma_wrasdI;
   wire ma_tpAI;
   wire ma_tpBI;


   //////////////////////////////////////////////////////////////////////
   // Declare the memory array
   //////////////////////////////////////////////////////////////////////

   localparam A_SIZE = AW_SIZE + AC_SIZE;

   // Oversize depth of array to account for 1 pair of RWL
   localparam ARRAY_DEPTH = W_DEPTH + 4*MUX;

   reg [D_SIZE-1:0] array [0:ARRAY_DEPTH-1];

   // Internal clocks
   reg  clkGateA;
   reg  clkGateB;
   wire clkAI;
   wire clkBI;
   reg  iClkA;
   reg  iClkB;
   reg  oldClkA;
   reg  oldClkB;

   // Flags to indicate known good input states
   wire readOK;
   wire inputXOR;

   // Various registers used by array reads/writes
   reg [D_SIZE-1:0] array_dataA;
   reg [D_SIZE-1:0] dataA_l1;

   ////////////////////////////////////////////////////
   // BIST mux / scan mux
   ////////////////////////////////////////////////////

   // BIST mux with SETUP_TIME delay added to require setup time > 0
   assign #SETUP_TIME cenAI       = t_bist ? t_cenA       : cenA;
   assign #SETUP_TIME awAI        = t_bist ? t_awA        : awA;
   assign #SETUP_TIME acAI        = t_bist ? t_acA        : acA;
   assign #SETUP_TIME cenBI       = t_bist ? t_cenB       : cenB;
   assign #SETUP_TIME awBI        = t_bist ? t_awB        : awB;
   assign #SETUP_TIME acBI        = t_bist ? t_acB        : acB;
   assign #SETUP_TIME dBI         = t_bist ? t_d          : d;
   assign #SETUP_TIME bwBI        = t_bist ? t_bw         : bw;
   assign #SETUP_TIME deepsleepI  = t_bist ? t_deepsleep  : deepsleep;
   assign #SETUP_TIME powergateI  = t_bist ? t_powergate  : powergate;

   // Assign red. w/l and b/l to their internal array equivalent for ease of use
   assign rbeI          = SKIP_POR_wire               ? 0 : rbe;
   assign rbfI[0]       = (SKIP_POR_wire || !rbeI[0]) ? 0 : rbf0a;
   assign rbfI[1]       = (SKIP_POR_wire || !rbeI[1]) ? 0 : rbf1a;
   assign rweI          = SKIP_POR_wire               ? 0 : rwe;
   assign rwfI[0]       = (SKIP_POR_wire || !rweI[0]) ? 0 : rwf0a;
   assign rwfI[1]       = (SKIP_POR_wire || !rweI[1]) ? 0 : rwf1a;
   assign ma_sawlI      = SKIP_POR_wire               ? 0 : ma_sawl;
   assign ma_wlI        = SKIP_POR_wire               ? 0 : ma_wl;
   assign ma_wrasI      = SKIP_POR_wire               ? 0 : ma_wras;
   assign ma_wrasdI     = SKIP_POR_wire               ? 0 : ma_wrasd;
   assign ma_tpAI       = SKIP_POR_wire               ? 0 : ma_tpA;
   assign ma_tpBI       = SKIP_POR_wire               ? 0 : ma_tpB;

   ////////////////////////////////////////////////////
   // Check inputs, power supplies, timing notifier, etc.
   ////////////////////////////////////////////////////

   wire pModeFatal;

   // Messaging triggers
   reg [14:0] msgTrigger;

   localparam MSG_DS    =  0;
   localparam MSG_IOK   =  1;
   localparam MSG_INIT  =  2;
   localparam MSG_MA    =  3;
   localparam MSG_OOB   =  4;
   localparam MSG_PMODE =  5;
   localparam MSG_POR   =  6;
   localparam MSG_RD    =  7;
   localparam MSG_RX    =  8;
   localparam MSG_STAB  =  9;
   localparam MSG_VOLT  = 10;
   localparam MSG_WBT   = 11;
   localparam MSG_KA    = 12;
   localparam MSG_CLK   = 13;
   localparam MSG_COLL  = 14;

   // non-killArray triggers
   reg startTrigger;
   reg porTrigger;
   reg collTrigger;
   reg dsTrigger;

   // killArray triggers
   reg [8:0] killArrayA;
   reg [8:0] killArrayB;
   wire killArrayORA;
   wire killArrayORB;
   reg  killFlagA;
   reg  killFlagB;

   localparam KA_IXOR  = 0;
   localparam KA_VOLT  = 1;
   localparam KA_PMODE = 2;
   localparam KA_CLK   = 3;
   localparam KA_MA    = 4;
   localparam KA_RX    = 5;
   localparam KA_TMG   = 6;
   localparam KA_STAB  = 7;
   localparam KA_WBT   = 8;

   // killData triggers
   reg [2:0] killDataA;
   wire killDataORA;
   reg killDataFlagA;

   localparam KD_RX   = 0;
   localparam KD_STAB = 1;
   localparam KD_COLL = 2;

   integer cntA;
   integer cntB;

   // T_STAB and MA must be at correct value during read operations
   assign readOK = TESTCHIP_wire | ((ALLOW_MA | ma_sawlI===0) & (ma_wlI===0) & (ma_wrasdI===0) & (ma_wrasI===0) & (ma_tpAI===0) & (ma_tpBI===0));

   //No x's on inputs (check after SKIP_POR gating such that X's are ignored if SKIP_POR is asserted)
   assign inputXOR = ((ma_sawlI    ^ ma_sawlI  ) === 0 &
                      (ma_wlI      ^ ma_wlI    ) === 0 &
                      (ma_wrasI    ^ ma_wrasI  ) === 0 &
                      (ma_wrasdI   ^ ma_wrasdI ) === 0 &
                      (ma_tpAI     ^ ma_tpAI   ) === 0 &
                      (ma_tpBI     ^ ma_tpBI   ) === 0 &
                      (rbeI        ^ rbeI      ) === 0 &
                      (rbfI[0]     ^ rbfI[0]   ) === 0 &
                      (rbfI[1]     ^ rbfI[1]   ) === 0 &
                      (rweI        ^ rweI      ) === 0 &
                      (rwfI[0]     ^ rwfI[0]   ) === 0 &
                      (rwfI[1]     ^ rwfI[1]   ) === 0 &
                      (t_bist      ^ t_bist    ) === 0 &
                      (t_logic     ^ t_logic   ) === 0 &
                      (~t_bist & (deepsleep   ^ deepsleep  )) === 0 &
                      (~t_bist & (powergate   ^ powergate  )) === 0 &
                      ( t_bist & (t_deepsleep ^ t_deepsleep)) === 0 &
                      ( t_bist & (t_powergate ^ t_powergate)) === 0);

   // Async error/warning checks
   always @(SKIP_POR_wire or inputXOR or t_logic or pModeFatal or deepsleepI) begin

      if (startTrigger) begin

         // Warn the user
         if (SKIP_POR_wire && (MSG_LVL > 1) && !porTrigger) begin
            $display("%m WARNING: At time %0t SKIP_POR is set. Skipping proper memory initialization requirements.", $time);
            $display("%m          Please remember to simulate a true memory init sequence prior to completing a chip design.");
            porTrigger = 1;
         end

 `ifdef IVCS_RELAX_COLL_CHECK
         if (startTrigger && (MSG_LVL > 1) && !collTrigger) begin
            $display("%m WARNING: Collision checking is being relaxed. Cycle based checks have been converted to");
            $display("%m        : time based checks. Read/Write operations are now considered complete after a");
            $display("%m        : parameterized CLOCK_SEP amount of time (defaults to 1ns). This may be optimistic");
            $display("%m        : depending on operating conditions and could lead to hardware failure--please");
            $display("%m        : adjust CLOCK_SEP to match your memory application (worst case access/cycle).");
            $display("%m        : This should typically be used only if clock gating is employed (which makes");
            $display("%m        : cycle based checks ineffective/overly pessimistic).");
            collTrigger = 1;
         end
 `endif

         // Check for X on any inputs monitored by inputXOR above
         if ((t_logic!==1'b1) && !inputXOR && !killArrayA[KA_IXOR]) begin
            ERROR_TASK(MSG_IOK, "One or more async/DC inputs (T_BIST, T_LOGIC, etc.) are unknown. Array contents are now invalid.");
            killArrayA[KA_IXOR] = 1;
         end

         if ((t_logic!==1'b1) && !inputXOR && !killArrayB[KA_IXOR]) begin
            ERROR_TASK(MSG_IOK, "One or more async/DC inputs (T_BIST, T_LOGIC, etc.) are unknown. Array contents are now invalid.");
            killArrayB[KA_IXOR] = 1;
         end

         // Triggered by powermode state machine
         if (pModeFatal && !killArrayA[KA_PMODE]) begin
            ERROR_TASK(MSG_PMODE, "Incorrect DEEPSLEEP/POWERGATE usage. Array contents are now invalid.");
            killArrayA[KA_PMODE] = 1;
         end

         if (pModeFatal && !killArrayB[KA_PMODE]) begin
            ERROR_TASK(MSG_PMODE, "Incorrect DEEPSLEEP/POWERGATE usage. Array contents are now invalid.");
            killArrayB[KA_PMODE] = 1;
         end

         // Check if DEEPSLEEP/T_DEEPSLEEP comes on at any point
         if (!t_logic && deepsleepI && !dsTrigger) begin
            INFO_TASK(MSG_DS, "DEEPSLEEP or T_DEEPSLEEP is active. Array contents are now invalid.");
            dsTrigger = 1;
         end

         // These triggers clear as soon as the onset condition goes away
         if (!SKIP_POR_wire) porTrigger          = 0;
         if (inputXOR      ) killArrayA[KA_IXOR] = 0;
         if (inputXOR      ) killArrayB[KA_IXOR] = 0;
         if (!pModeFatal   ) killArrayA[KA_PMODE] = 0;
         if (!pModeFatal   ) killArrayB[KA_PMODE] = 0;
         if (!deepsleepI   ) dsTrigger           = 0;

      end // if (startTrigger)
   end

   // Similar to above, but any transition (rather than a particular state) will wipe out the array
   // These triggers will cleared in the array access block after killing the array
   always @(ma_sawl or ma_wl or ma_wras or ma_wrasd or ma_tpA or ma_tpB) begin
      if (startTrigger && !t_logic && !killArrayA[KA_MA] && !cenAI) begin
         if (!TESTCHIP_wire) begin
            ERROR_TASK(MSG_MA, "Margin Adjust (MA_*) signals are switching when CEN or T_CEN is active. This could cause incorrect memory operation. Array contents are now invalid.");
            killArrayA[KA_MA] = 1;
         end
         else begin
            WARNING_TASK(MSG_MA, "Margin Adjust (MA_*) signals are switching when CEN or T_CEN is active. This could cause incorrect memory operation and should be reviewed.");
         end
      end
      if (startTrigger && !t_logic && !killArrayB[KA_MA] && !cenBI) begin
         if (!TESTCHIP_wire) begin
            ERROR_TASK(MSG_MA, "Margin Adjust (MA_*) signals are switching when CEN or T_CEN is active. This could cause incorrect memory operation. Array contents are now invalid.");
            killArrayB[KA_MA] = 1;
         end
         else begin
            WARNING_TASK(MSG_MA, "Margin Adjust (MA_*) signals are switching when CEN or T_CEN is active. This could cause incorrect memory operation and should be reviewed.");
         end
      end
   end

   always @(rbeI or rbfI[0] or rbfI[1]  or rweI or rwfI[0] or rwfI[1]) begin
      if (startTrigger && !t_logic) begin
         if (!killArrayB[KA_RX] && !cenBI) begin
            ERROR_TASK(MSG_RX, "Redundancy steering inputs (RB* or RW*) are switching when a write is active. This could cause incorrect memory operation. Array contents are now invalid.");
            killArrayB[KA_RX] = 1;
         end
         if (!killDataA[KD_RX] && !cenAI) begin
            ERROR_TASK(MSG_RX, "Redundancy steering inputs (RB* or RW*) are switching when a read is active. Output Q are now invalid.");
            killDataA[KD_RX] = 1;
         end
      end
   end

`ifdef IVCS_PG
   //Power supplies (if present in the model)
   always @ (VDD or VSS or VCS or VBN or VBP or startTrigger) begin
      if(startTrigger) begin
         if ((!killArrayA[KA_VOLT] || !killArrayB[KA_VOLT]) &&
             ((VDD  !== 1'b1) || (VSS  !== 1'b0) || (VCS !== 1'b1) ||
              (VBN  === 1'bx) || (VBN  === 1'bz) ||
              (VBP  === 1'bx) || (VBP  === 1'bz))) begin

            ERROR_TASK(MSG_VOLT, "Voltage supplies are not at correct level. Array contents are now invalid.");
            killArrayA[KA_VOLT] = 1;
            killArrayB[KA_VOLT] = 1;

         end
         else if (((VDD  === 1'b1) && (VSS  === 1'b0) && (VCS === 1'b1) &&
                   (VBN  !== 1'bx) && (VBN  !== 1'bz) &&
                   (VBP  !== 1'bx) && (VBP  !== 1'bz))) begin

            killArrayA[KA_VOLT] = 0; //For memories with an unlock requirement we would also set unlock* back to 0
            killArrayB[KA_VOLT] = 0; //For memories with an unlock requirement we would also set unlock* back to 0

         end
      end
   end
`endif //  `ifdef IVCS_PG

   //Timing check notifier
   always @(notifier) begin
      if (startTrigger && !killArrayA[KA_TMG]) begin
         killArrayA[KA_TMG] = 1;   //No messaging (rely on specify messaging for timing issues)
      end
      if (startTrigger && !killArrayB[KA_TMG]) begin
         killArrayB[KA_TMG] = 1;   //No messaging (rely on specify messaging for timing issues)
      end
   end

   //Deepsleep/Powergate check
 `ifndef IVCS_PGDS_DELAYCHK

   //Normal no-op clock counting check
   localparam integer PG_WKUP_CNT_A = (PG_TO_CEN > CYCLE_TIME_A) ? (PG_TO_CEN/CYCLE_TIME_A)-1 : 0;
   localparam integer DS_WKUP_CNT_A = (DS_TO_CEN > CYCLE_TIME_A) ? (DS_TO_CEN/CYCLE_TIME_A)-1 : 0;

   localparam PMODE_START_STATE  = 3'b000;
   localparam PMODE_ENABLE_STATE = 3'b001;
   localparam PMODE_DS_STATE     = 3'b010;
   localparam PMODE_PG_STATE     = 3'b011;
   localparam PMODE_DSEXIT_STATE = 3'b100;
   localparam PMODE_PGEXIT_STATE = 3'b101;
   localparam PMODE_ERROR_STATE  = 3'b110;

   reg [2:0] n_pModeFSMA;
   reg [2:0] r_pModeFSMA;
   reg       n_pModeStartA;
   reg       n_pModeDSexitA;
   reg       n_pModePGexitA;
   reg       n_pModeErrorA;
   reg       n_pModeEnableA;

   always @ (*) begin
      n_pModeStartA = 0;
      n_pModeDSexitA = 0;
      n_pModePGexitA = 0;
      n_pModeErrorA = 0;
      n_pModeEnableA = 0;

      // Allow model to be "powered-up" with DEEPSLEEP asserted
      if (!startTrigger && !t_logic && cenAI && deepsleepI && !powergateI) begin
         n_pModeFSMA = PMODE_DS_STATE;
      end
      // Allow model to be "powered-up" with POWERGATE asserted
      else if (!startTrigger && !t_logic && cenAI && !deepsleepI && powergateI) begin
         n_pModeFSMA = PMODE_PG_STATE;
      end
      else if (!startTrigger || t_logic) begin
         n_pModeFSMA = PMODE_START_STATE;
      end
      else begin
         case (r_pModeFSMA)

           PMODE_START_STATE :
             begin
                n_pModeStartA = 1;
                if (deepsleepI || powergateI)                  n_pModeFSMA = PMODE_ERROR_STATE;
                else if (cenAI && !deepsleepI && !powergateI)  n_pModeFSMA = PMODE_ENABLE_STATE;
                else                                           n_pModeFSMA = PMODE_START_STATE;
             end

           PMODE_ENABLE_STATE :
             begin
                n_pModeEnableA = 1;
                if (!cenAI && (deepsleepI || powergateI))      n_pModeFSMA = PMODE_ERROR_STATE;
                else if (cenAI && deepsleepI && !powergateI)   n_pModeFSMA = PMODE_DS_STATE;
                else if (cenAI && !deepsleepI && powergateI)   n_pModeFSMA = PMODE_PG_STATE;
                else if (!cenAI && !deepsleepI && !powergateI) n_pModeFSMA = PMODE_START_STATE;
                else                                           n_pModeFSMA = PMODE_ENABLE_STATE;
             end

           PMODE_DS_STATE :
             begin
                if (!cenAI || powergateI)                      n_pModeFSMA = PMODE_ERROR_STATE;
                else if (cenAI && !deepsleepI && !powergateI)  n_pModeFSMA = PMODE_DSEXIT_STATE;
                else                                           n_pModeFSMA = PMODE_DS_STATE;
             end

           PMODE_PG_STATE :
             begin
                if (!cenAI || deepsleepI)                      n_pModeFSMA = PMODE_ERROR_STATE;
                else if (cenAI && !deepsleepI && !powergateI)  n_pModeFSMA = PMODE_PGEXIT_STATE;
                else                                           n_pModeFSMA = PMODE_PG_STATE;
             end

           PMODE_DSEXIT_STATE :
             begin
                n_pModeDSexitA = 1;
                if (cenAI && !deepsleepI && !powergateI) begin
                   if (cntA < DS_WKUP_CNT_A)                   n_pModeFSMA = PMODE_DSEXIT_STATE;
                   else                                        n_pModeFSMA = PMODE_START_STATE;
                end
                else                                           n_pModeFSMA = PMODE_ERROR_STATE;
             end

           PMODE_PGEXIT_STATE :
             begin
                n_pModePGexitA = 1;
                if (cenAI && !deepsleepI && !powergateI) begin
                   if (cntA < PG_WKUP_CNT_A)                   n_pModeFSMA = PMODE_PGEXIT_STATE;
                   else                                        n_pModeFSMA = PMODE_START_STATE;
                end
                else                                           n_pModeFSMA = PMODE_ERROR_STATE;
             end

           PMODE_ERROR_STATE :
             begin
                n_pModeErrorA = 1;
                if (cenAI && !deepsleepI && !powergateI) begin
                   if (cntA < DS_WKUP_CNT_A)                   n_pModeFSMA = PMODE_ERROR_STATE;
                   else                                        n_pModeFSMA = PMODE_START_STATE;
                end
                else                                           n_pModeFSMA = PMODE_ERROR_STATE;
             end

           default :
             begin
                if (deepsleepI || powergateI)                  n_pModeFSMA = PMODE_ERROR_STATE;
                else if (cenAI && !deepsleepI && !powergateI)  n_pModeFSMA = PMODE_ENABLE_STATE;
                else                                           n_pModeFSMA = PMODE_START_STATE;
             end

         endcase
      end
   end

   //If ds/pg are high for any point in time during start state then fail OR if they are ever BOTH high then fail
   wire pModeGlitchA = ((n_pModeStartA) & (deepsleepI | powergateI)) | (deepsleepI & powergateI);

   always @(posedge clkAI or pModeGlitchA) begin
      if (pModeGlitchA) begin
         r_pModeFSMA <= PMODE_ERROR_STATE;
      end
      else begin
         r_pModeFSMA <= n_pModeFSMA;
      end
   end

   always @(posedge clkAI) begin
      if (n_pModeDSexitA || n_pModePGexitA || n_pModeErrorA) begin
         if ((n_pModeErrorA && cenAI && !deepsleepI && !powergateI) || n_pModeDSexitA || n_pModePGexitA) begin
            cntA <= cntA + 1;
         end
      end
      else begin
         cntA <= 0;
      end
   end

   localparam integer PG_WKUP_CNT_B = (PG_TO_CEN > CYCLE_TIME_B) ? (PG_TO_CEN/CYCLE_TIME_B)-1 : 0;
   localparam integer DS_WKUP_CNT_B = (DS_TO_CEN > CYCLE_TIME_B) ? (DS_TO_CEN/CYCLE_TIME_B)-1 : 0;

   reg [2:0] n_pModeFSMB;
   reg [2:0] r_pModeFSMB;
   reg       n_pModeStartB;
   reg       n_pModeDSexitB;
   reg       n_pModePGexitB;
   reg       n_pModeErrorB;
   reg       n_pModeEnableB;

   always @ (*) begin
      n_pModeStartB = 0;
      n_pModeDSexitB = 0;
      n_pModePGexitB = 0;
      n_pModeErrorB = 0;
      n_pModeEnableB = 0;

      // Allow model to be "powered-up" with DEEPSLEEP asserted
      if (!startTrigger && !t_logic && cenBI && deepsleepI && !powergateI) begin
         n_pModeFSMB = PMODE_DS_STATE;
      end
      // Allow model to be "powered-up" with POWERGATE asserted
      else if (!startTrigger && !t_logic && cenBI && !deepsleepI && powergateI) begin
         n_pModeFSMB = PMODE_PG_STATE;
      end
      else if (!startTrigger || t_logic) begin
         n_pModeFSMB = PMODE_START_STATE;
      end
      else begin
         case (r_pModeFSMB)

           PMODE_START_STATE :
             begin
                n_pModeStartB = 1;
                if (deepsleepI || powergateI)                  n_pModeFSMB = PMODE_ERROR_STATE;
                else if (cenBI && !deepsleepI && !powergateI)  n_pModeFSMB = PMODE_ENABLE_STATE;
                else                                           n_pModeFSMB = PMODE_START_STATE;
             end

           PMODE_ENABLE_STATE :
             begin
                n_pModeEnableB = 1;
                if (!cenBI && (deepsleepI || powergateI))      n_pModeFSMB = PMODE_ERROR_STATE;
                else if (cenBI && deepsleepI && !powergateI)   n_pModeFSMB = PMODE_DS_STATE;
                else if (cenBI && !deepsleepI && powergateI)   n_pModeFSMB = PMODE_PG_STATE;
                else if (!cenBI && !deepsleepI && !powergateI) n_pModeFSMB = PMODE_START_STATE;
                else                                           n_pModeFSMB = PMODE_ENABLE_STATE;
             end

           PMODE_DS_STATE :
             begin
                if (!cenBI || powergateI)                      n_pModeFSMB = PMODE_ERROR_STATE;
                else if (cenBI && !deepsleepI && !powergateI)  n_pModeFSMB = PMODE_DSEXIT_STATE;
                else                                           n_pModeFSMB = PMODE_DS_STATE;
             end

           PMODE_PG_STATE :
             begin
                if (!cenBI || deepsleepI)                      n_pModeFSMB = PMODE_ERROR_STATE;
                else if (cenBI && !deepsleepI && !powergateI)  n_pModeFSMB = PMODE_PGEXIT_STATE;
                else                                           n_pModeFSMB = PMODE_PG_STATE;
             end

           PMODE_DSEXIT_STATE :
             begin
                n_pModeDSexitB = 1;
                if (cenBI && !deepsleepI && !powergateI) begin
                   if (cntB < DS_WKUP_CNT_B)                   n_pModeFSMB = PMODE_DSEXIT_STATE;
                   else                                        n_pModeFSMB = PMODE_START_STATE;
                end
                else                                           n_pModeFSMB = PMODE_ERROR_STATE;
             end

           PMODE_PGEXIT_STATE :
             begin
                n_pModePGexitB = 1;
                if (cenBI && !deepsleepI && !powergateI) begin
                   if (cntB < PG_WKUP_CNT_B)                   n_pModeFSMB = PMODE_PGEXIT_STATE;
                   else                                        n_pModeFSMB = PMODE_START_STATE;
                end
                else                                           n_pModeFSMB = PMODE_ERROR_STATE;
             end

           PMODE_ERROR_STATE :
             begin
                n_pModeErrorB = 1;
                if (cenBI && !deepsleepI && !powergateI) begin
                   if (cntB < DS_WKUP_CNT_B)                   n_pModeFSMB = PMODE_ERROR_STATE;
                   else                                        n_pModeFSMB = PMODE_START_STATE;
                end
                else                                           n_pModeFSMB = PMODE_ERROR_STATE;
             end

           default :
             begin
                if (deepsleepI || powergateI)                  n_pModeFSMB = PMODE_ERROR_STATE;
                else if (cenBI && !deepsleepI && !powergateI)  n_pModeFSMB = PMODE_ENABLE_STATE;
                else                                           n_pModeFSMB = PMODE_START_STATE;
             end

         endcase
      end
   end

   //If ds/pg are high for any point in time during start state then fail OR if they are ever BOTH high then fail
   wire pModeGlitchB = ((n_pModeStartB) & (deepsleepI | powergateI)) | (deepsleepI & powergateI);

   always @(posedge clkBI or pModeGlitchB) begin
      if (pModeGlitchB) begin
         r_pModeFSMB <= PMODE_ERROR_STATE;
      end
      else begin
         r_pModeFSMB <= n_pModeFSMB;
      end
   end

   always @(posedge clkBI) begin
      if (n_pModeDSexitB || n_pModePGexitB || n_pModeErrorB) begin
         if ((n_pModeErrorB && cenBI && !deepsleepI && !powergateI) || n_pModeDSexitB || n_pModePGexitB) begin
            cntB <= cntB + 1;
         end
      end
      else begin
         cntB <= 0;
      end
   end


   assign pModeFatal = (n_pModeErrorA | n_pModeErrorB) & ~t_logic & ~TESTCHIP_wire;

 `else

   //Method using delays (handles case where memory clock is gated)
   wire cenAD;
   wire cenBD;
   wire powergateD;
   wire deepsleepD;

   assign #CYCLE_TIME_A cenAD = cenAI;
   assign #CYCLE_TIME_B cenBD = cenBI;
   assign #PG_TO_CEN powergateD = powergateI;
   assign #DS_TO_CEN deepsleepD = deepsleepI;

   wire pModeGlitch = (deepsleepI & powergateI);

   wire pModeErrorA = (~cenAD & powergateI) | ((powergateD===1'b1) & ~cenAI) | (powergateI & ~cenAI) |
                      (~cenAD & deepsleepI) | ((deepsleepD===1'b1) & ~cenAI) | (deepsleepI & ~cenAI);

   wire pModeErrorB = (~cenBD & powergateI) | ((powergateD===1'b1) & ~cenBI) | (powergateI & ~cenBI) |
                      (~cenBD & deepsleepI) | ((deepsleepD===1'b1) & ~cenBI) | (deepsleepI & ~cenBI);

   assign pModeFatal = (pModeErrorA | pModeErrorB | pModeGlitch) & ~t_logic & ~TESTCHIP_wire;

 `endif // !`ifndef IVCS_PGDS_DELAYCHK


   ////////////////////////////////////////////////////
   // Array read/write modeling
   ////////////////////////////////////////////////////

   // Optional mechanism for asynchronously blasting array to all 0s
 `ifdef IVCS_INIT_MEM
   reg IVCS_INIT_MEM_wire;
   reg initFlag;
 `endif

   //Logic added to help with collision checking
   reg Ractive;
   reg Wactive;
   wire realActiveW;
   wire realActiveR;
   reg [AW_SIZE+AC_SIZE-1:0] Raddr;
   reg [AW_SIZE+AC_SIZE-1:0] Waddr;

 `ifdef IVCS_RELAX_COLL_CHECK
   reg csepB;
   reg csepA;
   always @(posedge clkBI) begin
      csepB = 0;
      #CLOCK_SEP;
      csepB = 1;
   end
   always @(posedge clkAI) begin
      csepA = 0;
      #CLOCK_SEP;
      csepA = 1;
   end
   assign realActiveR = Ractive & ~csepA;
   assign realActiveW = Wactive & ~csepB;
 `else
   assign realActiveR = Ractive;
   assign realActiveW = Wactive;
 `endif

   // Helpful messaging
 `ifdef IVCS_RELAX_COLL_CHECK
   localparam REL_COLL_MSG = "";
 `else
   localparam REL_COLL_MSG = " Define IVCS_RELAX_COLL_CHECK as a temporary work-around.";
 `endif

   always @(posedge clkAI or Raddr or Waddr or realActiveR or realActiveW) begin
      #0;
      if((Raddr == Waddr) && realActiveR && realActiveW) begin
         WARNING_TASK(MSG_COLL, {"ReadA/WriteB address collision (Row/Col = ", str(awAI), "/", str(acAI), ")!!!  Read data is undefined.", REL_COLL_MSG});
         killDataA[KD_COLL] = 1;
      end
   end


   // Check that the clock is good
   always @(clkA or clkB) begin

      iClkA = (clkA^clkA)^(clkA&~oldClkA);
      iClkB = (clkB^clkB)^(clkB&~oldClkB);

      if (((killArrayA[KA_CLK]!==1'b1)||(killArrayB[KA_CLK]!==1'b1)) && (((iClkA!==1'b1) && (iClkA!==1'b0)) || ((iClkB!==1'b1) && (iClkB!==1'b0)))) begin
         ERROR_TASK(MSG_CLK, "CLK_A and/or CLK_B input is unknown. Array contents are now invalid.");
         killArrayA[KA_CLK] = 1;
         killArrayB[KA_CLK] = 1;
         clkGateA = 1'b0;
         clkGateB = 1'b0;
      end

      else begin
         killArrayA[KA_CLK] = 0;
         killArrayB[KA_CLK] = 0;
         if (!clkA) clkGateA = 1'b1;
         if (!clkB) clkGateB = 1'b1;
         if (startTrigger !== 1'b1) begin
            // We reset all this stuff the first time the clock is stable
            msgTrigger = 0;
            porTrigger = 0;
            collTrigger = 0;
            dsTrigger = 0;
            killArrayA = 0;
            killArrayB = 0;
            killFlagA = 0;
            killFlagB = 0;
            killDataA = 0;
            cntA = 0;
            cntB = 0;
            Ractive = 0;
            Wactive = 0;
            Raddr = 0;
            Waddr = 0;
 `ifdef IVCS_INIT_MEM
            IVCS_INIT_MEM_wire = 0;
            initFlag = 0;
            BlanketWriteArray(1'b0);
 `endif
            if(PreloadArrayBinFile != "NONE") LoadArrayFromBinFile(PreloadArrayBinFile);
            if(PreloadArrayHexFile != "NONE") LoadArrayFromHexFile(PreloadArrayHexFile);
            startTrigger <= 1'b1;
         end
      end

      oldClkA = clkA;
      oldClkB = clkB;

   end // always @ (clk)


   // This code block defines synchronous read/write operations
   assign clkAI = clkGateA & clkA;
   assign clkBI = clkGateB & clkB;
   assign killDataORA = |killDataA;
   assign killArrayORA = |killArrayA;
   assign killArrayORB = |killArrayB;

   // Port A
   always @(posedge clkAI or posedge killDataORA or posedge killArrayORA or posedge dsTrigger
 `ifdef IVCS_INIT_MEM
            or posedge IVCS_INIT_MEM_wire
 `endif
            ) begin

      // Clear all killData triggers at the beginning of each cycle
      if (killDataFlagA) begin
         killDataA = 0;
         killDataFlagA = 0;
      end

      // Need to clear these killArray triggers at the beginning of each cycle
      if (killFlagA) begin
         killArrayA[KA_MA]   = 0;
         killArrayA[KA_RX]   = 0;
         killArrayA[KA_TMG]  = 0;
      end

      if  (t_logic===1'b1) begin
         array_dataA = {D_SIZE{awAI[1:0]}};
      end

      else if (|killDataA) begin
         // If killDataOR is on, assume it's because of (posedge killDataOR)
         // So X the Qs then clear the triggers at the beginning of the next cycle
         array_dataA = {D_SIZE{1'bx}};
         killDataFlagA = 1;
      end

      else if (|killArrayA || dsTrigger) begin
         // We will enter this block because of (posedge killArrayOR),
         // or because of (posege clkI) and killArrayOR is still on.
         // In the latter case, the killFlag will prevent us from
         // needlessly X-ing the array every cycle while the
         // killArray condition persists.
         if(|killArrayA) begin
            array_dataA = {D_SIZE{1'bx}};
         end
         if(!killFlagA) begin
            BlanketWriteArray(1'bx);
            killFlagA = 1;
         end
      end

`ifdef IVCS_INIT_MEM
      else if (!initFlag && IVCS_INIT_MEM_wire) begin
         // Use the initFlag here so that we only
         // do this when IVCS_INIT_MEM rises and not every
         // cycle that it's high
         BlanketWriteArray(1'b0);
         initFlag = 1;
         killFlagA = 0;
      end
`endif

      else begin

         // If we get here, it's because of (posedge clkI) and
         // neither a killArray nor an INIT_MEM condition exists

`ifdef IVCS_INIT_MEM
         // Clear this when init goes low
         if (!IVCS_INIT_MEM_wire) begin
            initFlag = 0;
         end
`endif
         // Clear collision regs at top of cycle
         Ractive = 0;

         // If t_logic or DEEPSLEEP or POWERGATE is on, we don't do anything
         if (!t_logic && !deepsleepI && !powergateI) begin

            // When cen is unknown
            if ((cenAI!==1'b0) && (cenAI!==1'b1)) begin
               ERROR_TASK(MSG_IOK, "CEN_A or T_CEN_A input is unknown. Array contents and output Q_A are now invalid.");
               array_dataA = {D_SIZE{1'bx}};
               if(!killFlagA) begin
                  BlanketWriteArray(1'bx);
                  killFlagA = 1;
               end
            end

            // If cen is not unknown, but simply deasserted (high), we don't do anything
            else if (!cenAI) begin

               // When one or more address bits is unknown (read mode)
               if ((^{awAI, acAI}!==1'b0) && (^{awAI, acAI}!==1'b1)) begin
                  ERROR_TASK(MSG_IOK, "One or more port A address inputs is unknown during a read. Output Q_A are now invalid.");
                  array_dataA = {D_SIZE{1'bx}};
               end

               else begin
                  // Finally... Time to read/write the array
                  ReadOrWriteArray(1'b0, 1'b1, awAI, acAI, {D_SIZE{1'b0}}, {D_SIZE{1'b0}});
                  killFlagA = 0;
               end

            end // if (!cenAI)
         end // if (!t_logic && !deepsleepI && !powergateI)
      end // else: !if(!initFlag && IVCS_INIT_MEM_wire)
   end // always @ (posedge clkAI or posedge killArrayOR...


   // Port B
   always @(posedge clkBI or posedge killArrayORB
`ifdef IVCS_INIT_MEM
            or posedge IVCS_INIT_MEM_wire
`endif
            ) begin

      // Need to clear these killArray triggers at the beginning of each cycle
      if (killFlagB) begin
         killArrayB[KA_MA]  = 0;
         killArrayB[KA_RX]  = 0;
         killArrayB[KA_TMG] = 0;
      end

      if  (t_logic===1'b1) begin
         // Do nothing
      end

      else if (|killArrayB || dsTrigger) begin
         // We will enter this block because of (posedge killArrayOR),
         // or because of (posege clkI) and killArrayOR is still on.
         // In the latter case, the killFlag will prevent us from
         // needlessly X-ing the array every cycle while the
         // killArray condition persists.
         if(!killFlagB) begin
            BlanketWriteArray(1'bx);
            killFlagB = 1;
         end
      end

`ifdef IVCS_INIT_MEM
      else if (!initFlag && IVCS_INIT_MEM_wire) begin
         // Use the initFlag here so that we only
         // do this when IVCS_INIT_MEM rises and not every
         // cycle that it's high
         BlanketWriteArray(1'b0);
         initFlag = 1;
         killFlagB = 0;
      end
`endif

      else begin

         // If we get here, it's because of (posedge clkI) and
         // neither a killArray nor an INIT_MEM condition exists

`ifdef IVCS_INIT_MEM
         // Clear this when init goes low
         if (!IVCS_INIT_MEM_wire) begin
            initFlag = 0;
         end
`endif
         // Clear collision regs at top of cycle
         Wactive = 0;

         // If t_logic or DEEPSLEEP or POWERGATE is on, we don't do anything
         if (!t_logic && !deepsleepI && !powergateI) begin

            // When cen is unknown
            if ((cenBI!==1'b0) && (cenBI!==1'b1)) begin
               ERROR_TASK(MSG_IOK, "CEN_B or T_CEN_B input is unknown. Array contents are now invalid.");
               if(!killFlagB) begin
                  BlanketWriteArray(1'bx);
                  killFlagB = 1;
               end
            end

            // If cen is not unknown, but simply deasserted (high), we don't do anything
            else if (!cenBI) begin

               // When one or more address bits is unknown (write mode)
               if ((^{awBI, acBI}!==1'b0) && (^{awBI, acBI}!==1'b1)) begin
                  ERROR_TASK(MSG_IOK, "One or more port B address inputs is unknown during a write. Array contents are now invalid.");
                  if (!killFlagB) begin
                     BlanketWriteArray(1'bx);
                     killFlagB = 1;
                  end
               end

               else begin
                  // Finally... Time to read/write the array
                  ReadOrWriteArray(1'b1, 1'b0, awBI, acBI, bwBI, dBI);
                  killFlagB = 0;
               end

            end // if (!cenAI)
         end // if (!t_logic && !deepsleepI && !powergateI)
      end // else: !if(!initFlag && IVCS_INIT_MEM_wire)
   end // always @ (posedge clkAI or posedge killArrayOR...


   ////////////////////////////////////////////////////
   // Output latch modeling
   ////////////////////////////////////////////////////

   always @(*) dataA_l1 <= array_dataA;

   // Generate outputs
// assign q = array_dataA;
   assign q = dataA_l1;
   assign obsv_dbw  =  t_logic ? dBI & bwBI : {D_SIZE{1'b1}} ;
   assign obsv_ctlA = ~t_logic | ((&(~awAI)) & (&acAI) & ~cenAI & ~deepsleepI & ~powergateI);
   assign obsv_ctlB = ~t_logic | ((&(~awBI)) & (&acBI) & ~cenBI);



   ////////////////////////////////////////////////////////////////////////////
   ////////////////////////////////////////////////////////////////////////////
   // Supporting functions and tasks
   ////////////////////////////////////////////////////////////////////////////
   ////////////////////////////////////////////////////////////////////////////


   ////////////////////////////////////////////////////////////////////////////
   // Array reads/writes go through this task
   ////////////////////////////////////////////////////////////////////////////

   // Note: In order to support the BW function, this task always does
   //       a read then write regardless of the state of rdwen.
   //       If rdwen=0, the read data won't be propagated to the Q bus.

   task ReadOrWriteArray;

      input                i_port;
      input                i_rdwen;
      input [AW_SIZE-1:0]  i_aw;
      input [AC_SIZE-1:0]  i_ac;
      input [D_SIZE-1:0]   i_bw;
      input [D_SIZE-1:0]   i_d;

      // Local regs - prepend with "my_" so I can tell them
      // apart from the handful of globals
      reg                  my_oob_address;
      reg [A_SIZE :0]      my_arrayAddr;
      reg [A_SIZE :0]      my_arrayAddr2;
      reg [D_SIZE-1:0]     my_data;
      reg [D_SIZE-1:0]     my_w_data;
      reg [3:0]            my_ac;

      begin

         if ( {i_aw, i_ac} >= W_DEPTH ) begin
            my_oob_address = 1'b1;
         end
         else begin
            my_oob_address = 1'b0;
         end

         // Out of bounds writes will do nothing
         if (!i_rdwen && my_oob_address) begin
            WARNING_TASK(MSG_OOB, { "Write address (Row=", str(i_aw), ", Col=", str(i_ac), ") is out of bounds for this array size. Array will not be written." });
         end

         // Out of bounds read puts 0 on Qs
         if (i_rdwen && my_oob_address && readOK) begin
            WARNING_TASK(MSG_OOB, { "Read address (Row=", str(i_aw), ", Col=", str(i_ac), ") is out of bounds for this array size. Output Q are now 0." });
            array_dataA = {D_SIZE{1'b0}};
         end

         // Trash the Q data if invalid read
         if (i_rdwen && !readOK) begin
            WARNING_TASK(MSG_RD, "MA inputs at incorrect values during read. Output Q are now invalid.");
            array_dataA = {D_SIZE{1'bx}};
         end

         // Condition for a valid read or write
         if (!my_oob_address && (!i_rdwen || (i_rdwen && readOK))) begin

 `ifdef IVCS_FAST_FUNC
            my_arrayAddr = { i_aw, i_ac };
            my_data = array[my_arrayAddr];
            if (i_rdwen) begin
               // Make the data stick
               array_dataA = my_data;
               // Collision logic
               Ractive = 1;
               Raddr = my_arrayAddr;
            end
            else begin
               // Put data in array
               array[my_arrayAddr] = (i_bw & i_d) | (~i_bw & my_data);
               // Collision logic
               Wactive = 1;
               Waddr = my_arrayAddr;
            end
 `else
            // Inject any fails before doing the read
            if (any_fail) ForceFails;

            // Address manipulations if row redundancy is invoked
            if (rweI[0] && (rwfI[0]==(i_aw>>1))) begin
               my_arrayAddr = W_DEPTH + { i_aw[0], i_ac };
            end
            else if (rweI[1] && (rwfI[1]==(i_aw>>1))) begin
               my_arrayAddr = W_DEPTH + { i_aw[0], i_ac };
            end
            else begin
               my_arrayAddr = { i_aw, i_ac };
            end

            my_data = array[my_arrayAddr];

            // If reading, make my data real
            if (i_rdwen) begin

               // Make the data stick
               array_dataA = my_data;

               // Collision logic
               Ractive = 1;
               Raddr = {i_aw, i_ac};
            end

            // If not reading, we're writing
            else begin

               // Put the data into the array
               my_w_data = (i_bw & i_d) | (~i_bw & my_data);
               array[my_arrayAddr] = my_w_data;

               // Collision logic
               Wactive = 1;
               Waddr = {i_aw, i_ac};

               // Inject fails after doing the write
               if (any_fail) ForceFails;

            end // else: !if(i_rdwen)
 `endif //  `ifdef IVCS_FAST_FUNC
         end // if (!my_oob_address && (!i_rdwen || (i_rdwen && readOK)))
      end

   endtask

 `ifndef IVCS_FAST_FUNC
   ////////////////////////////////////////////////////////////////////////////
   // Fail injection support
   ////////////////////////////////////////////////////////////////////////////

   reg [A_SIZE:0] WL_FAIL_ADDR;
   reg [A_SIZE:0] CELL0_FAIL_ADDR;
   reg [A_SIZE:0] CELL1_FAIL_ADDR;
   reg [A_SIZE:0] CELL2_FAIL_ADDR;
   reg [A_SIZE:0] CELL3_FAIL_ADDR;

   always @(*) begin

      if(startTrigger) begin

         // Wordline fail
         if (WL_FAIL_RWL_wire) begin
            WL_FAIL_ADDR    = W_DEPTH +
                              { WL_FAIL_ROW_wire[1:0],
                                {AC_SIZE{1'b0}} };
         end
         else begin
            WL_FAIL_ADDR    = { WL_FAIL_ROW_wire,
                                {AC_SIZE{1'b0}} };
         end

         // Fail 0
         if (CELL0_FAIL_RWL_wire) begin
            CELL0_FAIL_ADDR = W_DEPTH +
                              { CELL0_FAIL_ROW_wire[1:0],
                                CELL0_FAIL_COL_wire[AC_SIZE-1:0] };
         end
         else begin
            CELL0_FAIL_ADDR = { CELL0_FAIL_ROW_wire[AW_SIZE-1:0],
                                CELL0_FAIL_COL_wire[AC_SIZE-1:0] };
         end

         // Fail 1
         if (CELL1_FAIL_RWL_wire) begin
            CELL1_FAIL_ADDR = W_DEPTH +
                              { CELL1_FAIL_ROW_wire[1:0],
                                CELL1_FAIL_COL_wire[AC_SIZE-1:0] };
         end
         else begin
            CELL1_FAIL_ADDR = { CELL1_FAIL_ROW_wire[AW_SIZE-1:0],
                                CELL1_FAIL_COL_wire[AC_SIZE-1:0] };
         end

         // Fail 2
         if (CELL2_FAIL_RWL_wire) begin
            CELL2_FAIL_ADDR = W_DEPTH +
                              { CELL2_FAIL_ROW_wire[1:0],
                                CELL2_FAIL_COL_wire[AC_SIZE-1:0] };
         end
         else begin
            CELL2_FAIL_ADDR = { CELL2_FAIL_ROW_wire[AW_SIZE-1:0],
                                CELL2_FAIL_COL_wire[AC_SIZE-1:0] };
         end

         // Fail 3
         if (CELL3_FAIL_RWL_wire) begin
            CELL3_FAIL_ADDR = W_DEPTH +
                              { CELL3_FAIL_ROW_wire[1:0],
                                CELL3_FAIL_COL_wire[AC_SIZE-1:0] };
         end
         else begin
            CELL3_FAIL_ADDR = { CELL3_FAIL_ROW_wire[AW_SIZE-1:0],
                                CELL3_FAIL_COL_wire[AC_SIZE-1:0] };
         end
      end // if (startTrigger)
   end // always @ (*)


   integer k;

   always @(startTrigger or WL_FAIL_wire or WL_FAIL_ADDR or WL_FAIL_DATA_wire) begin
      if(WL_FAIL_wire) begin
         // Stick the fault into every column
         for(k=0; k<MUX; k=k+1) begin
            array[WL_FAIL_ADDR+k] = {D_SIZE{WL_FAIL_DATA_wire}};
         end
      end
   end

   always @(startTrigger or BL_FAIL_wire or BL_FAIL_COL_wire or BL_FAIL_BIT_wire or BL_FAIL_DATA_wire) begin
      if(BL_FAIL_wire) begin
         // Stick the fault into every word
         for(k=0; k<(W_DEPTH/MUX); k=k+1) begin
            array[{k[(AW_SIZE-1):0], BL_FAIL_COL_wire[AC_SIZE-1:0]}][BL_FAIL_BIT_wire] = BL_FAIL_DATA_wire;
         end
      end
   end


   // Should call this just before doing a read and just after doing a write
   task ForceFails;

      begin

         if(WL_FAIL_wire) begin
            if(!cenAI) array[WL_FAIL_ADDR+acAI] = {D_SIZE{WL_FAIL_DATA_wire}};
            if(!cenBI) array[WL_FAIL_ADDR+acBI] = {D_SIZE{WL_FAIL_DATA_wire}};
         end

         if(BL_FAIL_wire) begin
            if(!cenAI) array[{awAI[AW_SIZE-1:0], BL_FAIL_COL_wire[AC_SIZE-1:0]}][BL_FAIL_BIT] = BL_FAIL_DATA_wire;
            if(!cenBI) array[{awBI[AW_SIZE-1:0], BL_FAIL_COL_wire[AC_SIZE-1:0]}][BL_FAIL_BIT] = BL_FAIL_DATA_wire;
         end

         if(CELL0_FAIL_wire) begin
            array[CELL0_FAIL_ADDR][CELL0_FAIL_BIT_wire] = CELL0_FORCE_DATA_wire;
         end

         if(CELL1_FAIL_wire) begin
            array[CELL1_FAIL_ADDR][CELL1_FAIL_BIT_wire] = CELL1_FORCE_DATA_wire;
         end

         if(CELL2_FAIL_wire) begin
            array[CELL2_FAIL_ADDR][CELL2_FAIL_BIT_wire] = CELL2_FORCE_DATA_wire;
         end

         if(CELL3_FAIL_wire) begin
            array[CELL3_FAIL_ADDR][CELL3_FAIL_BIT_wire] = CELL3_FORCE_DATA_wire;
         end

      end

   endtask
 `endif //  `ifndef IVCS_FAST_FUNC


   ////////////////////////////////////////////////////////////////////////////
   // Use these tasks to write errors/warnings/info messages to the console
   ////////////////////////////////////////////////////////////////////////////

   task ERROR_TASK;
      input [3:0] trigger;
      input [8*200-1:0] msg;
      begin
         if (((MSG_LVL==1)||(MSG_LVL==2)) && !msgTrigger[trigger]) begin
            $display("%m: At time %0t %0s", $time, msg);
            $display("%m: This error will be issued on first occurrence only.");
            msgTrigger[trigger]=1'b1;
         end
         if (MSG_LVL > 2) begin
            $display("%m: At time %0t %0s", $time, msg);
         end
      end
   endtask

   task WARNING_TASK;
      input [3:0] trigger;
      input [8*200-1:0] msg;
      begin
         if ((MSG_LVL == 2) && !msgTrigger[trigger]) begin
            $display("%m: At time %0t %0s", $time, msg);
            $display("%m: This warning will be issued on first occurrence only.");
            msgTrigger[trigger]=1'b1;
         end
         if (MSG_LVL > 2) begin
            $display("%m: At time %0t %0s", $time, msg);
         end
      end
   endtask

   task INFO_TASK;
      input [3:0] trigger;
      input [8*200-1:0] msg;
      begin
         if ((MSG_LVL == 2) && !msgTrigger[trigger]) begin
            $display("%m: At time %0t %0s", $time, msg);
            $display("%m: This message will be issued on first occurrence only.");
            msgTrigger[trigger]=1'b1;
         end
         if (MSG_LVL > 2) begin
            $display("%m: At time %0t %0s", $time, msg);
         end
      end
   endtask

   function [23:0] str;
      input [8:0] val;
      begin
         str[23:16] = (val<100) ? " " : 48+(val/100);
         str[15: 8] = (val< 10) ? " " : 48+((val%100)/10);
         str[ 7: 0] = 48+(val%10);
      end
   endfunction


   ////////////////////////////////////////////////////////////////////////////
   // Call this task when we need to blanket write the array
   ////////////////////////////////////////////////////////////////////////////

   task BlanketWriteArray;
      input data;
      integer i;
      begin
         for (i=0;i<ARRAY_DEPTH;i=i+1) begin
            array[i] <= {D_SIZE{data}};
         end
      end
   endtask
`endif // !`ifdef IVCS_CYCLE_SIM


   ////////////////////////////////////////////////////////////////////////////
   // Call one of these tasks to load the contents of the memory from a file
   ////////////////////////////////////////////////////////////////////////////

   task LoadArrayFromBinFile;
      input [8*128-1:0] filename;
      begin
         $display("Preloading array at time %0t with contents of binary data file %0s", $time, filename);
         $readmemb(filename, array);
      end
   endtask

   task LoadArrayFromHexFile;
      input [8*128-1:0] filename;
      begin
         $display("Preloading array at time %0t with contents of hexadecimal data file %0s", $time, filename);
         $readmemh(filename, array);
      end
   endtask


   ////////////////////////////////////////////////////////////////////////////
   // Call this task to dump the contents of the memory
   // Uses a format compatible with $readmemb
   ////////////////////////////////////////////////////////////////////////////

   task DumpArray;
      integer i;
      begin
         $display("\n//////// BEGIN %m ////////");
         for (i=0;i<W_DEPTH;i=i+1) begin
            $display("@%1h %b", i, array[i]);
         end
         $display("////////  END  %m ////////\n");
      end
   endtask

endmodule
