# This script segment is generated automatically by AutoPilot

set id 1
set name parseEvents_mux_1bkb
set corename simcore_mux
set op mux
set stage_num 1
set max_latency -1
set registered_input 1
set din0_width 36
set din0_signed 0
set din1_width 36
set din1_signed 0
set din2_width 36
set din2_signed 0
set din3_width 36
set din3_signed 0
set din4_width 36
set din4_signed 0
set din5_width 36
set din5_signed 0
set din6_width 36
set din6_signed 0
set din7_width 36
set din7_signed 0
set din8_width 36
set din8_signed 0
set din9_width 36
set din9_signed 0
set din10_width 36
set din10_signed 0
set din11_width 36
set din11_signed 0
set din12_width 36
set din12_signed 0
set din13_width 36
set din13_signed 0
set din14_width 36
set din14_signed 0
set din15_width 36
set din15_signed 0
set din16_width 4
set din16_signed 0
set dout_width 36
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_mux] == "ap_gen_simcore_mux"} {
eval "ap_gen_simcore_mux { \
    id ${id} \
    name ${name} \
    corename ${corename} \
    op ${op} \
    reset_level 1 \
    sync_rst true \
    stage_num ${stage_num} \
    max_latency ${max_latency} \
    registered_input ${registered_input} \
    din0_width ${din0_width} \
    din0_signed ${din0_signed} \
    din1_width ${din1_width} \
    din1_signed ${din1_signed} \
    din2_width ${din2_width} \
    din2_signed ${din2_signed} \
    din3_width ${din3_width} \
    din3_signed ${din3_signed} \
    din4_width ${din4_width} \
    din4_signed ${din4_signed} \
    din5_width ${din5_width} \
    din5_signed ${din5_signed} \
    din6_width ${din6_width} \
    din6_signed ${din6_signed} \
    din7_width ${din7_width} \
    din7_signed ${din7_signed} \
    din8_width ${din8_width} \
    din8_signed ${din8_signed} \
    din9_width ${din9_width} \
    din9_signed ${din9_signed} \
    din10_width ${din10_width} \
    din10_signed ${din10_signed} \
    din11_width ${din11_width} \
    din11_signed ${din11_signed} \
    din12_width ${din12_width} \
    din12_signed ${din12_signed} \
    din13_width ${din13_width} \
    din13_signed ${din13_signed} \
    din14_width ${din14_width} \
    din14_signed ${din14_signed} \
    din15_width ${din15_width} \
    din15_signed ${din15_signed} \
    din16_width ${din16_width} \
    din16_signed ${din16_signed} \
    dout_width ${dout_width} \
}"
} else {
puts "@W \[IMPL-100\] Cannot find ap_gen_simcore_mux, check your AutoPilot builtin lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ${name}
}


set op mux
set corename MuxnS
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_pipemux] == "::AESL_LIB_VIRTEX::xil_gen_pipemux"} {
eval "::AESL_LIB_VIRTEX::xil_gen_pipemux { \
    id ${id} \
    name ${name} \
    corename ${corename} \
    op ${op} \
    reset_level 1 \
    sync_rst true \
    stage_num ${stage_num} \
    max_latency ${max_latency} \
    registered_input ${registered_input} \
    din0_width ${din0_width} \
    din0_signed ${din0_signed} \
    din1_width ${din1_width} \
    din1_signed ${din1_signed} \
    din2_width ${din2_width} \
    din2_signed ${din2_signed} \
    din3_width ${din3_width} \
    din3_signed ${din3_signed} \
    din4_width ${din4_width} \
    din4_signed ${din4_signed} \
    din5_width ${din5_width} \
    din5_signed ${din5_signed} \
    din6_width ${din6_width} \
    din6_signed ${din6_signed} \
    din7_width ${din7_width} \
    din7_signed ${din7_signed} \
    din8_width ${din8_width} \
    din8_signed ${din8_signed} \
    din9_width ${din9_width} \
    din9_signed ${din9_signed} \
    din10_width ${din10_width} \
    din10_signed ${din10_signed} \
    din11_width ${din11_width} \
    din11_signed ${din11_signed} \
    din12_width ${din12_width} \
    din12_signed ${din12_signed} \
    din13_width ${din13_width} \
    din13_signed ${din13_signed} \
    din14_width ${din14_width} \
    din14_signed ${din14_signed} \
    din15_width ${din15_width} \
    din15_signed ${din15_signed} \
    din16_width ${din16_width} \
    din16_signed ${din16_signed} \
    dout_width ${dout_width} \
}"
} else {
puts "@W \[IMPL-101\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_pipemux, check your platform lib"
}
}


# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 33 \
    name glPLSlices_V_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename glPLSlices_V_0 \
    op interface \
    ports { glPLSlices_V_0_address0 { O 10 vector } glPLSlices_V_0_ce0 { O 1 bit } glPLSlices_V_0_q0 { I 36 vector } glPLSlices_V_0_address1 { O 10 vector } glPLSlices_V_0_ce1 { O 1 bit } glPLSlices_V_0_q1 { I 36 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlices_V_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 34 \
    name glPLSlices_V_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename glPLSlices_V_1 \
    op interface \
    ports { glPLSlices_V_1_address0 { O 10 vector } glPLSlices_V_1_ce0 { O 1 bit } glPLSlices_V_1_q0 { I 36 vector } glPLSlices_V_1_address1 { O 10 vector } glPLSlices_V_1_ce1 { O 1 bit } glPLSlices_V_1_q1 { I 36 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlices_V_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 35 \
    name glPLSlices_V_2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename glPLSlices_V_2 \
    op interface \
    ports { glPLSlices_V_2_address0 { O 10 vector } glPLSlices_V_2_ce0 { O 1 bit } glPLSlices_V_2_q0 { I 36 vector } glPLSlices_V_2_address1 { O 10 vector } glPLSlices_V_2_ce1 { O 1 bit } glPLSlices_V_2_q1 { I 36 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlices_V_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 36 \
    name glPLSlices_V_3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename glPLSlices_V_3 \
    op interface \
    ports { glPLSlices_V_3_address0 { O 10 vector } glPLSlices_V_3_ce0 { O 1 bit } glPLSlices_V_3_q0 { I 36 vector } glPLSlices_V_3_address1 { O 10 vector } glPLSlices_V_3_ce1 { O 1 bit } glPLSlices_V_3_q1 { I 36 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlices_V_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 37 \
    name glPLSlices_V_4 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename glPLSlices_V_4 \
    op interface \
    ports { glPLSlices_V_4_address0 { O 10 vector } glPLSlices_V_4_ce0 { O 1 bit } glPLSlices_V_4_q0 { I 36 vector } glPLSlices_V_4_address1 { O 10 vector } glPLSlices_V_4_ce1 { O 1 bit } glPLSlices_V_4_q1 { I 36 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlices_V_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 38 \
    name glPLSlices_V_5 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename glPLSlices_V_5 \
    op interface \
    ports { glPLSlices_V_5_address0 { O 10 vector } glPLSlices_V_5_ce0 { O 1 bit } glPLSlices_V_5_q0 { I 36 vector } glPLSlices_V_5_address1 { O 10 vector } glPLSlices_V_5_ce1 { O 1 bit } glPLSlices_V_5_q1 { I 36 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlices_V_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 39 \
    name glPLSlices_V_6 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename glPLSlices_V_6 \
    op interface \
    ports { glPLSlices_V_6_address0 { O 10 vector } glPLSlices_V_6_ce0 { O 1 bit } glPLSlices_V_6_q0 { I 36 vector } glPLSlices_V_6_address1 { O 10 vector } glPLSlices_V_6_ce1 { O 1 bit } glPLSlices_V_6_q1 { I 36 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlices_V_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 40 \
    name glPLSlices_V_7 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename glPLSlices_V_7 \
    op interface \
    ports { glPLSlices_V_7_address0 { O 10 vector } glPLSlices_V_7_ce0 { O 1 bit } glPLSlices_V_7_q0 { I 36 vector } glPLSlices_V_7_address1 { O 10 vector } glPLSlices_V_7_ce1 { O 1 bit } glPLSlices_V_7_q1 { I 36 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlices_V_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 41 \
    name glPLSlices_V_8 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename glPLSlices_V_8 \
    op interface \
    ports { glPLSlices_V_8_address0 { O 10 vector } glPLSlices_V_8_ce0 { O 1 bit } glPLSlices_V_8_q0 { I 36 vector } glPLSlices_V_8_address1 { O 10 vector } glPLSlices_V_8_ce1 { O 1 bit } glPLSlices_V_8_q1 { I 36 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlices_V_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 42 \
    name glPLSlices_V_9 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename glPLSlices_V_9 \
    op interface \
    ports { glPLSlices_V_9_address0 { O 10 vector } glPLSlices_V_9_ce0 { O 1 bit } glPLSlices_V_9_q0 { I 36 vector } glPLSlices_V_9_address1 { O 10 vector } glPLSlices_V_9_ce1 { O 1 bit } glPLSlices_V_9_q1 { I 36 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlices_V_9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 43 \
    name glPLSlices_V_10 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename glPLSlices_V_10 \
    op interface \
    ports { glPLSlices_V_10_address0 { O 10 vector } glPLSlices_V_10_ce0 { O 1 bit } glPLSlices_V_10_q0 { I 36 vector } glPLSlices_V_10_address1 { O 10 vector } glPLSlices_V_10_ce1 { O 1 bit } glPLSlices_V_10_q1 { I 36 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlices_V_10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 44 \
    name glPLSlices_V_11 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename glPLSlices_V_11 \
    op interface \
    ports { glPLSlices_V_11_address0 { O 10 vector } glPLSlices_V_11_ce0 { O 1 bit } glPLSlices_V_11_q0 { I 36 vector } glPLSlices_V_11_address1 { O 10 vector } glPLSlices_V_11_ce1 { O 1 bit } glPLSlices_V_11_q1 { I 36 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlices_V_11'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 45 \
    name glPLSlices_V_12 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename glPLSlices_V_12 \
    op interface \
    ports { glPLSlices_V_12_address0 { O 10 vector } glPLSlices_V_12_ce0 { O 1 bit } glPLSlices_V_12_q0 { I 36 vector } glPLSlices_V_12_address1 { O 10 vector } glPLSlices_V_12_ce1 { O 1 bit } glPLSlices_V_12_q1 { I 36 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlices_V_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 46 \
    name glPLSlices_V_13 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename glPLSlices_V_13 \
    op interface \
    ports { glPLSlices_V_13_address0 { O 10 vector } glPLSlices_V_13_ce0 { O 1 bit } glPLSlices_V_13_q0 { I 36 vector } glPLSlices_V_13_address1 { O 10 vector } glPLSlices_V_13_ce1 { O 1 bit } glPLSlices_V_13_q1 { I 36 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlices_V_13'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 47 \
    name glPLSlices_V_14 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename glPLSlices_V_14 \
    op interface \
    ports { glPLSlices_V_14_address0 { O 10 vector } glPLSlices_V_14_ce0 { O 1 bit } glPLSlices_V_14_q0 { I 36 vector } glPLSlices_V_14_address1 { O 10 vector } glPLSlices_V_14_ce1 { O 1 bit } glPLSlices_V_14_q1 { I 36 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlices_V_14'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 48 \
    name glPLSlices_V_15 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename glPLSlices_V_15 \
    op interface \
    ports { glPLSlices_V_15_address0 { O 10 vector } glPLSlices_V_15_ce0 { O 1 bit } glPLSlices_V_15_q0 { I 36 vector } glPLSlices_V_15_address1 { O 10 vector } glPLSlices_V_15_ce1 { O 1 bit } glPLSlices_V_15_q1 { I 36 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlices_V_15'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 30 \
    name x \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_x \
    op interface \
    ports { x { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 31 \
    name y \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_y \
    op interface \
    ports { y { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 32 \
    name glPLTminus1SliceIdx_s \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_glPLTminus1SliceIdx_s \
    op interface \
    ports { glPLTminus1SliceIdx_s { I 2 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 49 \
    name glPLTminus2SliceIdx_s \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_glPLTminus2SliceIdx_s \
    op interface \
    ports { glPLTminus2SliceIdx_s { I 2 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 50 \
    name refBlock_V_0_0 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_refBlock_V_0_0 \
    op interface \
    ports { refBlock_V_0_0 { O 4 vector } refBlock_V_0_0_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 51 \
    name targetBlocks_V_0_0 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_targetBlocks_V_0_0 \
    op interface \
    ports { targetBlocks_V_0_0 { O 4 vector } targetBlocks_V_0_0_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 52 \
    name refBlock_V_1_1 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_refBlock_V_1_1 \
    op interface \
    ports { refBlock_V_1_1 { O 4 vector } refBlock_V_1_1_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 53 \
    name targetBlocks_V_1_1 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_targetBlocks_V_1_1 \
    op interface \
    ports { targetBlocks_V_1_1 { O 4 vector } targetBlocks_V_1_1_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 54 \
    name refBlock_V_2_2 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_refBlock_V_2_2 \
    op interface \
    ports { refBlock_V_2_2 { O 4 vector } refBlock_V_2_2_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 55 \
    name targetBlocks_V_2_2 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_targetBlocks_V_2_2 \
    op interface \
    ports { targetBlocks_V_2_2 { O 4 vector } targetBlocks_V_2_2_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 56 \
    name refBlock_V_3_3 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_refBlock_V_3_3 \
    op interface \
    ports { refBlock_V_3_3 { O 4 vector } refBlock_V_3_3_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 57 \
    name targetBlocks_V_3_3 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_targetBlocks_V_3_3 \
    op interface \
    ports { targetBlocks_V_3_3 { O 4 vector } targetBlocks_V_3_3_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 58 \
    name refBlock_V_4_4 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_refBlock_V_4_4 \
    op interface \
    ports { refBlock_V_4_4 { O 4 vector } refBlock_V_4_4_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 59 \
    name targetBlocks_V_4_4 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_targetBlocks_V_4_4 \
    op interface \
    ports { targetBlocks_V_4_4 { O 4 vector } targetBlocks_V_4_4_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 60 \
    name refBlock_V_5_5 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_refBlock_V_5_5 \
    op interface \
    ports { refBlock_V_5_5 { O 4 vector } refBlock_V_5_5_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 61 \
    name targetBlocks_V_5_5 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_targetBlocks_V_5_5 \
    op interface \
    ports { targetBlocks_V_5_5 { O 4 vector } targetBlocks_V_5_5_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 62 \
    name refBlock_V_6_6 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_refBlock_V_6_6 \
    op interface \
    ports { refBlock_V_6_6 { O 4 vector } refBlock_V_6_6_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 63 \
    name targetBlocks_V_6_6 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_targetBlocks_V_6_6 \
    op interface \
    ports { targetBlocks_V_6_6 { O 4 vector } targetBlocks_V_6_6_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 64 \
    name refBlock_V_7_7 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_refBlock_V_7_7 \
    op interface \
    ports { refBlock_V_7_7 { O 4 vector } refBlock_V_7_7_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 65 \
    name targetBlocks_V_7_7 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_targetBlocks_V_7_7 \
    op interface \
    ports { targetBlocks_V_7_7 { O 4 vector } targetBlocks_V_7_7_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 66 \
    name refBlock_V_8_8 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_refBlock_V_8_8 \
    op interface \
    ports { refBlock_V_8_8 { O 4 vector } refBlock_V_8_8_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 67 \
    name targetBlocks_V_8_8 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_targetBlocks_V_8_8 \
    op interface \
    ports { targetBlocks_V_8_8 { O 4 vector } targetBlocks_V_8_8_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 68 \
    name refBlock_V_9_9 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_refBlock_V_9_9 \
    op interface \
    ports { refBlock_V_9_9 { O 4 vector } refBlock_V_9_9_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 69 \
    name targetBlocks_V_9_9 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_targetBlocks_V_9_9 \
    op interface \
    ports { targetBlocks_V_9_9 { O 4 vector } targetBlocks_V_9_9_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 70 \
    name refBlock_V_10_10 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_refBlock_V_10_10 \
    op interface \
    ports { refBlock_V_10_10 { O 4 vector } refBlock_V_10_10_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 71 \
    name targetBlocks_V_10_10 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_targetBlocks_V_10_10 \
    op interface \
    ports { targetBlocks_V_10_10 { O 4 vector } targetBlocks_V_10_10_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 72 \
    name refBlock_V_11_11 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_refBlock_V_11_11 \
    op interface \
    ports { refBlock_V_11_11 { O 4 vector } refBlock_V_11_11_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 73 \
    name targetBlocks_V_11_11 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_targetBlocks_V_11_11 \
    op interface \
    ports { targetBlocks_V_11_11 { O 4 vector } targetBlocks_V_11_11_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 74 \
    name refBlock_V_12_12 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_refBlock_V_12_12 \
    op interface \
    ports { refBlock_V_12_12 { O 4 vector } refBlock_V_12_12_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 75 \
    name targetBlocks_V_12_12 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_targetBlocks_V_12_12 \
    op interface \
    ports { targetBlocks_V_12_12 { O 4 vector } targetBlocks_V_12_12_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 76 \
    name refBlock_V_13_13 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_refBlock_V_13_13 \
    op interface \
    ports { refBlock_V_13_13 { O 4 vector } refBlock_V_13_13_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 77 \
    name targetBlocks_V_13_13 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_targetBlocks_V_13_13 \
    op interface \
    ports { targetBlocks_V_13_13 { O 4 vector } targetBlocks_V_13_13_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 78 \
    name targetBlocks_V_14_1 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_targetBlocks_V_14_1 \
    op interface \
    ports { targetBlocks_V_14_1 { O 4 vector } targetBlocks_V_14_1_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 79 \
    name targetBlocks_V_14_2 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_targetBlocks_V_14_2 \
    op interface \
    ports { targetBlocks_V_14_2 { O 4 vector } targetBlocks_V_14_2_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 80 \
    name targetBlocks_V_14_3 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_targetBlocks_V_14_3 \
    op interface \
    ports { targetBlocks_V_14_3 { O 4 vector } targetBlocks_V_14_3_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 81 \
    name targetBlocks_V_14_4 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_targetBlocks_V_14_4 \
    op interface \
    ports { targetBlocks_V_14_4 { O 4 vector } targetBlocks_V_14_4_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 82 \
    name targetBlocks_V_14_5 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_targetBlocks_V_14_5 \
    op interface \
    ports { targetBlocks_V_14_5 { O 4 vector } targetBlocks_V_14_5_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 83 \
    name targetBlocks_V_14_6 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_targetBlocks_V_14_6 \
    op interface \
    ports { targetBlocks_V_14_6 { O 4 vector } targetBlocks_V_14_6_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 84 \
    name targetBlocks_V_14_7 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_targetBlocks_V_14_7 \
    op interface \
    ports { targetBlocks_V_14_7 { O 4 vector } targetBlocks_V_14_7_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 85 \
    name targetBlocks_V_14_8 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_targetBlocks_V_14_8 \
    op interface \
    ports { targetBlocks_V_14_8 { O 4 vector } targetBlocks_V_14_8_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 86 \
    name targetBlocks_V_14_9 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_targetBlocks_V_14_9 \
    op interface \
    ports { targetBlocks_V_14_9 { O 4 vector } targetBlocks_V_14_9_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 87 \
    name targetBlocks_V_14_10 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_targetBlocks_V_14_10 \
    op interface \
    ports { targetBlocks_V_14_10 { O 4 vector } targetBlocks_V_14_10_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 88 \
    name targetBlocks_V_14_11 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_targetBlocks_V_14_11 \
    op interface \
    ports { targetBlocks_V_14_11 { O 4 vector } targetBlocks_V_14_11_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 89 \
    name targetBlocks_V_14_12 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_targetBlocks_V_14_12 \
    op interface \
    ports { targetBlocks_V_14_12 { O 4 vector } targetBlocks_V_14_12_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 90 \
    name targetBlocks_V_14_13 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_targetBlocks_V_14_13 \
    op interface \
    ports { targetBlocks_V_14_13 { O 4 vector } targetBlocks_V_14_13_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 91 \
    name refBlock_V_14_14 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_refBlock_V_14_14 \
    op interface \
    ports { refBlock_V_14_14 { O 4 vector } refBlock_V_14_14_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 92 \
    name targetBlocks_V_14_14 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_targetBlocks_V_14_14 \
    op interface \
    ports { targetBlocks_V_14_14 { O 4 vector } targetBlocks_V_14_14_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -2 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_ce
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_ce] == "cg_default_interface_gen_ce"} {
eval "cg_default_interface_gen_ce { \
    id -4 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_ce \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


