# This script segment is generated automatically by AutoPilot

set id 1
set name parseEvents_mux_1bkb
set corename simcore_mux
set op mux
set stage_num 1
set max_latency -1
set registered_input 1
set din0_width 180
set din0_signed 0
set din1_width 180
set din1_signed 0
set din2_width 180
set din2_signed 0
set din3_width 180
set din3_signed 0
set din4_width 180
set din4_signed 0
set din5_width 180
set din5_signed 0
set din6_width 180
set din6_signed 0
set din7_width 180
set din7_signed 0
set din8_width 180
set din8_signed 0
set din9_width 180
set din9_signed 0
set din10_width 180
set din10_signed 0
set din11_width 180
set din11_signed 0
set din12_width 180
set din12_signed 0
set din13_width 180
set din13_signed 0
set din14_width 180
set din14_signed 0
set din15_width 180
set din15_signed 0
set din16_width 4
set din16_signed 0
set dout_width 180
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
    id 9 \
    name glPLSlice0_V_0 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename glPLSlice0_V_0 \
    op interface \
    ports { glPLSlice0_V_0_address0 { O 6 vector } glPLSlice0_V_0_ce0 { O 1 bit } glPLSlice0_V_0_we0 { O 1 bit } glPLSlice0_V_0_d0 { O 180 vector } glPLSlice0_V_0_q0 { I 180 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlice0_V_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 10 \
    name glPLSlice0_V_1 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename glPLSlice0_V_1 \
    op interface \
    ports { glPLSlice0_V_1_address0 { O 6 vector } glPLSlice0_V_1_ce0 { O 1 bit } glPLSlice0_V_1_we0 { O 1 bit } glPLSlice0_V_1_d0 { O 180 vector } glPLSlice0_V_1_q0 { I 180 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlice0_V_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 11 \
    name glPLSlice0_V_2 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename glPLSlice0_V_2 \
    op interface \
    ports { glPLSlice0_V_2_address0 { O 6 vector } glPLSlice0_V_2_ce0 { O 1 bit } glPLSlice0_V_2_we0 { O 1 bit } glPLSlice0_V_2_d0 { O 180 vector } glPLSlice0_V_2_q0 { I 180 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlice0_V_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 12 \
    name glPLSlice0_V_3 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename glPLSlice0_V_3 \
    op interface \
    ports { glPLSlice0_V_3_address0 { O 6 vector } glPLSlice0_V_3_ce0 { O 1 bit } glPLSlice0_V_3_we0 { O 1 bit } glPLSlice0_V_3_d0 { O 180 vector } glPLSlice0_V_3_q0 { I 180 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlice0_V_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 13 \
    name glPLSlice0_V_4 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename glPLSlice0_V_4 \
    op interface \
    ports { glPLSlice0_V_4_address0 { O 6 vector } glPLSlice0_V_4_ce0 { O 1 bit } glPLSlice0_V_4_we0 { O 1 bit } glPLSlice0_V_4_d0 { O 180 vector } glPLSlice0_V_4_q0 { I 180 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlice0_V_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 14 \
    name glPLSlice0_V_5 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename glPLSlice0_V_5 \
    op interface \
    ports { glPLSlice0_V_5_address0 { O 6 vector } glPLSlice0_V_5_ce0 { O 1 bit } glPLSlice0_V_5_we0 { O 1 bit } glPLSlice0_V_5_d0 { O 180 vector } glPLSlice0_V_5_q0 { I 180 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlice0_V_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 15 \
    name glPLSlice0_V_6 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename glPLSlice0_V_6 \
    op interface \
    ports { glPLSlice0_V_6_address0 { O 6 vector } glPLSlice0_V_6_ce0 { O 1 bit } glPLSlice0_V_6_we0 { O 1 bit } glPLSlice0_V_6_d0 { O 180 vector } glPLSlice0_V_6_q0 { I 180 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlice0_V_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 16 \
    name glPLSlice0_V_7 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename glPLSlice0_V_7 \
    op interface \
    ports { glPLSlice0_V_7_address0 { O 6 vector } glPLSlice0_V_7_ce0 { O 1 bit } glPLSlice0_V_7_we0 { O 1 bit } glPLSlice0_V_7_d0 { O 180 vector } glPLSlice0_V_7_q0 { I 180 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlice0_V_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 17 \
    name glPLSlice0_V_8 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename glPLSlice0_V_8 \
    op interface \
    ports { glPLSlice0_V_8_address0 { O 6 vector } glPLSlice0_V_8_ce0 { O 1 bit } glPLSlice0_V_8_we0 { O 1 bit } glPLSlice0_V_8_d0 { O 180 vector } glPLSlice0_V_8_q0 { I 180 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlice0_V_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 18 \
    name glPLSlice0_V_9 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename glPLSlice0_V_9 \
    op interface \
    ports { glPLSlice0_V_9_address0 { O 6 vector } glPLSlice0_V_9_ce0 { O 1 bit } glPLSlice0_V_9_we0 { O 1 bit } glPLSlice0_V_9_d0 { O 180 vector } glPLSlice0_V_9_q0 { I 180 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlice0_V_9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 19 \
    name glPLSlice0_V_10 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename glPLSlice0_V_10 \
    op interface \
    ports { glPLSlice0_V_10_address0 { O 6 vector } glPLSlice0_V_10_ce0 { O 1 bit } glPLSlice0_V_10_we0 { O 1 bit } glPLSlice0_V_10_d0 { O 180 vector } glPLSlice0_V_10_q0 { I 180 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlice0_V_10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 20 \
    name glPLSlice0_V_11 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename glPLSlice0_V_11 \
    op interface \
    ports { glPLSlice0_V_11_address0 { O 6 vector } glPLSlice0_V_11_ce0 { O 1 bit } glPLSlice0_V_11_we0 { O 1 bit } glPLSlice0_V_11_d0 { O 180 vector } glPLSlice0_V_11_q0 { I 180 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlice0_V_11'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 21 \
    name glPLSlice0_V_12 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename glPLSlice0_V_12 \
    op interface \
    ports { glPLSlice0_V_12_address0 { O 6 vector } glPLSlice0_V_12_ce0 { O 1 bit } glPLSlice0_V_12_we0 { O 1 bit } glPLSlice0_V_12_d0 { O 180 vector } glPLSlice0_V_12_q0 { I 180 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlice0_V_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 22 \
    name glPLSlice0_V_13 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename glPLSlice0_V_13 \
    op interface \
    ports { glPLSlice0_V_13_address0 { O 6 vector } glPLSlice0_V_13_ce0 { O 1 bit } glPLSlice0_V_13_we0 { O 1 bit } glPLSlice0_V_13_d0 { O 180 vector } glPLSlice0_V_13_q0 { I 180 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlice0_V_13'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 23 \
    name glPLSlice0_V_14 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename glPLSlice0_V_14 \
    op interface \
    ports { glPLSlice0_V_14_address0 { O 6 vector } glPLSlice0_V_14_ce0 { O 1 bit } glPLSlice0_V_14_we0 { O 1 bit } glPLSlice0_V_14_d0 { O 180 vector } glPLSlice0_V_14_q0 { I 180 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlice0_V_14'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 24 \
    name glPLSlice0_V_15 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename glPLSlice0_V_15 \
    op interface \
    ports { glPLSlice0_V_15_address0 { O 6 vector } glPLSlice0_V_15_ce0 { O 1 bit } glPLSlice0_V_15_we0 { O 1 bit } glPLSlice0_V_15_d0 { O 180 vector } glPLSlice0_V_15_q0 { I 180 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlice0_V_15'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 25 \
    name glPLSlice1_V_0 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename glPLSlice1_V_0 \
    op interface \
    ports { glPLSlice1_V_0_address0 { O 6 vector } glPLSlice1_V_0_ce0 { O 1 bit } glPLSlice1_V_0_we0 { O 1 bit } glPLSlice1_V_0_d0 { O 180 vector } glPLSlice1_V_0_q0 { I 180 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlice1_V_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 26 \
    name glPLSlice1_V_1 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename glPLSlice1_V_1 \
    op interface \
    ports { glPLSlice1_V_1_address0 { O 6 vector } glPLSlice1_V_1_ce0 { O 1 bit } glPLSlice1_V_1_we0 { O 1 bit } glPLSlice1_V_1_d0 { O 180 vector } glPLSlice1_V_1_q0 { I 180 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlice1_V_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 27 \
    name glPLSlice1_V_2 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename glPLSlice1_V_2 \
    op interface \
    ports { glPLSlice1_V_2_address0 { O 6 vector } glPLSlice1_V_2_ce0 { O 1 bit } glPLSlice1_V_2_we0 { O 1 bit } glPLSlice1_V_2_d0 { O 180 vector } glPLSlice1_V_2_q0 { I 180 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlice1_V_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 28 \
    name glPLSlice1_V_3 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename glPLSlice1_V_3 \
    op interface \
    ports { glPLSlice1_V_3_address0 { O 6 vector } glPLSlice1_V_3_ce0 { O 1 bit } glPLSlice1_V_3_we0 { O 1 bit } glPLSlice1_V_3_d0 { O 180 vector } glPLSlice1_V_3_q0 { I 180 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlice1_V_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 29 \
    name glPLSlice1_V_4 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename glPLSlice1_V_4 \
    op interface \
    ports { glPLSlice1_V_4_address0 { O 6 vector } glPLSlice1_V_4_ce0 { O 1 bit } glPLSlice1_V_4_we0 { O 1 bit } glPLSlice1_V_4_d0 { O 180 vector } glPLSlice1_V_4_q0 { I 180 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlice1_V_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 30 \
    name glPLSlice1_V_5 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename glPLSlice1_V_5 \
    op interface \
    ports { glPLSlice1_V_5_address0 { O 6 vector } glPLSlice1_V_5_ce0 { O 1 bit } glPLSlice1_V_5_we0 { O 1 bit } glPLSlice1_V_5_d0 { O 180 vector } glPLSlice1_V_5_q0 { I 180 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlice1_V_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 31 \
    name glPLSlice1_V_6 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename glPLSlice1_V_6 \
    op interface \
    ports { glPLSlice1_V_6_address0 { O 6 vector } glPLSlice1_V_6_ce0 { O 1 bit } glPLSlice1_V_6_we0 { O 1 bit } glPLSlice1_V_6_d0 { O 180 vector } glPLSlice1_V_6_q0 { I 180 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlice1_V_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 32 \
    name glPLSlice1_V_7 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename glPLSlice1_V_7 \
    op interface \
    ports { glPLSlice1_V_7_address0 { O 6 vector } glPLSlice1_V_7_ce0 { O 1 bit } glPLSlice1_V_7_we0 { O 1 bit } glPLSlice1_V_7_d0 { O 180 vector } glPLSlice1_V_7_q0 { I 180 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlice1_V_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 33 \
    name glPLSlice1_V_8 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename glPLSlice1_V_8 \
    op interface \
    ports { glPLSlice1_V_8_address0 { O 6 vector } glPLSlice1_V_8_ce0 { O 1 bit } glPLSlice1_V_8_we0 { O 1 bit } glPLSlice1_V_8_d0 { O 180 vector } glPLSlice1_V_8_q0 { I 180 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlice1_V_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 34 \
    name glPLSlice1_V_9 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename glPLSlice1_V_9 \
    op interface \
    ports { glPLSlice1_V_9_address0 { O 6 vector } glPLSlice1_V_9_ce0 { O 1 bit } glPLSlice1_V_9_we0 { O 1 bit } glPLSlice1_V_9_d0 { O 180 vector } glPLSlice1_V_9_q0 { I 180 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlice1_V_9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 35 \
    name glPLSlice1_V_10 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename glPLSlice1_V_10 \
    op interface \
    ports { glPLSlice1_V_10_address0 { O 6 vector } glPLSlice1_V_10_ce0 { O 1 bit } glPLSlice1_V_10_we0 { O 1 bit } glPLSlice1_V_10_d0 { O 180 vector } glPLSlice1_V_10_q0 { I 180 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlice1_V_10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 36 \
    name glPLSlice1_V_11 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename glPLSlice1_V_11 \
    op interface \
    ports { glPLSlice1_V_11_address0 { O 6 vector } glPLSlice1_V_11_ce0 { O 1 bit } glPLSlice1_V_11_we0 { O 1 bit } glPLSlice1_V_11_d0 { O 180 vector } glPLSlice1_V_11_q0 { I 180 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlice1_V_11'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 37 \
    name glPLSlice1_V_12 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename glPLSlice1_V_12 \
    op interface \
    ports { glPLSlice1_V_12_address0 { O 6 vector } glPLSlice1_V_12_ce0 { O 1 bit } glPLSlice1_V_12_we0 { O 1 bit } glPLSlice1_V_12_d0 { O 180 vector } glPLSlice1_V_12_q0 { I 180 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlice1_V_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 38 \
    name glPLSlice1_V_13 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename glPLSlice1_V_13 \
    op interface \
    ports { glPLSlice1_V_13_address0 { O 6 vector } glPLSlice1_V_13_ce0 { O 1 bit } glPLSlice1_V_13_we0 { O 1 bit } glPLSlice1_V_13_d0 { O 180 vector } glPLSlice1_V_13_q0 { I 180 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlice1_V_13'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 39 \
    name glPLSlice1_V_14 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename glPLSlice1_V_14 \
    op interface \
    ports { glPLSlice1_V_14_address0 { O 6 vector } glPLSlice1_V_14_ce0 { O 1 bit } glPLSlice1_V_14_we0 { O 1 bit } glPLSlice1_V_14_d0 { O 180 vector } glPLSlice1_V_14_q0 { I 180 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlice1_V_14'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 40 \
    name glPLSlice1_V_15 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename glPLSlice1_V_15 \
    op interface \
    ports { glPLSlice1_V_15_address0 { O 6 vector } glPLSlice1_V_15_ce0 { O 1 bit } glPLSlice1_V_15_we0 { O 1 bit } glPLSlice1_V_15_d0 { O 180 vector } glPLSlice1_V_15_q0 { I 180 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlice1_V_15'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 41 \
    name glPLSlice2_V_0 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename glPLSlice2_V_0 \
    op interface \
    ports { glPLSlice2_V_0_address0 { O 6 vector } glPLSlice2_V_0_ce0 { O 1 bit } glPLSlice2_V_0_we0 { O 1 bit } glPLSlice2_V_0_d0 { O 180 vector } glPLSlice2_V_0_q0 { I 180 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlice2_V_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 42 \
    name glPLSlice2_V_1 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename glPLSlice2_V_1 \
    op interface \
    ports { glPLSlice2_V_1_address0 { O 6 vector } glPLSlice2_V_1_ce0 { O 1 bit } glPLSlice2_V_1_we0 { O 1 bit } glPLSlice2_V_1_d0 { O 180 vector } glPLSlice2_V_1_q0 { I 180 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlice2_V_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 43 \
    name glPLSlice2_V_2 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename glPLSlice2_V_2 \
    op interface \
    ports { glPLSlice2_V_2_address0 { O 6 vector } glPLSlice2_V_2_ce0 { O 1 bit } glPLSlice2_V_2_we0 { O 1 bit } glPLSlice2_V_2_d0 { O 180 vector } glPLSlice2_V_2_q0 { I 180 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlice2_V_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 44 \
    name glPLSlice2_V_3 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename glPLSlice2_V_3 \
    op interface \
    ports { glPLSlice2_V_3_address0 { O 6 vector } glPLSlice2_V_3_ce0 { O 1 bit } glPLSlice2_V_3_we0 { O 1 bit } glPLSlice2_V_3_d0 { O 180 vector } glPLSlice2_V_3_q0 { I 180 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlice2_V_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 45 \
    name glPLSlice2_V_4 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename glPLSlice2_V_4 \
    op interface \
    ports { glPLSlice2_V_4_address0 { O 6 vector } glPLSlice2_V_4_ce0 { O 1 bit } glPLSlice2_V_4_we0 { O 1 bit } glPLSlice2_V_4_d0 { O 180 vector } glPLSlice2_V_4_q0 { I 180 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlice2_V_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 46 \
    name glPLSlice2_V_5 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename glPLSlice2_V_5 \
    op interface \
    ports { glPLSlice2_V_5_address0 { O 6 vector } glPLSlice2_V_5_ce0 { O 1 bit } glPLSlice2_V_5_we0 { O 1 bit } glPLSlice2_V_5_d0 { O 180 vector } glPLSlice2_V_5_q0 { I 180 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlice2_V_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 47 \
    name glPLSlice2_V_6 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename glPLSlice2_V_6 \
    op interface \
    ports { glPLSlice2_V_6_address0 { O 6 vector } glPLSlice2_V_6_ce0 { O 1 bit } glPLSlice2_V_6_we0 { O 1 bit } glPLSlice2_V_6_d0 { O 180 vector } glPLSlice2_V_6_q0 { I 180 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlice2_V_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 48 \
    name glPLSlice2_V_7 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename glPLSlice2_V_7 \
    op interface \
    ports { glPLSlice2_V_7_address0 { O 6 vector } glPLSlice2_V_7_ce0 { O 1 bit } glPLSlice2_V_7_we0 { O 1 bit } glPLSlice2_V_7_d0 { O 180 vector } glPLSlice2_V_7_q0 { I 180 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlice2_V_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 49 \
    name glPLSlice2_V_8 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename glPLSlice2_V_8 \
    op interface \
    ports { glPLSlice2_V_8_address0 { O 6 vector } glPLSlice2_V_8_ce0 { O 1 bit } glPLSlice2_V_8_we0 { O 1 bit } glPLSlice2_V_8_d0 { O 180 vector } glPLSlice2_V_8_q0 { I 180 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlice2_V_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 50 \
    name glPLSlice2_V_9 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename glPLSlice2_V_9 \
    op interface \
    ports { glPLSlice2_V_9_address0 { O 6 vector } glPLSlice2_V_9_ce0 { O 1 bit } glPLSlice2_V_9_we0 { O 1 bit } glPLSlice2_V_9_d0 { O 180 vector } glPLSlice2_V_9_q0 { I 180 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlice2_V_9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 51 \
    name glPLSlice2_V_10 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename glPLSlice2_V_10 \
    op interface \
    ports { glPLSlice2_V_10_address0 { O 6 vector } glPLSlice2_V_10_ce0 { O 1 bit } glPLSlice2_V_10_we0 { O 1 bit } glPLSlice2_V_10_d0 { O 180 vector } glPLSlice2_V_10_q0 { I 180 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlice2_V_10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 52 \
    name glPLSlice2_V_11 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename glPLSlice2_V_11 \
    op interface \
    ports { glPLSlice2_V_11_address0 { O 6 vector } glPLSlice2_V_11_ce0 { O 1 bit } glPLSlice2_V_11_we0 { O 1 bit } glPLSlice2_V_11_d0 { O 180 vector } glPLSlice2_V_11_q0 { I 180 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlice2_V_11'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 53 \
    name glPLSlice2_V_12 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename glPLSlice2_V_12 \
    op interface \
    ports { glPLSlice2_V_12_address0 { O 6 vector } glPLSlice2_V_12_ce0 { O 1 bit } glPLSlice2_V_12_we0 { O 1 bit } glPLSlice2_V_12_d0 { O 180 vector } glPLSlice2_V_12_q0 { I 180 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlice2_V_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 54 \
    name glPLSlice2_V_13 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename glPLSlice2_V_13 \
    op interface \
    ports { glPLSlice2_V_13_address0 { O 6 vector } glPLSlice2_V_13_ce0 { O 1 bit } glPLSlice2_V_13_we0 { O 1 bit } glPLSlice2_V_13_d0 { O 180 vector } glPLSlice2_V_13_q0 { I 180 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlice2_V_13'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 55 \
    name glPLSlice2_V_14 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename glPLSlice2_V_14 \
    op interface \
    ports { glPLSlice2_V_14_address0 { O 6 vector } glPLSlice2_V_14_ce0 { O 1 bit } glPLSlice2_V_14_we0 { O 1 bit } glPLSlice2_V_14_d0 { O 180 vector } glPLSlice2_V_14_q0 { I 180 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlice2_V_14'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 56 \
    name glPLSlice2_V_15 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename glPLSlice2_V_15 \
    op interface \
    ports { glPLSlice2_V_15_address0 { O 6 vector } glPLSlice2_V_15_ce0 { O 1 bit } glPLSlice2_V_15_we0 { O 1 bit } glPLSlice2_V_15_d0 { O 180 vector } glPLSlice2_V_15_q0 { I 180 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'glPLSlice2_V_15'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5 \
    name x \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_x \
    op interface \
    ports { x { I 10 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 6 \
    name y \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_y \
    op interface \
    ports { y { I 9 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 7 \
    name pol \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_pol \
    op interface \
    ports { pol { I 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 8 \
    name glPLActiveSliceIdx_V \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_glPLActiveSliceIdx_V \
    op interface \
    ports { glPLActiveSliceIdx_V { I 2 vector } } \
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


