// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.1
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

#ifndef _parseEvents_HH_
#define _parseEvents_HH_

#include "systemc.h"
#include "AESL_pkg.h"

#include "parseEvents_mux_4ncg.h"
#include "parseEvents_glPLSbkb.h"

namespace ap_rtl {

struct parseEvents : public sc_module {
    // Port declarations 13
    sc_in_clk ap_clk;
    sc_in< sc_logic > ap_rst;
    sc_in< sc_logic > ap_start;
    sc_out< sc_logic > ap_done;
    sc_out< sc_logic > ap_idle;
    sc_out< sc_logic > ap_ready;
    sc_in< sc_lv<64> > data_dout;
    sc_in< sc_logic > data_empty_n;
    sc_out< sc_logic > data_read;
    sc_in< sc_lv<32> > eventsArraySize;
    sc_out< sc_lv<32> > eventSlice_din;
    sc_in< sc_logic > eventSlice_full_n;
    sc_out< sc_logic > eventSlice_write;


    // Module declarations
    parseEvents(sc_module_name name);
    SC_HAS_PROCESS(parseEvents);

    ~parseEvents();

    sc_trace_file* mVcdFile;

    ofstream mHdltvinHandle;
    ofstream mHdltvoutHandle;
    parseEvents_glPLSbkb* glPLSlice0_V_0_U;
    parseEvents_glPLSbkb* glPLSlice0_V_1_U;
    parseEvents_glPLSbkb* glPLSlice0_V_2_U;
    parseEvents_glPLSbkb* glPLSlice0_V_3_U;
    parseEvents_glPLSbkb* glPLSlice1_V_0_U;
    parseEvents_glPLSbkb* glPLSlice1_V_1_U;
    parseEvents_glPLSbkb* glPLSlice1_V_2_U;
    parseEvents_glPLSbkb* glPLSlice1_V_3_U;
    parseEvents_glPLSbkb* glPLSlice2_V_0_U;
    parseEvents_glPLSbkb* glPLSlice2_V_1_U;
    parseEvents_glPLSbkb* glPLSlice2_V_2_U;
    parseEvents_glPLSbkb* glPLSlice2_V_3_U;
    parseEvents_mux_4ncg<1,1,180,180,180,180,2,180>* parseEvents_mux_4ncg_U1;
    parseEvents_mux_4ncg<1,1,180,180,180,180,2,180>* parseEvents_mux_4ncg_U2;
    parseEvents_mux_4ncg<1,1,180,180,180,180,2,180>* parseEvents_mux_4ncg_U3;
    parseEvents_mux_4ncg<1,1,180,180,180,180,2,180>* parseEvents_mux_4ncg_U4;
    parseEvents_mux_4ncg<1,1,180,180,180,180,2,180>* parseEvents_mux_4ncg_U5;
    parseEvents_mux_4ncg<1,1,180,180,180,180,2,180>* parseEvents_mux_4ncg_U6;
    sc_signal< sc_lv<4> > ap_CS_fsm;
    sc_signal< sc_logic > ap_CS_fsm_state1;
    sc_signal< sc_lv<2> > glPLActiveSliceIdx_V;
    sc_signal< sc_lv<8> > glPLSlice0_V_0_address0;
    sc_signal< sc_logic > glPLSlice0_V_0_ce0;
    sc_signal< sc_logic > glPLSlice0_V_0_we0;
    sc_signal< sc_lv<180> > glPLSlice0_V_0_q0;
    sc_signal< sc_lv<8> > glPLSlice0_V_0_address1;
    sc_signal< sc_logic > glPLSlice0_V_0_ce1;
    sc_signal< sc_lv<180> > glPLSlice0_V_0_q1;
    sc_signal< sc_lv<8> > glPLSlice0_V_1_address0;
    sc_signal< sc_logic > glPLSlice0_V_1_ce0;
    sc_signal< sc_logic > glPLSlice0_V_1_we0;
    sc_signal< sc_lv<180> > glPLSlice0_V_1_q0;
    sc_signal< sc_lv<8> > glPLSlice0_V_1_address1;
    sc_signal< sc_logic > glPLSlice0_V_1_ce1;
    sc_signal< sc_lv<180> > glPLSlice0_V_1_q1;
    sc_signal< sc_lv<8> > glPLSlice0_V_2_address0;
    sc_signal< sc_logic > glPLSlice0_V_2_ce0;
    sc_signal< sc_logic > glPLSlice0_V_2_we0;
    sc_signal< sc_lv<180> > glPLSlice0_V_2_q0;
    sc_signal< sc_lv<8> > glPLSlice0_V_2_address1;
    sc_signal< sc_logic > glPLSlice0_V_2_ce1;
    sc_signal< sc_lv<180> > glPLSlice0_V_2_q1;
    sc_signal< sc_lv<8> > glPLSlice0_V_3_address0;
    sc_signal< sc_logic > glPLSlice0_V_3_ce0;
    sc_signal< sc_logic > glPLSlice0_V_3_we0;
    sc_signal< sc_lv<180> > glPLSlice0_V_3_q0;
    sc_signal< sc_lv<8> > glPLSlice0_V_3_address1;
    sc_signal< sc_logic > glPLSlice0_V_3_ce1;
    sc_signal< sc_lv<180> > glPLSlice0_V_3_q1;
    sc_signal< sc_lv<8> > glPLSlice1_V_0_address0;
    sc_signal< sc_logic > glPLSlice1_V_0_ce0;
    sc_signal< sc_logic > glPLSlice1_V_0_we0;
    sc_signal< sc_lv<180> > glPLSlice1_V_0_q0;
    sc_signal< sc_lv<8> > glPLSlice1_V_0_address1;
    sc_signal< sc_logic > glPLSlice1_V_0_ce1;
    sc_signal< sc_lv<180> > glPLSlice1_V_0_q1;
    sc_signal< sc_lv<8> > glPLSlice1_V_1_address0;
    sc_signal< sc_logic > glPLSlice1_V_1_ce0;
    sc_signal< sc_logic > glPLSlice1_V_1_we0;
    sc_signal< sc_lv<180> > glPLSlice1_V_1_q0;
    sc_signal< sc_lv<8> > glPLSlice1_V_1_address1;
    sc_signal< sc_logic > glPLSlice1_V_1_ce1;
    sc_signal< sc_lv<180> > glPLSlice1_V_1_q1;
    sc_signal< sc_lv<8> > glPLSlice1_V_2_address0;
    sc_signal< sc_logic > glPLSlice1_V_2_ce0;
    sc_signal< sc_logic > glPLSlice1_V_2_we0;
    sc_signal< sc_lv<180> > glPLSlice1_V_2_q0;
    sc_signal< sc_lv<8> > glPLSlice1_V_2_address1;
    sc_signal< sc_logic > glPLSlice1_V_2_ce1;
    sc_signal< sc_lv<180> > glPLSlice1_V_2_q1;
    sc_signal< sc_lv<8> > glPLSlice1_V_3_address0;
    sc_signal< sc_logic > glPLSlice1_V_3_ce0;
    sc_signal< sc_logic > glPLSlice1_V_3_we0;
    sc_signal< sc_lv<180> > glPLSlice1_V_3_q0;
    sc_signal< sc_lv<8> > glPLSlice1_V_3_address1;
    sc_signal< sc_logic > glPLSlice1_V_3_ce1;
    sc_signal< sc_lv<180> > glPLSlice1_V_3_q1;
    sc_signal< sc_lv<8> > glPLSlice2_V_0_address0;
    sc_signal< sc_logic > glPLSlice2_V_0_ce0;
    sc_signal< sc_logic > glPLSlice2_V_0_we0;
    sc_signal< sc_lv<180> > glPLSlice2_V_0_q0;
    sc_signal< sc_lv<8> > glPLSlice2_V_0_address1;
    sc_signal< sc_logic > glPLSlice2_V_0_ce1;
    sc_signal< sc_lv<180> > glPLSlice2_V_0_q1;
    sc_signal< sc_lv<8> > glPLSlice2_V_1_address0;
    sc_signal< sc_logic > glPLSlice2_V_1_ce0;
    sc_signal< sc_logic > glPLSlice2_V_1_we0;
    sc_signal< sc_lv<180> > glPLSlice2_V_1_q0;
    sc_signal< sc_lv<8> > glPLSlice2_V_1_address1;
    sc_signal< sc_logic > glPLSlice2_V_1_ce1;
    sc_signal< sc_lv<180> > glPLSlice2_V_1_q1;
    sc_signal< sc_lv<8> > glPLSlice2_V_2_address0;
    sc_signal< sc_logic > glPLSlice2_V_2_ce0;
    sc_signal< sc_logic > glPLSlice2_V_2_we0;
    sc_signal< sc_lv<180> > glPLSlice2_V_2_q0;
    sc_signal< sc_lv<8> > glPLSlice2_V_2_address1;
    sc_signal< sc_logic > glPLSlice2_V_2_ce1;
    sc_signal< sc_lv<180> > glPLSlice2_V_2_q1;
    sc_signal< sc_lv<8> > glPLSlice2_V_3_address0;
    sc_signal< sc_logic > glPLSlice2_V_3_ce0;
    sc_signal< sc_logic > glPLSlice2_V_3_we0;
    sc_signal< sc_lv<180> > glPLSlice2_V_3_q0;
    sc_signal< sc_lv<8> > glPLSlice2_V_3_address1;
    sc_signal< sc_logic > glPLSlice2_V_3_ce1;
    sc_signal< sc_lv<180> > glPLSlice2_V_3_q1;
    sc_signal< sc_lv<16> > glCnt;
    sc_signal< sc_logic > data_blk_n;
    sc_signal< sc_logic > ap_CS_fsm_pp0_stage1;
    sc_signal< sc_logic > ap_enable_reg_pp0_iter0;
    sc_signal< bool > ap_block_pp0_stage1;
    sc_signal< sc_lv<1> > tmp_3_reg_1394;
    sc_signal< sc_logic > eventSlice_blk_n;
    sc_signal< sc_logic > ap_CS_fsm_pp0_stage0;
    sc_signal< sc_logic > ap_enable_reg_pp0_iter3;
    sc_signal< bool > ap_block_pp0_stage0;
    sc_signal< sc_lv<1> > tmp_3_reg_1394_pp0_iter2_reg;
    sc_signal< sc_lv<31> > p_019_rec_reg_467;
    sc_signal< sc_lv<1> > tmp_s_fu_538_p2;
    sc_signal< sc_lv<1> > tmp_s_reg_1382;
    sc_signal< sc_lv<1> > tmp_7_fu_544_p2;
    sc_signal< sc_lv<1> > tmp_7_reg_1386;
    sc_signal< sc_lv<1> > tmp_9_fu_550_p2;
    sc_signal< sc_lv<1> > tmp_9_reg_1390;
    sc_signal< sc_lv<1> > tmp_3_fu_560_p2;
    sc_signal< bool > ap_block_state2_pp0_stage0_iter0;
    sc_signal< bool > ap_block_state4_pp0_stage0_iter1;
    sc_signal< bool > ap_block_state6_pp0_stage0_iter2;
    sc_signal< bool > ap_block_state8_pp0_stage0_iter3;
    sc_signal< bool > ap_block_pp0_stage0_11001;
    sc_signal< sc_lv<1> > tmp_3_reg_1394_pp0_iter1_reg;
    sc_signal< sc_lv<31> > i_fu_565_p2;
    sc_signal< sc_lv<31> > i_reg_1398;
    sc_signal< sc_lv<1> > tmp_26_fu_571_p2;
    sc_signal< sc_lv<1> > tmp_26_reg_1403;
    sc_signal< sc_lv<1> > tmp_26_reg_1403_pp0_iter1_reg;
    sc_signal< sc_lv<1> > tmp_26_reg_1403_pp0_iter2_reg;
    sc_signal< sc_lv<9> > y_reg_1408;
    sc_signal< bool > ap_block_state3_pp0_stage1_iter0;
    sc_signal< bool > ap_block_state5_pp0_stage1_iter1;
    sc_signal< bool > ap_block_state7_pp0_stage1_iter2;
    sc_signal< bool > ap_block_pp0_stage1_11001;
    sc_signal< sc_lv<9> > y_reg_1408_pp0_iter1_reg;
    sc_signal< sc_lv<9> > y_reg_1408_pp0_iter2_reg;
    sc_signal< sc_lv<1> > tmp_14_reg_1414;
    sc_signal< sc_lv<8> > tmp_8_reg_1418;
    sc_signal< sc_lv<7> > tmp_11_reg_1423;
    sc_signal< sc_lv<2> > tmp_13_reg_1428;
    sc_signal< sc_lv<2> > arrayNo3_reg_1435;
    sc_signal< sc_lv<2> > arrayNo3_reg_1435_pp0_iter1_reg;
    sc_signal< sc_lv<8> > newIndex6_reg_1442;
    sc_signal< sc_lv<8> > newIndex6_reg_1442_pp0_iter1_reg;
    sc_signal< sc_lv<9> > tmp_12_fu_675_p3;
    sc_signal< sc_lv<9> > tmp_12_reg_1447;
    sc_signal< sc_lv<8> > glPLSlice2_V_0_addr_reg_1456;
    sc_signal< sc_lv<8> > glPLSlice2_V_1_addr_reg_1461;
    sc_signal< sc_lv<8> > glPLSlice2_V_2_addr_reg_1466;
    sc_signal< sc_lv<8> > glPLSlice2_V_3_addr_reg_1471;
    sc_signal< sc_lv<8> > glPLSlice1_V_0_addr_reg_1476;
    sc_signal< sc_lv<8> > glPLSlice1_V_1_addr_reg_1481;
    sc_signal< sc_lv<8> > glPLSlice1_V_2_addr_reg_1486;
    sc_signal< sc_lv<8> > glPLSlice1_V_3_addr_reg_1491;
    sc_signal< sc_lv<8> > glPLSlice0_V_0_addr_reg_1496;
    sc_signal< sc_lv<8> > glPLSlice0_V_1_addr_reg_1501;
    sc_signal< sc_lv<8> > glPLSlice0_V_2_addr_reg_1506;
    sc_signal< sc_lv<8> > glPLSlice0_V_3_addr_reg_1511;
    sc_signal< sc_lv<32> > tmp_57_fu_1255_p1;
    sc_signal< sc_lv<32> > tmp_57_reg_1576;
    sc_signal< sc_lv<32> > tmp2_fu_1293_p2;
    sc_signal< sc_lv<32> > tmp2_reg_1581;
    sc_signal< bool > ap_block_pp0_stage0_subdone;
    sc_signal< sc_logic > ap_condition_pp0_exit_iter0_state2;
    sc_signal< sc_logic > ap_enable_reg_pp0_iter1;
    sc_signal< bool > ap_block_pp0_stage1_subdone;
    sc_signal< sc_logic > ap_enable_reg_pp0_iter2;
    sc_signal< sc_lv<2> > ap_phi_mux_glPLActiveSliceIdx_V_2_phi_fu_454_p8;
    sc_signal< sc_lv<1> > tmp_fu_502_p2;
    sc_signal< sc_lv<1> > tmp_1_fu_508_p2;
    sc_signal< sc_lv<1> > tmp_2_fu_514_p2;
    sc_signal< sc_lv<31> > ap_phi_mux_p_019_rec_phi_fu_471_p4;
    sc_signal< sc_lv<64> > newIndex5_fu_699_p1;
    sc_signal< sc_lv<64> > newIndex4_fu_707_p1;
    sc_signal< sc_lv<64> > newIndex2_fu_715_p1;
    sc_signal< sc_lv<64> > newIndex7_fu_1227_p1;
    sc_signal< bool > ap_block_pp0_stage0_01001;
    sc_signal< sc_lv<16> > tmp_35_fu_1345_p2;
    sc_signal< sc_lv<16> > i_op_assign_fu_152;
    sc_signal< sc_lv<16> > localCnt_fu_1335_p2;
    sc_signal< sc_lv<180> > tmp_56_fu_877_p4;
    sc_signal< sc_lv<180> > tmp_44_fu_1045_p4;
    sc_signal< sc_lv<180> > tmp_29_fu_1213_p4;
    sc_signal< sc_lv<10> > xNewIdx_V_fu_692_p2;
    sc_signal< sc_lv<32> > i_cast_fu_556_p1;
    sc_signal< sc_lv<9> > x_fu_577_p4;
    sc_signal< sc_lv<10> > tmp_34_cast_fu_635_p1;
    sc_signal< sc_lv<10> > tmp_27_fu_639_p2;
    sc_signal< sc_lv<10> > tmp_10_fu_665_p3;
    sc_signal< sc_lv<10> > tmp_14_cast_fu_682_p1;
    sc_signal< sc_lv<10> > tmp_12_cast_fu_672_p1;
    sc_signal< sc_lv<10> > p_0505_0_i_fu_686_p2;
    sc_signal< sc_lv<8> > grp_fu_478_p4;
    sc_signal< sc_lv<180> > tmpData_V_2_fu_723_p6;
    sc_signal< sc_lv<32> > tmp_27_cast_fu_736_p1;
    sc_signal< sc_lv<32> > index_assign_9_s_fu_747_p2;
    sc_signal< sc_lv<9> > grp_fu_487_p2;
    sc_signal< sc_lv<32> > index_assign_9_1_cas_fu_761_p1;
    sc_signal< sc_lv<9> > grp_fu_492_p2;
    sc_signal< sc_lv<32> > index_assign_9_2_cas_fu_773_p1;
    sc_signal< sc_lv<1> > tmp_48_fu_777_p3;
    sc_signal< sc_lv<1> > tmp_47_fu_765_p3;
    sc_signal< sc_lv<1> > tmp_46_fu_753_p3;
    sc_signal< sc_lv<1> > tmp_45_fu_739_p3;
    sc_signal< sc_lv<4> > p_Result_16_3_fu_785_p5;
    sc_signal< sc_lv<4> > tmpTmpData_V_2_fu_797_p2;
    sc_signal< sc_lv<1> > tmp_49_fu_803_p1;
    sc_signal< sc_lv<64> > p_Repl2_5_fu_807_p1;
    sc_signal< sc_lv<1> > tmp_51_fu_821_p3;
    sc_signal< sc_lv<180> > tmp_50_fu_811_p4;
    sc_signal< sc_lv<64> > p_Repl2_5_1_fu_829_p1;
    sc_signal< sc_lv<1> > tmp_53_fu_843_p3;
    sc_signal< sc_lv<180> > tmp_52_fu_833_p4;
    sc_signal< sc_lv<64> > p_Repl2_5_2_fu_851_p1;
    sc_signal< sc_lv<1> > tmp_55_fu_865_p3;
    sc_signal< sc_lv<180> > tmp_54_fu_855_p4;
    sc_signal< sc_lv<64> > p_Repl2_5_3_fu_873_p1;
    sc_signal< sc_lv<180> > tmpData_V_1_fu_891_p6;
    sc_signal< sc_lv<32> > tmp_22_cast_fu_904_p1;
    sc_signal< sc_lv<32> > index_assign_5_s_fu_915_p2;
    sc_signal< sc_lv<32> > index_assign_5_1_cas_fu_929_p1;
    sc_signal< sc_lv<32> > index_assign_5_2_cas_fu_941_p1;
    sc_signal< sc_lv<1> > tmp_36_fu_945_p3;
    sc_signal< sc_lv<1> > tmp_34_fu_933_p3;
    sc_signal< sc_lv<1> > tmp_33_fu_921_p3;
    sc_signal< sc_lv<1> > tmp_31_fu_907_p3;
    sc_signal< sc_lv<4> > p_Result_14_3_fu_953_p5;
    sc_signal< sc_lv<4> > tmpTmpData_V_1_fu_965_p2;
    sc_signal< sc_lv<1> > tmp_37_fu_971_p1;
    sc_signal< sc_lv<64> > p_Repl2_4_fu_975_p1;
    sc_signal< sc_lv<1> > tmp_39_fu_989_p3;
    sc_signal< sc_lv<180> > tmp_38_fu_979_p4;
    sc_signal< sc_lv<64> > p_Repl2_4_1_fu_997_p1;
    sc_signal< sc_lv<1> > tmp_41_fu_1011_p3;
    sc_signal< sc_lv<180> > tmp_40_fu_1001_p4;
    sc_signal< sc_lv<64> > p_Repl2_4_2_fu_1019_p1;
    sc_signal< sc_lv<1> > tmp_43_fu_1033_p3;
    sc_signal< sc_lv<180> > tmp_42_fu_1023_p4;
    sc_signal< sc_lv<64> > p_Repl2_4_3_fu_1041_p1;
    sc_signal< sc_lv<180> > tmpData_V_fu_1059_p6;
    sc_signal< sc_lv<32> > tmp_18_cast_fu_1072_p1;
    sc_signal< sc_lv<32> > index_assign_1_s_fu_1083_p2;
    sc_signal< sc_lv<32> > index_assign_1_1_cas_fu_1097_p1;
    sc_signal< sc_lv<32> > index_assign_1_2_cas_fu_1109_p1;
    sc_signal< sc_lv<1> > tmp_18_fu_1113_p3;
    sc_signal< sc_lv<1> > tmp_17_fu_1101_p3;
    sc_signal< sc_lv<1> > tmp_16_fu_1089_p3;
    sc_signal< sc_lv<1> > tmp_15_fu_1075_p3;
    sc_signal< sc_lv<4> > p_Result_12_3_fu_1121_p5;
    sc_signal< sc_lv<4> > tmpTmpData_V_fu_1133_p2;
    sc_signal< sc_lv<1> > tmp_19_fu_1139_p1;
    sc_signal< sc_lv<64> > p_Repl2_2_fu_1143_p1;
    sc_signal< sc_lv<1> > tmp_21_fu_1157_p3;
    sc_signal< sc_lv<180> > tmp_20_fu_1147_p4;
    sc_signal< sc_lv<64> > p_Repl2_2_1_fu_1165_p1;
    sc_signal< sc_lv<1> > tmp_23_fu_1179_p3;
    sc_signal< sc_lv<180> > tmp_22_fu_1169_p4;
    sc_signal< sc_lv<64> > p_Repl2_2_2_fu_1187_p1;
    sc_signal< sc_lv<1> > tmp_25_fu_1201_p3;
    sc_signal< sc_lv<180> > tmp_24_fu_1191_p4;
    sc_signal< sc_lv<64> > p_Repl2_2_3_fu_1209_p1;
    sc_signal< sc_lv<180> > tmp_28_fu_1242_p6;
    sc_signal< sc_lv<180> > tmp_30_fu_1259_p6;
    sc_signal< sc_lv<180> > tmp_32_fu_1276_p6;
    sc_signal< sc_lv<32> > tmp_58_fu_1272_p1;
    sc_signal< sc_lv<32> > tmp_59_fu_1289_p1;
    sc_signal< sc_lv<17> > tmp_40_cast_fu_1302_p1;
    sc_signal< sc_lv<17> > i_op_assign_1_fu_1306_p3;
    sc_signal< sc_lv<17> > i_op_assign_7_pn_fu_1313_p3;
    sc_signal< sc_lv<32> > i_op_assign_7_pn_cas_fu_1320_p1;
    sc_signal< sc_lv<32> > tmp1_fu_1324_p2;
    sc_signal< sc_logic > ap_CS_fsm_state9;
    sc_signal< sc_lv<4> > ap_NS_fsm;
    sc_signal< sc_logic > ap_idle_pp0;
    sc_signal< sc_logic > ap_enable_pp0;
    sc_signal< bool > ap_condition_392;
    sc_signal< bool > ap_condition_398;
    static const sc_logic ap_const_logic_1;
    static const sc_logic ap_const_logic_0;
    static const sc_lv<4> ap_ST_fsm_state1;
    static const sc_lv<4> ap_ST_fsm_pp0_stage0;
    static const sc_lv<4> ap_ST_fsm_pp0_stage1;
    static const sc_lv<4> ap_ST_fsm_state9;
    static const sc_lv<32> ap_const_lv32_0;
    static const bool ap_const_boolean_1;
    static const sc_lv<2> ap_const_lv2_0;
    static const sc_lv<32> ap_const_lv32_2;
    static const bool ap_const_boolean_0;
    static const sc_lv<1> ap_const_lv1_1;
    static const sc_lv<32> ap_const_lv32_1;
    static const sc_lv<1> ap_const_lv1_0;
    static const sc_lv<2> ap_const_lv2_1;
    static const sc_lv<2> ap_const_lv2_2;
    static const sc_lv<31> ap_const_lv31_0;
    static const sc_lv<2> ap_const_lv2_3;
    static const sc_lv<32> ap_const_lv32_9;
    static const sc_lv<9> ap_const_lv9_2;
    static const sc_lv<9> ap_const_lv9_3;
    static const sc_lv<31> ap_const_lv31_1;
    static const sc_lv<32> ap_const_lv32_11;
    static const sc_lv<32> ap_const_lv32_19;
    static const sc_lv<32> ap_const_lv32_A;
    static const sc_lv<32> ap_const_lv32_18;
    static const sc_lv<32> ap_const_lv32_4;
    static const sc_lv<32> ap_const_lv32_3;
    static const sc_lv<10> ap_const_lv10_1;
    static const sc_lv<32> ap_const_lv32_12;
    static const sc_lv<4> ap_const_lv4_1;
    static const sc_lv<8> ap_const_lv8_0;
    static const sc_lv<16> ap_const_lv16_1;
    // Thread declarations
    void thread_ap_clk_no_reset_();
    void thread_ap_CS_fsm_pp0_stage0();
    void thread_ap_CS_fsm_pp0_stage1();
    void thread_ap_CS_fsm_state1();
    void thread_ap_CS_fsm_state9();
    void thread_ap_block_pp0_stage0();
    void thread_ap_block_pp0_stage0_01001();
    void thread_ap_block_pp0_stage0_11001();
    void thread_ap_block_pp0_stage0_subdone();
    void thread_ap_block_pp0_stage1();
    void thread_ap_block_pp0_stage1_11001();
    void thread_ap_block_pp0_stage1_subdone();
    void thread_ap_block_state2_pp0_stage0_iter0();
    void thread_ap_block_state3_pp0_stage1_iter0();
    void thread_ap_block_state4_pp0_stage0_iter1();
    void thread_ap_block_state5_pp0_stage1_iter1();
    void thread_ap_block_state6_pp0_stage0_iter2();
    void thread_ap_block_state7_pp0_stage1_iter2();
    void thread_ap_block_state8_pp0_stage0_iter3();
    void thread_ap_condition_392();
    void thread_ap_condition_398();
    void thread_ap_condition_pp0_exit_iter0_state2();
    void thread_ap_done();
    void thread_ap_enable_pp0();
    void thread_ap_idle();
    void thread_ap_idle_pp0();
    void thread_ap_phi_mux_glPLActiveSliceIdx_V_2_phi_fu_454_p8();
    void thread_ap_phi_mux_p_019_rec_phi_fu_471_p4();
    void thread_ap_ready();
    void thread_data_blk_n();
    void thread_data_read();
    void thread_eventSlice_blk_n();
    void thread_eventSlice_din();
    void thread_eventSlice_write();
    void thread_glPLSlice0_V_0_address0();
    void thread_glPLSlice0_V_0_address1();
    void thread_glPLSlice0_V_0_ce0();
    void thread_glPLSlice0_V_0_ce1();
    void thread_glPLSlice0_V_0_we0();
    void thread_glPLSlice0_V_1_address0();
    void thread_glPLSlice0_V_1_address1();
    void thread_glPLSlice0_V_1_ce0();
    void thread_glPLSlice0_V_1_ce1();
    void thread_glPLSlice0_V_1_we0();
    void thread_glPLSlice0_V_2_address0();
    void thread_glPLSlice0_V_2_address1();
    void thread_glPLSlice0_V_2_ce0();
    void thread_glPLSlice0_V_2_ce1();
    void thread_glPLSlice0_V_2_we0();
    void thread_glPLSlice0_V_3_address0();
    void thread_glPLSlice0_V_3_address1();
    void thread_glPLSlice0_V_3_ce0();
    void thread_glPLSlice0_V_3_ce1();
    void thread_glPLSlice0_V_3_we0();
    void thread_glPLSlice1_V_0_address0();
    void thread_glPLSlice1_V_0_address1();
    void thread_glPLSlice1_V_0_ce0();
    void thread_glPLSlice1_V_0_ce1();
    void thread_glPLSlice1_V_0_we0();
    void thread_glPLSlice1_V_1_address0();
    void thread_glPLSlice1_V_1_address1();
    void thread_glPLSlice1_V_1_ce0();
    void thread_glPLSlice1_V_1_ce1();
    void thread_glPLSlice1_V_1_we0();
    void thread_glPLSlice1_V_2_address0();
    void thread_glPLSlice1_V_2_address1();
    void thread_glPLSlice1_V_2_ce0();
    void thread_glPLSlice1_V_2_ce1();
    void thread_glPLSlice1_V_2_we0();
    void thread_glPLSlice1_V_3_address0();
    void thread_glPLSlice1_V_3_address1();
    void thread_glPLSlice1_V_3_ce0();
    void thread_glPLSlice1_V_3_ce1();
    void thread_glPLSlice1_V_3_we0();
    void thread_glPLSlice2_V_0_address0();
    void thread_glPLSlice2_V_0_address1();
    void thread_glPLSlice2_V_0_ce0();
    void thread_glPLSlice2_V_0_ce1();
    void thread_glPLSlice2_V_0_we0();
    void thread_glPLSlice2_V_1_address0();
    void thread_glPLSlice2_V_1_address1();
    void thread_glPLSlice2_V_1_ce0();
    void thread_glPLSlice2_V_1_ce1();
    void thread_glPLSlice2_V_1_we0();
    void thread_glPLSlice2_V_2_address0();
    void thread_glPLSlice2_V_2_address1();
    void thread_glPLSlice2_V_2_ce0();
    void thread_glPLSlice2_V_2_ce1();
    void thread_glPLSlice2_V_2_we0();
    void thread_glPLSlice2_V_3_address0();
    void thread_glPLSlice2_V_3_address1();
    void thread_glPLSlice2_V_3_ce0();
    void thread_glPLSlice2_V_3_ce1();
    void thread_glPLSlice2_V_3_we0();
    void thread_grp_fu_478_p4();
    void thread_grp_fu_487_p2();
    void thread_grp_fu_492_p2();
    void thread_i_cast_fu_556_p1();
    void thread_i_fu_565_p2();
    void thread_i_op_assign_1_fu_1306_p3();
    void thread_i_op_assign_7_pn_cas_fu_1320_p1();
    void thread_i_op_assign_7_pn_fu_1313_p3();
    void thread_index_assign_1_1_cas_fu_1097_p1();
    void thread_index_assign_1_2_cas_fu_1109_p1();
    void thread_index_assign_1_s_fu_1083_p2();
    void thread_index_assign_5_1_cas_fu_929_p1();
    void thread_index_assign_5_2_cas_fu_941_p1();
    void thread_index_assign_5_s_fu_915_p2();
    void thread_index_assign_9_1_cas_fu_761_p1();
    void thread_index_assign_9_2_cas_fu_773_p1();
    void thread_index_assign_9_s_fu_747_p2();
    void thread_localCnt_fu_1335_p2();
    void thread_newIndex2_fu_715_p1();
    void thread_newIndex4_fu_707_p1();
    void thread_newIndex5_fu_699_p1();
    void thread_newIndex7_fu_1227_p1();
    void thread_p_0505_0_i_fu_686_p2();
    void thread_p_Repl2_2_1_fu_1165_p1();
    void thread_p_Repl2_2_2_fu_1187_p1();
    void thread_p_Repl2_2_3_fu_1209_p1();
    void thread_p_Repl2_2_fu_1143_p1();
    void thread_p_Repl2_4_1_fu_997_p1();
    void thread_p_Repl2_4_2_fu_1019_p1();
    void thread_p_Repl2_4_3_fu_1041_p1();
    void thread_p_Repl2_4_fu_975_p1();
    void thread_p_Repl2_5_1_fu_829_p1();
    void thread_p_Repl2_5_2_fu_851_p1();
    void thread_p_Repl2_5_3_fu_873_p1();
    void thread_p_Repl2_5_fu_807_p1();
    void thread_p_Result_12_3_fu_1121_p5();
    void thread_p_Result_14_3_fu_953_p5();
    void thread_p_Result_16_3_fu_785_p5();
    void thread_tmp1_fu_1324_p2();
    void thread_tmp2_fu_1293_p2();
    void thread_tmpTmpData_V_1_fu_965_p2();
    void thread_tmpTmpData_V_2_fu_797_p2();
    void thread_tmpTmpData_V_fu_1133_p2();
    void thread_tmp_10_fu_665_p3();
    void thread_tmp_12_cast_fu_672_p1();
    void thread_tmp_12_fu_675_p3();
    void thread_tmp_14_cast_fu_682_p1();
    void thread_tmp_15_fu_1075_p3();
    void thread_tmp_16_fu_1089_p3();
    void thread_tmp_17_fu_1101_p3();
    void thread_tmp_18_cast_fu_1072_p1();
    void thread_tmp_18_fu_1113_p3();
    void thread_tmp_19_fu_1139_p1();
    void thread_tmp_1_fu_508_p2();
    void thread_tmp_20_fu_1147_p4();
    void thread_tmp_21_fu_1157_p3();
    void thread_tmp_22_cast_fu_904_p1();
    void thread_tmp_22_fu_1169_p4();
    void thread_tmp_23_fu_1179_p3();
    void thread_tmp_24_fu_1191_p4();
    void thread_tmp_25_fu_1201_p3();
    void thread_tmp_26_fu_571_p2();
    void thread_tmp_27_cast_fu_736_p1();
    void thread_tmp_27_fu_639_p2();
    void thread_tmp_29_fu_1213_p4();
    void thread_tmp_2_fu_514_p2();
    void thread_tmp_31_fu_907_p3();
    void thread_tmp_33_fu_921_p3();
    void thread_tmp_34_cast_fu_635_p1();
    void thread_tmp_34_fu_933_p3();
    void thread_tmp_35_fu_1345_p2();
    void thread_tmp_36_fu_945_p3();
    void thread_tmp_37_fu_971_p1();
    void thread_tmp_38_fu_979_p4();
    void thread_tmp_39_fu_989_p3();
    void thread_tmp_3_fu_560_p2();
    void thread_tmp_40_cast_fu_1302_p1();
    void thread_tmp_40_fu_1001_p4();
    void thread_tmp_41_fu_1011_p3();
    void thread_tmp_42_fu_1023_p4();
    void thread_tmp_43_fu_1033_p3();
    void thread_tmp_44_fu_1045_p4();
    void thread_tmp_45_fu_739_p3();
    void thread_tmp_46_fu_753_p3();
    void thread_tmp_47_fu_765_p3();
    void thread_tmp_48_fu_777_p3();
    void thread_tmp_49_fu_803_p1();
    void thread_tmp_50_fu_811_p4();
    void thread_tmp_51_fu_821_p3();
    void thread_tmp_52_fu_833_p4();
    void thread_tmp_53_fu_843_p3();
    void thread_tmp_54_fu_855_p4();
    void thread_tmp_55_fu_865_p3();
    void thread_tmp_56_fu_877_p4();
    void thread_tmp_57_fu_1255_p1();
    void thread_tmp_58_fu_1272_p1();
    void thread_tmp_59_fu_1289_p1();
    void thread_tmp_7_fu_544_p2();
    void thread_tmp_9_fu_550_p2();
    void thread_tmp_fu_502_p2();
    void thread_tmp_s_fu_538_p2();
    void thread_xNewIdx_V_fu_692_p2();
    void thread_x_fu_577_p4();
    void thread_ap_NS_fsm();
    void thread_hdltv_gen();
};

}

using namespace ap_rtl;

#endif
