set moduleName accumulateHW
set isTaskLevelControl 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type function
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set C_modelName {accumulateHW}
set C_modelType { void 0 }
set C_modelArgList {
	{ x int 10 regular  }
	{ y int 9 regular  }
	{ pol int 1 regular  }
	{ glPLActiveSliceIdx_V int 2 regular {pointer 0} {global 0}  }
	{ glPLSlice0_V_0 int 180 regular {array 60 { 2 3 } 1 1 } {global 2}  }
	{ glPLSlice0_V_1 int 180 regular {array 60 { 2 3 } 1 1 } {global 2}  }
	{ glPLSlice0_V_2 int 180 regular {array 60 { 2 3 } 1 1 } {global 2}  }
	{ glPLSlice0_V_3 int 180 regular {array 60 { 2 3 } 1 1 } {global 2}  }
	{ glPLSlice0_V_4 int 180 regular {array 60 { 2 3 } 1 1 } {global 2}  }
	{ glPLSlice0_V_5 int 180 regular {array 60 { 2 3 } 1 1 } {global 2}  }
	{ glPLSlice0_V_6 int 180 regular {array 60 { 2 3 } 1 1 } {global 2}  }
	{ glPLSlice0_V_7 int 180 regular {array 60 { 2 3 } 1 1 } {global 2}  }
	{ glPLSlice0_V_8 int 180 regular {array 60 { 2 3 } 1 1 } {global 2}  }
	{ glPLSlice0_V_9 int 180 regular {array 60 { 2 3 } 1 1 } {global 2}  }
	{ glPLSlice0_V_10 int 180 regular {array 60 { 2 3 } 1 1 } {global 2}  }
	{ glPLSlice0_V_11 int 180 regular {array 60 { 2 3 } 1 1 } {global 2}  }
	{ glPLSlice0_V_12 int 180 regular {array 60 { 2 3 } 1 1 } {global 2}  }
	{ glPLSlice0_V_13 int 180 regular {array 60 { 2 3 } 1 1 } {global 2}  }
	{ glPLSlice0_V_14 int 180 regular {array 60 { 2 3 } 1 1 } {global 2}  }
	{ glPLSlice0_V_15 int 180 regular {array 60 { 2 3 } 1 1 } {global 2}  }
	{ glPLSlice1_V_0 int 180 regular {array 60 { 2 3 } 1 1 } {global 2}  }
	{ glPLSlice1_V_1 int 180 regular {array 60 { 2 3 } 1 1 } {global 2}  }
	{ glPLSlice1_V_2 int 180 regular {array 60 { 2 3 } 1 1 } {global 2}  }
	{ glPLSlice1_V_3 int 180 regular {array 60 { 2 3 } 1 1 } {global 2}  }
	{ glPLSlice1_V_4 int 180 regular {array 60 { 2 3 } 1 1 } {global 2}  }
	{ glPLSlice1_V_5 int 180 regular {array 60 { 2 3 } 1 1 } {global 2}  }
	{ glPLSlice1_V_6 int 180 regular {array 60 { 2 3 } 1 1 } {global 2}  }
	{ glPLSlice1_V_7 int 180 regular {array 60 { 2 3 } 1 1 } {global 2}  }
	{ glPLSlice1_V_8 int 180 regular {array 60 { 2 3 } 1 1 } {global 2}  }
	{ glPLSlice1_V_9 int 180 regular {array 60 { 2 3 } 1 1 } {global 2}  }
	{ glPLSlice1_V_10 int 180 regular {array 60 { 2 3 } 1 1 } {global 2}  }
	{ glPLSlice1_V_11 int 180 regular {array 60 { 2 3 } 1 1 } {global 2}  }
	{ glPLSlice1_V_12 int 180 regular {array 60 { 2 3 } 1 1 } {global 2}  }
	{ glPLSlice1_V_13 int 180 regular {array 60 { 2 3 } 1 1 } {global 2}  }
	{ glPLSlice1_V_14 int 180 regular {array 60 { 2 3 } 1 1 } {global 2}  }
	{ glPLSlice1_V_15 int 180 regular {array 60 { 2 3 } 1 1 } {global 2}  }
	{ glPLSlice2_V_0 int 180 regular {array 60 { 2 3 } 1 1 } {global 2}  }
	{ glPLSlice2_V_1 int 180 regular {array 60 { 2 3 } 1 1 } {global 2}  }
	{ glPLSlice2_V_2 int 180 regular {array 60 { 2 3 } 1 1 } {global 2}  }
	{ glPLSlice2_V_3 int 180 regular {array 60 { 2 3 } 1 1 } {global 2}  }
	{ glPLSlice2_V_4 int 180 regular {array 60 { 2 3 } 1 1 } {global 2}  }
	{ glPLSlice2_V_5 int 180 regular {array 60 { 2 3 } 1 1 } {global 2}  }
	{ glPLSlice2_V_6 int 180 regular {array 60 { 2 3 } 1 1 } {global 2}  }
	{ glPLSlice2_V_7 int 180 regular {array 60 { 2 3 } 1 1 } {global 2}  }
	{ glPLSlice2_V_8 int 180 regular {array 60 { 2 3 } 1 1 } {global 2}  }
	{ glPLSlice2_V_9 int 180 regular {array 60 { 2 3 } 1 1 } {global 2}  }
	{ glPLSlice2_V_10 int 180 regular {array 60 { 2 3 } 1 1 } {global 2}  }
	{ glPLSlice2_V_11 int 180 regular {array 60 { 2 3 } 1 1 } {global 2}  }
	{ glPLSlice2_V_12 int 180 regular {array 60 { 2 3 } 1 1 } {global 2}  }
	{ glPLSlice2_V_13 int 180 regular {array 60 { 2 3 } 1 1 } {global 2}  }
	{ glPLSlice2_V_14 int 180 regular {array 60 { 2 3 } 1 1 } {global 2}  }
	{ glPLSlice2_V_15 int 180 regular {array 60 { 2 3 } 1 1 } {global 2}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "x", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "y", "interface" : "wire", "bitwidth" : 9, "direction" : "READONLY"} , 
 	{ "Name" : "pol", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "glPLActiveSliceIdx_V", "interface" : "wire", "bitwidth" : 2, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "glPLSlice0_V_0", "interface" : "memory", "bitwidth" : 180, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "glPLSlice0_V_1", "interface" : "memory", "bitwidth" : 180, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "glPLSlice0_V_2", "interface" : "memory", "bitwidth" : 180, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "glPLSlice0_V_3", "interface" : "memory", "bitwidth" : 180, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "glPLSlice0_V_4", "interface" : "memory", "bitwidth" : 180, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "glPLSlice0_V_5", "interface" : "memory", "bitwidth" : 180, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "glPLSlice0_V_6", "interface" : "memory", "bitwidth" : 180, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "glPLSlice0_V_7", "interface" : "memory", "bitwidth" : 180, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "glPLSlice0_V_8", "interface" : "memory", "bitwidth" : 180, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "glPLSlice0_V_9", "interface" : "memory", "bitwidth" : 180, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "glPLSlice0_V_10", "interface" : "memory", "bitwidth" : 180, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "glPLSlice0_V_11", "interface" : "memory", "bitwidth" : 180, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "glPLSlice0_V_12", "interface" : "memory", "bitwidth" : 180, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "glPLSlice0_V_13", "interface" : "memory", "bitwidth" : 180, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "glPLSlice0_V_14", "interface" : "memory", "bitwidth" : 180, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "glPLSlice0_V_15", "interface" : "memory", "bitwidth" : 180, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "glPLSlice1_V_0", "interface" : "memory", "bitwidth" : 180, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "glPLSlice1_V_1", "interface" : "memory", "bitwidth" : 180, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "glPLSlice1_V_2", "interface" : "memory", "bitwidth" : 180, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "glPLSlice1_V_3", "interface" : "memory", "bitwidth" : 180, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "glPLSlice1_V_4", "interface" : "memory", "bitwidth" : 180, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "glPLSlice1_V_5", "interface" : "memory", "bitwidth" : 180, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "glPLSlice1_V_6", "interface" : "memory", "bitwidth" : 180, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "glPLSlice1_V_7", "interface" : "memory", "bitwidth" : 180, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "glPLSlice1_V_8", "interface" : "memory", "bitwidth" : 180, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "glPLSlice1_V_9", "interface" : "memory", "bitwidth" : 180, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "glPLSlice1_V_10", "interface" : "memory", "bitwidth" : 180, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "glPLSlice1_V_11", "interface" : "memory", "bitwidth" : 180, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "glPLSlice1_V_12", "interface" : "memory", "bitwidth" : 180, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "glPLSlice1_V_13", "interface" : "memory", "bitwidth" : 180, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "glPLSlice1_V_14", "interface" : "memory", "bitwidth" : 180, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "glPLSlice1_V_15", "interface" : "memory", "bitwidth" : 180, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "glPLSlice2_V_0", "interface" : "memory", "bitwidth" : 180, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "glPLSlice2_V_1", "interface" : "memory", "bitwidth" : 180, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "glPLSlice2_V_2", "interface" : "memory", "bitwidth" : 180, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "glPLSlice2_V_3", "interface" : "memory", "bitwidth" : 180, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "glPLSlice2_V_4", "interface" : "memory", "bitwidth" : 180, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "glPLSlice2_V_5", "interface" : "memory", "bitwidth" : 180, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "glPLSlice2_V_6", "interface" : "memory", "bitwidth" : 180, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "glPLSlice2_V_7", "interface" : "memory", "bitwidth" : 180, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "glPLSlice2_V_8", "interface" : "memory", "bitwidth" : 180, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "glPLSlice2_V_9", "interface" : "memory", "bitwidth" : 180, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "glPLSlice2_V_10", "interface" : "memory", "bitwidth" : 180, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "glPLSlice2_V_11", "interface" : "memory", "bitwidth" : 180, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "glPLSlice2_V_12", "interface" : "memory", "bitwidth" : 180, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "glPLSlice2_V_13", "interface" : "memory", "bitwidth" : 180, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "glPLSlice2_V_14", "interface" : "memory", "bitwidth" : 180, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "glPLSlice2_V_15", "interface" : "memory", "bitwidth" : 180, "direction" : "READWRITE", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 251
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ x sc_in sc_lv 10 signal 0 } 
	{ y sc_in sc_lv 9 signal 1 } 
	{ pol sc_in sc_logic 1 signal 2 } 
	{ glPLActiveSliceIdx_V sc_in sc_lv 2 signal 3 } 
	{ glPLSlice0_V_0_address0 sc_out sc_lv 6 signal 4 } 
	{ glPLSlice0_V_0_ce0 sc_out sc_logic 1 signal 4 } 
	{ glPLSlice0_V_0_we0 sc_out sc_logic 1 signal 4 } 
	{ glPLSlice0_V_0_d0 sc_out sc_lv 180 signal 4 } 
	{ glPLSlice0_V_0_q0 sc_in sc_lv 180 signal 4 } 
	{ glPLSlice0_V_1_address0 sc_out sc_lv 6 signal 5 } 
	{ glPLSlice0_V_1_ce0 sc_out sc_logic 1 signal 5 } 
	{ glPLSlice0_V_1_we0 sc_out sc_logic 1 signal 5 } 
	{ glPLSlice0_V_1_d0 sc_out sc_lv 180 signal 5 } 
	{ glPLSlice0_V_1_q0 sc_in sc_lv 180 signal 5 } 
	{ glPLSlice0_V_2_address0 sc_out sc_lv 6 signal 6 } 
	{ glPLSlice0_V_2_ce0 sc_out sc_logic 1 signal 6 } 
	{ glPLSlice0_V_2_we0 sc_out sc_logic 1 signal 6 } 
	{ glPLSlice0_V_2_d0 sc_out sc_lv 180 signal 6 } 
	{ glPLSlice0_V_2_q0 sc_in sc_lv 180 signal 6 } 
	{ glPLSlice0_V_3_address0 sc_out sc_lv 6 signal 7 } 
	{ glPLSlice0_V_3_ce0 sc_out sc_logic 1 signal 7 } 
	{ glPLSlice0_V_3_we0 sc_out sc_logic 1 signal 7 } 
	{ glPLSlice0_V_3_d0 sc_out sc_lv 180 signal 7 } 
	{ glPLSlice0_V_3_q0 sc_in sc_lv 180 signal 7 } 
	{ glPLSlice0_V_4_address0 sc_out sc_lv 6 signal 8 } 
	{ glPLSlice0_V_4_ce0 sc_out sc_logic 1 signal 8 } 
	{ glPLSlice0_V_4_we0 sc_out sc_logic 1 signal 8 } 
	{ glPLSlice0_V_4_d0 sc_out sc_lv 180 signal 8 } 
	{ glPLSlice0_V_4_q0 sc_in sc_lv 180 signal 8 } 
	{ glPLSlice0_V_5_address0 sc_out sc_lv 6 signal 9 } 
	{ glPLSlice0_V_5_ce0 sc_out sc_logic 1 signal 9 } 
	{ glPLSlice0_V_5_we0 sc_out sc_logic 1 signal 9 } 
	{ glPLSlice0_V_5_d0 sc_out sc_lv 180 signal 9 } 
	{ glPLSlice0_V_5_q0 sc_in sc_lv 180 signal 9 } 
	{ glPLSlice0_V_6_address0 sc_out sc_lv 6 signal 10 } 
	{ glPLSlice0_V_6_ce0 sc_out sc_logic 1 signal 10 } 
	{ glPLSlice0_V_6_we0 sc_out sc_logic 1 signal 10 } 
	{ glPLSlice0_V_6_d0 sc_out sc_lv 180 signal 10 } 
	{ glPLSlice0_V_6_q0 sc_in sc_lv 180 signal 10 } 
	{ glPLSlice0_V_7_address0 sc_out sc_lv 6 signal 11 } 
	{ glPLSlice0_V_7_ce0 sc_out sc_logic 1 signal 11 } 
	{ glPLSlice0_V_7_we0 sc_out sc_logic 1 signal 11 } 
	{ glPLSlice0_V_7_d0 sc_out sc_lv 180 signal 11 } 
	{ glPLSlice0_V_7_q0 sc_in sc_lv 180 signal 11 } 
	{ glPLSlice0_V_8_address0 sc_out sc_lv 6 signal 12 } 
	{ glPLSlice0_V_8_ce0 sc_out sc_logic 1 signal 12 } 
	{ glPLSlice0_V_8_we0 sc_out sc_logic 1 signal 12 } 
	{ glPLSlice0_V_8_d0 sc_out sc_lv 180 signal 12 } 
	{ glPLSlice0_V_8_q0 sc_in sc_lv 180 signal 12 } 
	{ glPLSlice0_V_9_address0 sc_out sc_lv 6 signal 13 } 
	{ glPLSlice0_V_9_ce0 sc_out sc_logic 1 signal 13 } 
	{ glPLSlice0_V_9_we0 sc_out sc_logic 1 signal 13 } 
	{ glPLSlice0_V_9_d0 sc_out sc_lv 180 signal 13 } 
	{ glPLSlice0_V_9_q0 sc_in sc_lv 180 signal 13 } 
	{ glPLSlice0_V_10_address0 sc_out sc_lv 6 signal 14 } 
	{ glPLSlice0_V_10_ce0 sc_out sc_logic 1 signal 14 } 
	{ glPLSlice0_V_10_we0 sc_out sc_logic 1 signal 14 } 
	{ glPLSlice0_V_10_d0 sc_out sc_lv 180 signal 14 } 
	{ glPLSlice0_V_10_q0 sc_in sc_lv 180 signal 14 } 
	{ glPLSlice0_V_11_address0 sc_out sc_lv 6 signal 15 } 
	{ glPLSlice0_V_11_ce0 sc_out sc_logic 1 signal 15 } 
	{ glPLSlice0_V_11_we0 sc_out sc_logic 1 signal 15 } 
	{ glPLSlice0_V_11_d0 sc_out sc_lv 180 signal 15 } 
	{ glPLSlice0_V_11_q0 sc_in sc_lv 180 signal 15 } 
	{ glPLSlice0_V_12_address0 sc_out sc_lv 6 signal 16 } 
	{ glPLSlice0_V_12_ce0 sc_out sc_logic 1 signal 16 } 
	{ glPLSlice0_V_12_we0 sc_out sc_logic 1 signal 16 } 
	{ glPLSlice0_V_12_d0 sc_out sc_lv 180 signal 16 } 
	{ glPLSlice0_V_12_q0 sc_in sc_lv 180 signal 16 } 
	{ glPLSlice0_V_13_address0 sc_out sc_lv 6 signal 17 } 
	{ glPLSlice0_V_13_ce0 sc_out sc_logic 1 signal 17 } 
	{ glPLSlice0_V_13_we0 sc_out sc_logic 1 signal 17 } 
	{ glPLSlice0_V_13_d0 sc_out sc_lv 180 signal 17 } 
	{ glPLSlice0_V_13_q0 sc_in sc_lv 180 signal 17 } 
	{ glPLSlice0_V_14_address0 sc_out sc_lv 6 signal 18 } 
	{ glPLSlice0_V_14_ce0 sc_out sc_logic 1 signal 18 } 
	{ glPLSlice0_V_14_we0 sc_out sc_logic 1 signal 18 } 
	{ glPLSlice0_V_14_d0 sc_out sc_lv 180 signal 18 } 
	{ glPLSlice0_V_14_q0 sc_in sc_lv 180 signal 18 } 
	{ glPLSlice0_V_15_address0 sc_out sc_lv 6 signal 19 } 
	{ glPLSlice0_V_15_ce0 sc_out sc_logic 1 signal 19 } 
	{ glPLSlice0_V_15_we0 sc_out sc_logic 1 signal 19 } 
	{ glPLSlice0_V_15_d0 sc_out sc_lv 180 signal 19 } 
	{ glPLSlice0_V_15_q0 sc_in sc_lv 180 signal 19 } 
	{ glPLSlice1_V_0_address0 sc_out sc_lv 6 signal 20 } 
	{ glPLSlice1_V_0_ce0 sc_out sc_logic 1 signal 20 } 
	{ glPLSlice1_V_0_we0 sc_out sc_logic 1 signal 20 } 
	{ glPLSlice1_V_0_d0 sc_out sc_lv 180 signal 20 } 
	{ glPLSlice1_V_0_q0 sc_in sc_lv 180 signal 20 } 
	{ glPLSlice1_V_1_address0 sc_out sc_lv 6 signal 21 } 
	{ glPLSlice1_V_1_ce0 sc_out sc_logic 1 signal 21 } 
	{ glPLSlice1_V_1_we0 sc_out sc_logic 1 signal 21 } 
	{ glPLSlice1_V_1_d0 sc_out sc_lv 180 signal 21 } 
	{ glPLSlice1_V_1_q0 sc_in sc_lv 180 signal 21 } 
	{ glPLSlice1_V_2_address0 sc_out sc_lv 6 signal 22 } 
	{ glPLSlice1_V_2_ce0 sc_out sc_logic 1 signal 22 } 
	{ glPLSlice1_V_2_we0 sc_out sc_logic 1 signal 22 } 
	{ glPLSlice1_V_2_d0 sc_out sc_lv 180 signal 22 } 
	{ glPLSlice1_V_2_q0 sc_in sc_lv 180 signal 22 } 
	{ glPLSlice1_V_3_address0 sc_out sc_lv 6 signal 23 } 
	{ glPLSlice1_V_3_ce0 sc_out sc_logic 1 signal 23 } 
	{ glPLSlice1_V_3_we0 sc_out sc_logic 1 signal 23 } 
	{ glPLSlice1_V_3_d0 sc_out sc_lv 180 signal 23 } 
	{ glPLSlice1_V_3_q0 sc_in sc_lv 180 signal 23 } 
	{ glPLSlice1_V_4_address0 sc_out sc_lv 6 signal 24 } 
	{ glPLSlice1_V_4_ce0 sc_out sc_logic 1 signal 24 } 
	{ glPLSlice1_V_4_we0 sc_out sc_logic 1 signal 24 } 
	{ glPLSlice1_V_4_d0 sc_out sc_lv 180 signal 24 } 
	{ glPLSlice1_V_4_q0 sc_in sc_lv 180 signal 24 } 
	{ glPLSlice1_V_5_address0 sc_out sc_lv 6 signal 25 } 
	{ glPLSlice1_V_5_ce0 sc_out sc_logic 1 signal 25 } 
	{ glPLSlice1_V_5_we0 sc_out sc_logic 1 signal 25 } 
	{ glPLSlice1_V_5_d0 sc_out sc_lv 180 signal 25 } 
	{ glPLSlice1_V_5_q0 sc_in sc_lv 180 signal 25 } 
	{ glPLSlice1_V_6_address0 sc_out sc_lv 6 signal 26 } 
	{ glPLSlice1_V_6_ce0 sc_out sc_logic 1 signal 26 } 
	{ glPLSlice1_V_6_we0 sc_out sc_logic 1 signal 26 } 
	{ glPLSlice1_V_6_d0 sc_out sc_lv 180 signal 26 } 
	{ glPLSlice1_V_6_q0 sc_in sc_lv 180 signal 26 } 
	{ glPLSlice1_V_7_address0 sc_out sc_lv 6 signal 27 } 
	{ glPLSlice1_V_7_ce0 sc_out sc_logic 1 signal 27 } 
	{ glPLSlice1_V_7_we0 sc_out sc_logic 1 signal 27 } 
	{ glPLSlice1_V_7_d0 sc_out sc_lv 180 signal 27 } 
	{ glPLSlice1_V_7_q0 sc_in sc_lv 180 signal 27 } 
	{ glPLSlice1_V_8_address0 sc_out sc_lv 6 signal 28 } 
	{ glPLSlice1_V_8_ce0 sc_out sc_logic 1 signal 28 } 
	{ glPLSlice1_V_8_we0 sc_out sc_logic 1 signal 28 } 
	{ glPLSlice1_V_8_d0 sc_out sc_lv 180 signal 28 } 
	{ glPLSlice1_V_8_q0 sc_in sc_lv 180 signal 28 } 
	{ glPLSlice1_V_9_address0 sc_out sc_lv 6 signal 29 } 
	{ glPLSlice1_V_9_ce0 sc_out sc_logic 1 signal 29 } 
	{ glPLSlice1_V_9_we0 sc_out sc_logic 1 signal 29 } 
	{ glPLSlice1_V_9_d0 sc_out sc_lv 180 signal 29 } 
	{ glPLSlice1_V_9_q0 sc_in sc_lv 180 signal 29 } 
	{ glPLSlice1_V_10_address0 sc_out sc_lv 6 signal 30 } 
	{ glPLSlice1_V_10_ce0 sc_out sc_logic 1 signal 30 } 
	{ glPLSlice1_V_10_we0 sc_out sc_logic 1 signal 30 } 
	{ glPLSlice1_V_10_d0 sc_out sc_lv 180 signal 30 } 
	{ glPLSlice1_V_10_q0 sc_in sc_lv 180 signal 30 } 
	{ glPLSlice1_V_11_address0 sc_out sc_lv 6 signal 31 } 
	{ glPLSlice1_V_11_ce0 sc_out sc_logic 1 signal 31 } 
	{ glPLSlice1_V_11_we0 sc_out sc_logic 1 signal 31 } 
	{ glPLSlice1_V_11_d0 sc_out sc_lv 180 signal 31 } 
	{ glPLSlice1_V_11_q0 sc_in sc_lv 180 signal 31 } 
	{ glPLSlice1_V_12_address0 sc_out sc_lv 6 signal 32 } 
	{ glPLSlice1_V_12_ce0 sc_out sc_logic 1 signal 32 } 
	{ glPLSlice1_V_12_we0 sc_out sc_logic 1 signal 32 } 
	{ glPLSlice1_V_12_d0 sc_out sc_lv 180 signal 32 } 
	{ glPLSlice1_V_12_q0 sc_in sc_lv 180 signal 32 } 
	{ glPLSlice1_V_13_address0 sc_out sc_lv 6 signal 33 } 
	{ glPLSlice1_V_13_ce0 sc_out sc_logic 1 signal 33 } 
	{ glPLSlice1_V_13_we0 sc_out sc_logic 1 signal 33 } 
	{ glPLSlice1_V_13_d0 sc_out sc_lv 180 signal 33 } 
	{ glPLSlice1_V_13_q0 sc_in sc_lv 180 signal 33 } 
	{ glPLSlice1_V_14_address0 sc_out sc_lv 6 signal 34 } 
	{ glPLSlice1_V_14_ce0 sc_out sc_logic 1 signal 34 } 
	{ glPLSlice1_V_14_we0 sc_out sc_logic 1 signal 34 } 
	{ glPLSlice1_V_14_d0 sc_out sc_lv 180 signal 34 } 
	{ glPLSlice1_V_14_q0 sc_in sc_lv 180 signal 34 } 
	{ glPLSlice1_V_15_address0 sc_out sc_lv 6 signal 35 } 
	{ glPLSlice1_V_15_ce0 sc_out sc_logic 1 signal 35 } 
	{ glPLSlice1_V_15_we0 sc_out sc_logic 1 signal 35 } 
	{ glPLSlice1_V_15_d0 sc_out sc_lv 180 signal 35 } 
	{ glPLSlice1_V_15_q0 sc_in sc_lv 180 signal 35 } 
	{ glPLSlice2_V_0_address0 sc_out sc_lv 6 signal 36 } 
	{ glPLSlice2_V_0_ce0 sc_out sc_logic 1 signal 36 } 
	{ glPLSlice2_V_0_we0 sc_out sc_logic 1 signal 36 } 
	{ glPLSlice2_V_0_d0 sc_out sc_lv 180 signal 36 } 
	{ glPLSlice2_V_0_q0 sc_in sc_lv 180 signal 36 } 
	{ glPLSlice2_V_1_address0 sc_out sc_lv 6 signal 37 } 
	{ glPLSlice2_V_1_ce0 sc_out sc_logic 1 signal 37 } 
	{ glPLSlice2_V_1_we0 sc_out sc_logic 1 signal 37 } 
	{ glPLSlice2_V_1_d0 sc_out sc_lv 180 signal 37 } 
	{ glPLSlice2_V_1_q0 sc_in sc_lv 180 signal 37 } 
	{ glPLSlice2_V_2_address0 sc_out sc_lv 6 signal 38 } 
	{ glPLSlice2_V_2_ce0 sc_out sc_logic 1 signal 38 } 
	{ glPLSlice2_V_2_we0 sc_out sc_logic 1 signal 38 } 
	{ glPLSlice2_V_2_d0 sc_out sc_lv 180 signal 38 } 
	{ glPLSlice2_V_2_q0 sc_in sc_lv 180 signal 38 } 
	{ glPLSlice2_V_3_address0 sc_out sc_lv 6 signal 39 } 
	{ glPLSlice2_V_3_ce0 sc_out sc_logic 1 signal 39 } 
	{ glPLSlice2_V_3_we0 sc_out sc_logic 1 signal 39 } 
	{ glPLSlice2_V_3_d0 sc_out sc_lv 180 signal 39 } 
	{ glPLSlice2_V_3_q0 sc_in sc_lv 180 signal 39 } 
	{ glPLSlice2_V_4_address0 sc_out sc_lv 6 signal 40 } 
	{ glPLSlice2_V_4_ce0 sc_out sc_logic 1 signal 40 } 
	{ glPLSlice2_V_4_we0 sc_out sc_logic 1 signal 40 } 
	{ glPLSlice2_V_4_d0 sc_out sc_lv 180 signal 40 } 
	{ glPLSlice2_V_4_q0 sc_in sc_lv 180 signal 40 } 
	{ glPLSlice2_V_5_address0 sc_out sc_lv 6 signal 41 } 
	{ glPLSlice2_V_5_ce0 sc_out sc_logic 1 signal 41 } 
	{ glPLSlice2_V_5_we0 sc_out sc_logic 1 signal 41 } 
	{ glPLSlice2_V_5_d0 sc_out sc_lv 180 signal 41 } 
	{ glPLSlice2_V_5_q0 sc_in sc_lv 180 signal 41 } 
	{ glPLSlice2_V_6_address0 sc_out sc_lv 6 signal 42 } 
	{ glPLSlice2_V_6_ce0 sc_out sc_logic 1 signal 42 } 
	{ glPLSlice2_V_6_we0 sc_out sc_logic 1 signal 42 } 
	{ glPLSlice2_V_6_d0 sc_out sc_lv 180 signal 42 } 
	{ glPLSlice2_V_6_q0 sc_in sc_lv 180 signal 42 } 
	{ glPLSlice2_V_7_address0 sc_out sc_lv 6 signal 43 } 
	{ glPLSlice2_V_7_ce0 sc_out sc_logic 1 signal 43 } 
	{ glPLSlice2_V_7_we0 sc_out sc_logic 1 signal 43 } 
	{ glPLSlice2_V_7_d0 sc_out sc_lv 180 signal 43 } 
	{ glPLSlice2_V_7_q0 sc_in sc_lv 180 signal 43 } 
	{ glPLSlice2_V_8_address0 sc_out sc_lv 6 signal 44 } 
	{ glPLSlice2_V_8_ce0 sc_out sc_logic 1 signal 44 } 
	{ glPLSlice2_V_8_we0 sc_out sc_logic 1 signal 44 } 
	{ glPLSlice2_V_8_d0 sc_out sc_lv 180 signal 44 } 
	{ glPLSlice2_V_8_q0 sc_in sc_lv 180 signal 44 } 
	{ glPLSlice2_V_9_address0 sc_out sc_lv 6 signal 45 } 
	{ glPLSlice2_V_9_ce0 sc_out sc_logic 1 signal 45 } 
	{ glPLSlice2_V_9_we0 sc_out sc_logic 1 signal 45 } 
	{ glPLSlice2_V_9_d0 sc_out sc_lv 180 signal 45 } 
	{ glPLSlice2_V_9_q0 sc_in sc_lv 180 signal 45 } 
	{ glPLSlice2_V_10_address0 sc_out sc_lv 6 signal 46 } 
	{ glPLSlice2_V_10_ce0 sc_out sc_logic 1 signal 46 } 
	{ glPLSlice2_V_10_we0 sc_out sc_logic 1 signal 46 } 
	{ glPLSlice2_V_10_d0 sc_out sc_lv 180 signal 46 } 
	{ glPLSlice2_V_10_q0 sc_in sc_lv 180 signal 46 } 
	{ glPLSlice2_V_11_address0 sc_out sc_lv 6 signal 47 } 
	{ glPLSlice2_V_11_ce0 sc_out sc_logic 1 signal 47 } 
	{ glPLSlice2_V_11_we0 sc_out sc_logic 1 signal 47 } 
	{ glPLSlice2_V_11_d0 sc_out sc_lv 180 signal 47 } 
	{ glPLSlice2_V_11_q0 sc_in sc_lv 180 signal 47 } 
	{ glPLSlice2_V_12_address0 sc_out sc_lv 6 signal 48 } 
	{ glPLSlice2_V_12_ce0 sc_out sc_logic 1 signal 48 } 
	{ glPLSlice2_V_12_we0 sc_out sc_logic 1 signal 48 } 
	{ glPLSlice2_V_12_d0 sc_out sc_lv 180 signal 48 } 
	{ glPLSlice2_V_12_q0 sc_in sc_lv 180 signal 48 } 
	{ glPLSlice2_V_13_address0 sc_out sc_lv 6 signal 49 } 
	{ glPLSlice2_V_13_ce0 sc_out sc_logic 1 signal 49 } 
	{ glPLSlice2_V_13_we0 sc_out sc_logic 1 signal 49 } 
	{ glPLSlice2_V_13_d0 sc_out sc_lv 180 signal 49 } 
	{ glPLSlice2_V_13_q0 sc_in sc_lv 180 signal 49 } 
	{ glPLSlice2_V_14_address0 sc_out sc_lv 6 signal 50 } 
	{ glPLSlice2_V_14_ce0 sc_out sc_logic 1 signal 50 } 
	{ glPLSlice2_V_14_we0 sc_out sc_logic 1 signal 50 } 
	{ glPLSlice2_V_14_d0 sc_out sc_lv 180 signal 50 } 
	{ glPLSlice2_V_14_q0 sc_in sc_lv 180 signal 50 } 
	{ glPLSlice2_V_15_address0 sc_out sc_lv 6 signal 51 } 
	{ glPLSlice2_V_15_ce0 sc_out sc_logic 1 signal 51 } 
	{ glPLSlice2_V_15_we0 sc_out sc_logic 1 signal 51 } 
	{ glPLSlice2_V_15_d0 sc_out sc_lv 180 signal 51 } 
	{ glPLSlice2_V_15_q0 sc_in sc_lv 180 signal 51 } 
	{ ap_ce sc_in sc_logic 1 ce -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "x", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "x", "role": "default" }} , 
 	{ "name": "y", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "y", "role": "default" }} , 
 	{ "name": "pol", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "pol", "role": "default" }} , 
 	{ "name": "glPLActiveSliceIdx_V", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "glPLActiveSliceIdx_V", "role": "default" }} , 
 	{ "name": "glPLSlice0_V_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "glPLSlice0_V_0", "role": "address0" }} , 
 	{ "name": "glPLSlice0_V_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice0_V_0", "role": "ce0" }} , 
 	{ "name": "glPLSlice0_V_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice0_V_0", "role": "we0" }} , 
 	{ "name": "glPLSlice0_V_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice0_V_0", "role": "d0" }} , 
 	{ "name": "glPLSlice0_V_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice0_V_0", "role": "q0" }} , 
 	{ "name": "glPLSlice0_V_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "glPLSlice0_V_1", "role": "address0" }} , 
 	{ "name": "glPLSlice0_V_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice0_V_1", "role": "ce0" }} , 
 	{ "name": "glPLSlice0_V_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice0_V_1", "role": "we0" }} , 
 	{ "name": "glPLSlice0_V_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice0_V_1", "role": "d0" }} , 
 	{ "name": "glPLSlice0_V_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice0_V_1", "role": "q0" }} , 
 	{ "name": "glPLSlice0_V_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "glPLSlice0_V_2", "role": "address0" }} , 
 	{ "name": "glPLSlice0_V_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice0_V_2", "role": "ce0" }} , 
 	{ "name": "glPLSlice0_V_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice0_V_2", "role": "we0" }} , 
 	{ "name": "glPLSlice0_V_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice0_V_2", "role": "d0" }} , 
 	{ "name": "glPLSlice0_V_2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice0_V_2", "role": "q0" }} , 
 	{ "name": "glPLSlice0_V_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "glPLSlice0_V_3", "role": "address0" }} , 
 	{ "name": "glPLSlice0_V_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice0_V_3", "role": "ce0" }} , 
 	{ "name": "glPLSlice0_V_3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice0_V_3", "role": "we0" }} , 
 	{ "name": "glPLSlice0_V_3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice0_V_3", "role": "d0" }} , 
 	{ "name": "glPLSlice0_V_3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice0_V_3", "role": "q0" }} , 
 	{ "name": "glPLSlice0_V_4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "glPLSlice0_V_4", "role": "address0" }} , 
 	{ "name": "glPLSlice0_V_4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice0_V_4", "role": "ce0" }} , 
 	{ "name": "glPLSlice0_V_4_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice0_V_4", "role": "we0" }} , 
 	{ "name": "glPLSlice0_V_4_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice0_V_4", "role": "d0" }} , 
 	{ "name": "glPLSlice0_V_4_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice0_V_4", "role": "q0" }} , 
 	{ "name": "glPLSlice0_V_5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "glPLSlice0_V_5", "role": "address0" }} , 
 	{ "name": "glPLSlice0_V_5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice0_V_5", "role": "ce0" }} , 
 	{ "name": "glPLSlice0_V_5_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice0_V_5", "role": "we0" }} , 
 	{ "name": "glPLSlice0_V_5_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice0_V_5", "role": "d0" }} , 
 	{ "name": "glPLSlice0_V_5_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice0_V_5", "role": "q0" }} , 
 	{ "name": "glPLSlice0_V_6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "glPLSlice0_V_6", "role": "address0" }} , 
 	{ "name": "glPLSlice0_V_6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice0_V_6", "role": "ce0" }} , 
 	{ "name": "glPLSlice0_V_6_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice0_V_6", "role": "we0" }} , 
 	{ "name": "glPLSlice0_V_6_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice0_V_6", "role": "d0" }} , 
 	{ "name": "glPLSlice0_V_6_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice0_V_6", "role": "q0" }} , 
 	{ "name": "glPLSlice0_V_7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "glPLSlice0_V_7", "role": "address0" }} , 
 	{ "name": "glPLSlice0_V_7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice0_V_7", "role": "ce0" }} , 
 	{ "name": "glPLSlice0_V_7_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice0_V_7", "role": "we0" }} , 
 	{ "name": "glPLSlice0_V_7_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice0_V_7", "role": "d0" }} , 
 	{ "name": "glPLSlice0_V_7_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice0_V_7", "role": "q0" }} , 
 	{ "name": "glPLSlice0_V_8_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "glPLSlice0_V_8", "role": "address0" }} , 
 	{ "name": "glPLSlice0_V_8_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice0_V_8", "role": "ce0" }} , 
 	{ "name": "glPLSlice0_V_8_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice0_V_8", "role": "we0" }} , 
 	{ "name": "glPLSlice0_V_8_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice0_V_8", "role": "d0" }} , 
 	{ "name": "glPLSlice0_V_8_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice0_V_8", "role": "q0" }} , 
 	{ "name": "glPLSlice0_V_9_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "glPLSlice0_V_9", "role": "address0" }} , 
 	{ "name": "glPLSlice0_V_9_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice0_V_9", "role": "ce0" }} , 
 	{ "name": "glPLSlice0_V_9_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice0_V_9", "role": "we0" }} , 
 	{ "name": "glPLSlice0_V_9_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice0_V_9", "role": "d0" }} , 
 	{ "name": "glPLSlice0_V_9_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice0_V_9", "role": "q0" }} , 
 	{ "name": "glPLSlice0_V_10_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "glPLSlice0_V_10", "role": "address0" }} , 
 	{ "name": "glPLSlice0_V_10_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice0_V_10", "role": "ce0" }} , 
 	{ "name": "glPLSlice0_V_10_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice0_V_10", "role": "we0" }} , 
 	{ "name": "glPLSlice0_V_10_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice0_V_10", "role": "d0" }} , 
 	{ "name": "glPLSlice0_V_10_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice0_V_10", "role": "q0" }} , 
 	{ "name": "glPLSlice0_V_11_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "glPLSlice0_V_11", "role": "address0" }} , 
 	{ "name": "glPLSlice0_V_11_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice0_V_11", "role": "ce0" }} , 
 	{ "name": "glPLSlice0_V_11_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice0_V_11", "role": "we0" }} , 
 	{ "name": "glPLSlice0_V_11_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice0_V_11", "role": "d0" }} , 
 	{ "name": "glPLSlice0_V_11_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice0_V_11", "role": "q0" }} , 
 	{ "name": "glPLSlice0_V_12_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "glPLSlice0_V_12", "role": "address0" }} , 
 	{ "name": "glPLSlice0_V_12_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice0_V_12", "role": "ce0" }} , 
 	{ "name": "glPLSlice0_V_12_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice0_V_12", "role": "we0" }} , 
 	{ "name": "glPLSlice0_V_12_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice0_V_12", "role": "d0" }} , 
 	{ "name": "glPLSlice0_V_12_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice0_V_12", "role": "q0" }} , 
 	{ "name": "glPLSlice0_V_13_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "glPLSlice0_V_13", "role": "address0" }} , 
 	{ "name": "glPLSlice0_V_13_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice0_V_13", "role": "ce0" }} , 
 	{ "name": "glPLSlice0_V_13_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice0_V_13", "role": "we0" }} , 
 	{ "name": "glPLSlice0_V_13_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice0_V_13", "role": "d0" }} , 
 	{ "name": "glPLSlice0_V_13_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice0_V_13", "role": "q0" }} , 
 	{ "name": "glPLSlice0_V_14_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "glPLSlice0_V_14", "role": "address0" }} , 
 	{ "name": "glPLSlice0_V_14_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice0_V_14", "role": "ce0" }} , 
 	{ "name": "glPLSlice0_V_14_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice0_V_14", "role": "we0" }} , 
 	{ "name": "glPLSlice0_V_14_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice0_V_14", "role": "d0" }} , 
 	{ "name": "glPLSlice0_V_14_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice0_V_14", "role": "q0" }} , 
 	{ "name": "glPLSlice0_V_15_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "glPLSlice0_V_15", "role": "address0" }} , 
 	{ "name": "glPLSlice0_V_15_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice0_V_15", "role": "ce0" }} , 
 	{ "name": "glPLSlice0_V_15_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice0_V_15", "role": "we0" }} , 
 	{ "name": "glPLSlice0_V_15_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice0_V_15", "role": "d0" }} , 
 	{ "name": "glPLSlice0_V_15_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice0_V_15", "role": "q0" }} , 
 	{ "name": "glPLSlice1_V_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "glPLSlice1_V_0", "role": "address0" }} , 
 	{ "name": "glPLSlice1_V_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice1_V_0", "role": "ce0" }} , 
 	{ "name": "glPLSlice1_V_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice1_V_0", "role": "we0" }} , 
 	{ "name": "glPLSlice1_V_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice1_V_0", "role": "d0" }} , 
 	{ "name": "glPLSlice1_V_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice1_V_0", "role": "q0" }} , 
 	{ "name": "glPLSlice1_V_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "glPLSlice1_V_1", "role": "address0" }} , 
 	{ "name": "glPLSlice1_V_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice1_V_1", "role": "ce0" }} , 
 	{ "name": "glPLSlice1_V_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice1_V_1", "role": "we0" }} , 
 	{ "name": "glPLSlice1_V_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice1_V_1", "role": "d0" }} , 
 	{ "name": "glPLSlice1_V_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice1_V_1", "role": "q0" }} , 
 	{ "name": "glPLSlice1_V_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "glPLSlice1_V_2", "role": "address0" }} , 
 	{ "name": "glPLSlice1_V_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice1_V_2", "role": "ce0" }} , 
 	{ "name": "glPLSlice1_V_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice1_V_2", "role": "we0" }} , 
 	{ "name": "glPLSlice1_V_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice1_V_2", "role": "d0" }} , 
 	{ "name": "glPLSlice1_V_2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice1_V_2", "role": "q0" }} , 
 	{ "name": "glPLSlice1_V_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "glPLSlice1_V_3", "role": "address0" }} , 
 	{ "name": "glPLSlice1_V_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice1_V_3", "role": "ce0" }} , 
 	{ "name": "glPLSlice1_V_3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice1_V_3", "role": "we0" }} , 
 	{ "name": "glPLSlice1_V_3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice1_V_3", "role": "d0" }} , 
 	{ "name": "glPLSlice1_V_3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice1_V_3", "role": "q0" }} , 
 	{ "name": "glPLSlice1_V_4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "glPLSlice1_V_4", "role": "address0" }} , 
 	{ "name": "glPLSlice1_V_4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice1_V_4", "role": "ce0" }} , 
 	{ "name": "glPLSlice1_V_4_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice1_V_4", "role": "we0" }} , 
 	{ "name": "glPLSlice1_V_4_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice1_V_4", "role": "d0" }} , 
 	{ "name": "glPLSlice1_V_4_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice1_V_4", "role": "q0" }} , 
 	{ "name": "glPLSlice1_V_5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "glPLSlice1_V_5", "role": "address0" }} , 
 	{ "name": "glPLSlice1_V_5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice1_V_5", "role": "ce0" }} , 
 	{ "name": "glPLSlice1_V_5_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice1_V_5", "role": "we0" }} , 
 	{ "name": "glPLSlice1_V_5_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice1_V_5", "role": "d0" }} , 
 	{ "name": "glPLSlice1_V_5_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice1_V_5", "role": "q0" }} , 
 	{ "name": "glPLSlice1_V_6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "glPLSlice1_V_6", "role": "address0" }} , 
 	{ "name": "glPLSlice1_V_6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice1_V_6", "role": "ce0" }} , 
 	{ "name": "glPLSlice1_V_6_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice1_V_6", "role": "we0" }} , 
 	{ "name": "glPLSlice1_V_6_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice1_V_6", "role": "d0" }} , 
 	{ "name": "glPLSlice1_V_6_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice1_V_6", "role": "q0" }} , 
 	{ "name": "glPLSlice1_V_7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "glPLSlice1_V_7", "role": "address0" }} , 
 	{ "name": "glPLSlice1_V_7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice1_V_7", "role": "ce0" }} , 
 	{ "name": "glPLSlice1_V_7_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice1_V_7", "role": "we0" }} , 
 	{ "name": "glPLSlice1_V_7_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice1_V_7", "role": "d0" }} , 
 	{ "name": "glPLSlice1_V_7_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice1_V_7", "role": "q0" }} , 
 	{ "name": "glPLSlice1_V_8_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "glPLSlice1_V_8", "role": "address0" }} , 
 	{ "name": "glPLSlice1_V_8_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice1_V_8", "role": "ce0" }} , 
 	{ "name": "glPLSlice1_V_8_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice1_V_8", "role": "we0" }} , 
 	{ "name": "glPLSlice1_V_8_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice1_V_8", "role": "d0" }} , 
 	{ "name": "glPLSlice1_V_8_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice1_V_8", "role": "q0" }} , 
 	{ "name": "glPLSlice1_V_9_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "glPLSlice1_V_9", "role": "address0" }} , 
 	{ "name": "glPLSlice1_V_9_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice1_V_9", "role": "ce0" }} , 
 	{ "name": "glPLSlice1_V_9_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice1_V_9", "role": "we0" }} , 
 	{ "name": "glPLSlice1_V_9_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice1_V_9", "role": "d0" }} , 
 	{ "name": "glPLSlice1_V_9_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice1_V_9", "role": "q0" }} , 
 	{ "name": "glPLSlice1_V_10_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "glPLSlice1_V_10", "role": "address0" }} , 
 	{ "name": "glPLSlice1_V_10_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice1_V_10", "role": "ce0" }} , 
 	{ "name": "glPLSlice1_V_10_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice1_V_10", "role": "we0" }} , 
 	{ "name": "glPLSlice1_V_10_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice1_V_10", "role": "d0" }} , 
 	{ "name": "glPLSlice1_V_10_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice1_V_10", "role": "q0" }} , 
 	{ "name": "glPLSlice1_V_11_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "glPLSlice1_V_11", "role": "address0" }} , 
 	{ "name": "glPLSlice1_V_11_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice1_V_11", "role": "ce0" }} , 
 	{ "name": "glPLSlice1_V_11_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice1_V_11", "role": "we0" }} , 
 	{ "name": "glPLSlice1_V_11_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice1_V_11", "role": "d0" }} , 
 	{ "name": "glPLSlice1_V_11_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice1_V_11", "role": "q0" }} , 
 	{ "name": "glPLSlice1_V_12_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "glPLSlice1_V_12", "role": "address0" }} , 
 	{ "name": "glPLSlice1_V_12_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice1_V_12", "role": "ce0" }} , 
 	{ "name": "glPLSlice1_V_12_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice1_V_12", "role": "we0" }} , 
 	{ "name": "glPLSlice1_V_12_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice1_V_12", "role": "d0" }} , 
 	{ "name": "glPLSlice1_V_12_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice1_V_12", "role": "q0" }} , 
 	{ "name": "glPLSlice1_V_13_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "glPLSlice1_V_13", "role": "address0" }} , 
 	{ "name": "glPLSlice1_V_13_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice1_V_13", "role": "ce0" }} , 
 	{ "name": "glPLSlice1_V_13_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice1_V_13", "role": "we0" }} , 
 	{ "name": "glPLSlice1_V_13_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice1_V_13", "role": "d0" }} , 
 	{ "name": "glPLSlice1_V_13_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice1_V_13", "role": "q0" }} , 
 	{ "name": "glPLSlice1_V_14_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "glPLSlice1_V_14", "role": "address0" }} , 
 	{ "name": "glPLSlice1_V_14_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice1_V_14", "role": "ce0" }} , 
 	{ "name": "glPLSlice1_V_14_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice1_V_14", "role": "we0" }} , 
 	{ "name": "glPLSlice1_V_14_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice1_V_14", "role": "d0" }} , 
 	{ "name": "glPLSlice1_V_14_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice1_V_14", "role": "q0" }} , 
 	{ "name": "glPLSlice1_V_15_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "glPLSlice1_V_15", "role": "address0" }} , 
 	{ "name": "glPLSlice1_V_15_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice1_V_15", "role": "ce0" }} , 
 	{ "name": "glPLSlice1_V_15_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice1_V_15", "role": "we0" }} , 
 	{ "name": "glPLSlice1_V_15_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice1_V_15", "role": "d0" }} , 
 	{ "name": "glPLSlice1_V_15_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice1_V_15", "role": "q0" }} , 
 	{ "name": "glPLSlice2_V_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "glPLSlice2_V_0", "role": "address0" }} , 
 	{ "name": "glPLSlice2_V_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice2_V_0", "role": "ce0" }} , 
 	{ "name": "glPLSlice2_V_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice2_V_0", "role": "we0" }} , 
 	{ "name": "glPLSlice2_V_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice2_V_0", "role": "d0" }} , 
 	{ "name": "glPLSlice2_V_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice2_V_0", "role": "q0" }} , 
 	{ "name": "glPLSlice2_V_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "glPLSlice2_V_1", "role": "address0" }} , 
 	{ "name": "glPLSlice2_V_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice2_V_1", "role": "ce0" }} , 
 	{ "name": "glPLSlice2_V_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice2_V_1", "role": "we0" }} , 
 	{ "name": "glPLSlice2_V_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice2_V_1", "role": "d0" }} , 
 	{ "name": "glPLSlice2_V_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice2_V_1", "role": "q0" }} , 
 	{ "name": "glPLSlice2_V_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "glPLSlice2_V_2", "role": "address0" }} , 
 	{ "name": "glPLSlice2_V_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice2_V_2", "role": "ce0" }} , 
 	{ "name": "glPLSlice2_V_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice2_V_2", "role": "we0" }} , 
 	{ "name": "glPLSlice2_V_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice2_V_2", "role": "d0" }} , 
 	{ "name": "glPLSlice2_V_2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice2_V_2", "role": "q0" }} , 
 	{ "name": "glPLSlice2_V_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "glPLSlice2_V_3", "role": "address0" }} , 
 	{ "name": "glPLSlice2_V_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice2_V_3", "role": "ce0" }} , 
 	{ "name": "glPLSlice2_V_3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice2_V_3", "role": "we0" }} , 
 	{ "name": "glPLSlice2_V_3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice2_V_3", "role": "d0" }} , 
 	{ "name": "glPLSlice2_V_3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice2_V_3", "role": "q0" }} , 
 	{ "name": "glPLSlice2_V_4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "glPLSlice2_V_4", "role": "address0" }} , 
 	{ "name": "glPLSlice2_V_4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice2_V_4", "role": "ce0" }} , 
 	{ "name": "glPLSlice2_V_4_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice2_V_4", "role": "we0" }} , 
 	{ "name": "glPLSlice2_V_4_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice2_V_4", "role": "d0" }} , 
 	{ "name": "glPLSlice2_V_4_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice2_V_4", "role": "q0" }} , 
 	{ "name": "glPLSlice2_V_5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "glPLSlice2_V_5", "role": "address0" }} , 
 	{ "name": "glPLSlice2_V_5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice2_V_5", "role": "ce0" }} , 
 	{ "name": "glPLSlice2_V_5_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice2_V_5", "role": "we0" }} , 
 	{ "name": "glPLSlice2_V_5_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice2_V_5", "role": "d0" }} , 
 	{ "name": "glPLSlice2_V_5_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice2_V_5", "role": "q0" }} , 
 	{ "name": "glPLSlice2_V_6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "glPLSlice2_V_6", "role": "address0" }} , 
 	{ "name": "glPLSlice2_V_6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice2_V_6", "role": "ce0" }} , 
 	{ "name": "glPLSlice2_V_6_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice2_V_6", "role": "we0" }} , 
 	{ "name": "glPLSlice2_V_6_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice2_V_6", "role": "d0" }} , 
 	{ "name": "glPLSlice2_V_6_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice2_V_6", "role": "q0" }} , 
 	{ "name": "glPLSlice2_V_7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "glPLSlice2_V_7", "role": "address0" }} , 
 	{ "name": "glPLSlice2_V_7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice2_V_7", "role": "ce0" }} , 
 	{ "name": "glPLSlice2_V_7_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice2_V_7", "role": "we0" }} , 
 	{ "name": "glPLSlice2_V_7_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice2_V_7", "role": "d0" }} , 
 	{ "name": "glPLSlice2_V_7_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice2_V_7", "role": "q0" }} , 
 	{ "name": "glPLSlice2_V_8_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "glPLSlice2_V_8", "role": "address0" }} , 
 	{ "name": "glPLSlice2_V_8_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice2_V_8", "role": "ce0" }} , 
 	{ "name": "glPLSlice2_V_8_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice2_V_8", "role": "we0" }} , 
 	{ "name": "glPLSlice2_V_8_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice2_V_8", "role": "d0" }} , 
 	{ "name": "glPLSlice2_V_8_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice2_V_8", "role": "q0" }} , 
 	{ "name": "glPLSlice2_V_9_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "glPLSlice2_V_9", "role": "address0" }} , 
 	{ "name": "glPLSlice2_V_9_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice2_V_9", "role": "ce0" }} , 
 	{ "name": "glPLSlice2_V_9_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice2_V_9", "role": "we0" }} , 
 	{ "name": "glPLSlice2_V_9_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice2_V_9", "role": "d0" }} , 
 	{ "name": "glPLSlice2_V_9_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice2_V_9", "role": "q0" }} , 
 	{ "name": "glPLSlice2_V_10_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "glPLSlice2_V_10", "role": "address0" }} , 
 	{ "name": "glPLSlice2_V_10_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice2_V_10", "role": "ce0" }} , 
 	{ "name": "glPLSlice2_V_10_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice2_V_10", "role": "we0" }} , 
 	{ "name": "glPLSlice2_V_10_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice2_V_10", "role": "d0" }} , 
 	{ "name": "glPLSlice2_V_10_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice2_V_10", "role": "q0" }} , 
 	{ "name": "glPLSlice2_V_11_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "glPLSlice2_V_11", "role": "address0" }} , 
 	{ "name": "glPLSlice2_V_11_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice2_V_11", "role": "ce0" }} , 
 	{ "name": "glPLSlice2_V_11_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice2_V_11", "role": "we0" }} , 
 	{ "name": "glPLSlice2_V_11_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice2_V_11", "role": "d0" }} , 
 	{ "name": "glPLSlice2_V_11_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice2_V_11", "role": "q0" }} , 
 	{ "name": "glPLSlice2_V_12_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "glPLSlice2_V_12", "role": "address0" }} , 
 	{ "name": "glPLSlice2_V_12_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice2_V_12", "role": "ce0" }} , 
 	{ "name": "glPLSlice2_V_12_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice2_V_12", "role": "we0" }} , 
 	{ "name": "glPLSlice2_V_12_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice2_V_12", "role": "d0" }} , 
 	{ "name": "glPLSlice2_V_12_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice2_V_12", "role": "q0" }} , 
 	{ "name": "glPLSlice2_V_13_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "glPLSlice2_V_13", "role": "address0" }} , 
 	{ "name": "glPLSlice2_V_13_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice2_V_13", "role": "ce0" }} , 
 	{ "name": "glPLSlice2_V_13_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice2_V_13", "role": "we0" }} , 
 	{ "name": "glPLSlice2_V_13_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice2_V_13", "role": "d0" }} , 
 	{ "name": "glPLSlice2_V_13_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice2_V_13", "role": "q0" }} , 
 	{ "name": "glPLSlice2_V_14_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "glPLSlice2_V_14", "role": "address0" }} , 
 	{ "name": "glPLSlice2_V_14_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice2_V_14", "role": "ce0" }} , 
 	{ "name": "glPLSlice2_V_14_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice2_V_14", "role": "we0" }} , 
 	{ "name": "glPLSlice2_V_14_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice2_V_14", "role": "d0" }} , 
 	{ "name": "glPLSlice2_V_14_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice2_V_14", "role": "q0" }} , 
 	{ "name": "glPLSlice2_V_15_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "glPLSlice2_V_15", "role": "address0" }} , 
 	{ "name": "glPLSlice2_V_15_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice2_V_15", "role": "ce0" }} , 
 	{ "name": "glPLSlice2_V_15_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlice2_V_15", "role": "we0" }} , 
 	{ "name": "glPLSlice2_V_15_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice2_V_15", "role": "d0" }} , 
 	{ "name": "glPLSlice2_V_15_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":180, "type": "signal", "bundle":{"name": "glPLSlice2_V_15", "role": "q0" }} , 
 	{ "name": "ap_ce", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "ce", "bundle":{"name": "ap_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3"],
		"CDFG" : "accumulateHW",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "2",
		"VariableLatency" : "0", "ExactLatency" : "1", "EstimateLatencyMin" : "1", "EstimateLatencyMax" : "1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "1",
		"InDataflowNetwork" : "0",
		"Port" : [
			{"Name" : "x", "Type" : "None", "Direction" : "I"},
			{"Name" : "y", "Type" : "None", "Direction" : "I"},
			{"Name" : "pol", "Type" : "None", "Direction" : "I"},
			{"Name" : "glPLActiveSliceIdx_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "glPLSlice0_V_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice0_V_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice0_V_2", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice0_V_3", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice0_V_4", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice0_V_5", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice0_V_6", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice0_V_7", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice0_V_8", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice0_V_9", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice0_V_10", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice0_V_11", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice0_V_12", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice0_V_13", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice0_V_14", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice0_V_15", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice1_V_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice1_V_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice1_V_2", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice1_V_3", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice1_V_4", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice1_V_5", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice1_V_6", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice1_V_7", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice1_V_8", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice1_V_9", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice1_V_10", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice1_V_11", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice1_V_12", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice1_V_13", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice1_V_14", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice1_V_15", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice2_V_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice2_V_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice2_V_2", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice2_V_3", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice2_V_4", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice2_V_5", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice2_V_6", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice2_V_7", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice2_V_8", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice2_V_9", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice2_V_10", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice2_V_11", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice2_V_12", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice2_V_13", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice2_V_14", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice2_V_15", "Type" : "Memory", "Direction" : "IO"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.parseEvents_mux_1bkb_U1", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.parseEvents_mux_1bkb_U2", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.parseEvents_mux_1bkb_U3", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	accumulateHW {
		x {Type I LastRead 0 FirstWrite -1}
		y {Type I LastRead 0 FirstWrite -1}
		pol {Type I LastRead 0 FirstWrite -1}
		glPLActiveSliceIdx_V {Type I LastRead 0 FirstWrite -1}
		glPLSlice0_V_0 {Type IO LastRead 0 FirstWrite 1}
		glPLSlice0_V_1 {Type IO LastRead 0 FirstWrite 1}
		glPLSlice0_V_2 {Type IO LastRead 0 FirstWrite 1}
		glPLSlice0_V_3 {Type IO LastRead 0 FirstWrite 1}
		glPLSlice0_V_4 {Type IO LastRead 0 FirstWrite 1}
		glPLSlice0_V_5 {Type IO LastRead 0 FirstWrite 1}
		glPLSlice0_V_6 {Type IO LastRead 0 FirstWrite 1}
		glPLSlice0_V_7 {Type IO LastRead 0 FirstWrite 1}
		glPLSlice0_V_8 {Type IO LastRead 0 FirstWrite 1}
		glPLSlice0_V_9 {Type IO LastRead 0 FirstWrite 1}
		glPLSlice0_V_10 {Type IO LastRead 0 FirstWrite 1}
		glPLSlice0_V_11 {Type IO LastRead 0 FirstWrite 1}
		glPLSlice0_V_12 {Type IO LastRead 0 FirstWrite 1}
		glPLSlice0_V_13 {Type IO LastRead 0 FirstWrite 1}
		glPLSlice0_V_14 {Type IO LastRead 0 FirstWrite 1}
		glPLSlice0_V_15 {Type IO LastRead 0 FirstWrite 1}
		glPLSlice1_V_0 {Type IO LastRead 0 FirstWrite 1}
		glPLSlice1_V_1 {Type IO LastRead 0 FirstWrite 1}
		glPLSlice1_V_2 {Type IO LastRead 0 FirstWrite 1}
		glPLSlice1_V_3 {Type IO LastRead 0 FirstWrite 1}
		glPLSlice1_V_4 {Type IO LastRead 0 FirstWrite 1}
		glPLSlice1_V_5 {Type IO LastRead 0 FirstWrite 1}
		glPLSlice1_V_6 {Type IO LastRead 0 FirstWrite 1}
		glPLSlice1_V_7 {Type IO LastRead 0 FirstWrite 1}
		glPLSlice1_V_8 {Type IO LastRead 0 FirstWrite 1}
		glPLSlice1_V_9 {Type IO LastRead 0 FirstWrite 1}
		glPLSlice1_V_10 {Type IO LastRead 0 FirstWrite 1}
		glPLSlice1_V_11 {Type IO LastRead 0 FirstWrite 1}
		glPLSlice1_V_12 {Type IO LastRead 0 FirstWrite 1}
		glPLSlice1_V_13 {Type IO LastRead 0 FirstWrite 1}
		glPLSlice1_V_14 {Type IO LastRead 0 FirstWrite 1}
		glPLSlice1_V_15 {Type IO LastRead 0 FirstWrite 1}
		glPLSlice2_V_0 {Type IO LastRead 0 FirstWrite 1}
		glPLSlice2_V_1 {Type IO LastRead 0 FirstWrite 1}
		glPLSlice2_V_2 {Type IO LastRead 0 FirstWrite 1}
		glPLSlice2_V_3 {Type IO LastRead 0 FirstWrite 1}
		glPLSlice2_V_4 {Type IO LastRead 0 FirstWrite 1}
		glPLSlice2_V_5 {Type IO LastRead 0 FirstWrite 1}
		glPLSlice2_V_6 {Type IO LastRead 0 FirstWrite 1}
		glPLSlice2_V_7 {Type IO LastRead 0 FirstWrite 1}
		glPLSlice2_V_8 {Type IO LastRead 0 FirstWrite 1}
		glPLSlice2_V_9 {Type IO LastRead 0 FirstWrite 1}
		glPLSlice2_V_10 {Type IO LastRead 0 FirstWrite 1}
		glPLSlice2_V_11 {Type IO LastRead 0 FirstWrite 1}
		glPLSlice2_V_12 {Type IO LastRead 0 FirstWrite 1}
		glPLSlice2_V_13 {Type IO LastRead 0 FirstWrite 1}
		glPLSlice2_V_14 {Type IO LastRead 0 FirstWrite 1}
		glPLSlice2_V_15 {Type IO LastRead 0 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "1"}
	, {"Name" : "Interval", "Min" : "2", "Max" : "2"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	x { ap_none {  { x in_data 0 10 } } }
	y { ap_none {  { y in_data 0 9 } } }
	pol { ap_none {  { pol in_data 0 1 } } }
	glPLActiveSliceIdx_V { ap_none {  { glPLActiveSliceIdx_V in_data 0 2 } } }
	glPLSlice0_V_0 { ap_memory {  { glPLSlice0_V_0_address0 mem_address 1 6 }  { glPLSlice0_V_0_ce0 mem_ce 1 1 }  { glPLSlice0_V_0_we0 mem_we 1 1 }  { glPLSlice0_V_0_d0 mem_din 1 180 }  { glPLSlice0_V_0_q0 mem_dout 0 180 } } }
	glPLSlice0_V_1 { ap_memory {  { glPLSlice0_V_1_address0 mem_address 1 6 }  { glPLSlice0_V_1_ce0 mem_ce 1 1 }  { glPLSlice0_V_1_we0 mem_we 1 1 }  { glPLSlice0_V_1_d0 mem_din 1 180 }  { glPLSlice0_V_1_q0 mem_dout 0 180 } } }
	glPLSlice0_V_2 { ap_memory {  { glPLSlice0_V_2_address0 mem_address 1 6 }  { glPLSlice0_V_2_ce0 mem_ce 1 1 }  { glPLSlice0_V_2_we0 mem_we 1 1 }  { glPLSlice0_V_2_d0 mem_din 1 180 }  { glPLSlice0_V_2_q0 mem_dout 0 180 } } }
	glPLSlice0_V_3 { ap_memory {  { glPLSlice0_V_3_address0 mem_address 1 6 }  { glPLSlice0_V_3_ce0 mem_ce 1 1 }  { glPLSlice0_V_3_we0 mem_we 1 1 }  { glPLSlice0_V_3_d0 mem_din 1 180 }  { glPLSlice0_V_3_q0 mem_dout 0 180 } } }
	glPLSlice0_V_4 { ap_memory {  { glPLSlice0_V_4_address0 mem_address 1 6 }  { glPLSlice0_V_4_ce0 mem_ce 1 1 }  { glPLSlice0_V_4_we0 mem_we 1 1 }  { glPLSlice0_V_4_d0 mem_din 1 180 }  { glPLSlice0_V_4_q0 mem_dout 0 180 } } }
	glPLSlice0_V_5 { ap_memory {  { glPLSlice0_V_5_address0 mem_address 1 6 }  { glPLSlice0_V_5_ce0 mem_ce 1 1 }  { glPLSlice0_V_5_we0 mem_we 1 1 }  { glPLSlice0_V_5_d0 mem_din 1 180 }  { glPLSlice0_V_5_q0 mem_dout 0 180 } } }
	glPLSlice0_V_6 { ap_memory {  { glPLSlice0_V_6_address0 mem_address 1 6 }  { glPLSlice0_V_6_ce0 mem_ce 1 1 }  { glPLSlice0_V_6_we0 mem_we 1 1 }  { glPLSlice0_V_6_d0 mem_din 1 180 }  { glPLSlice0_V_6_q0 mem_dout 0 180 } } }
	glPLSlice0_V_7 { ap_memory {  { glPLSlice0_V_7_address0 mem_address 1 6 }  { glPLSlice0_V_7_ce0 mem_ce 1 1 }  { glPLSlice0_V_7_we0 mem_we 1 1 }  { glPLSlice0_V_7_d0 mem_din 1 180 }  { glPLSlice0_V_7_q0 mem_dout 0 180 } } }
	glPLSlice0_V_8 { ap_memory {  { glPLSlice0_V_8_address0 mem_address 1 6 }  { glPLSlice0_V_8_ce0 mem_ce 1 1 }  { glPLSlice0_V_8_we0 mem_we 1 1 }  { glPLSlice0_V_8_d0 mem_din 1 180 }  { glPLSlice0_V_8_q0 mem_dout 0 180 } } }
	glPLSlice0_V_9 { ap_memory {  { glPLSlice0_V_9_address0 mem_address 1 6 }  { glPLSlice0_V_9_ce0 mem_ce 1 1 }  { glPLSlice0_V_9_we0 mem_we 1 1 }  { glPLSlice0_V_9_d0 mem_din 1 180 }  { glPLSlice0_V_9_q0 mem_dout 0 180 } } }
	glPLSlice0_V_10 { ap_memory {  { glPLSlice0_V_10_address0 mem_address 1 6 }  { glPLSlice0_V_10_ce0 mem_ce 1 1 }  { glPLSlice0_V_10_we0 mem_we 1 1 }  { glPLSlice0_V_10_d0 mem_din 1 180 }  { glPLSlice0_V_10_q0 mem_dout 0 180 } } }
	glPLSlice0_V_11 { ap_memory {  { glPLSlice0_V_11_address0 mem_address 1 6 }  { glPLSlice0_V_11_ce0 mem_ce 1 1 }  { glPLSlice0_V_11_we0 mem_we 1 1 }  { glPLSlice0_V_11_d0 mem_din 1 180 }  { glPLSlice0_V_11_q0 mem_dout 0 180 } } }
	glPLSlice0_V_12 { ap_memory {  { glPLSlice0_V_12_address0 mem_address 1 6 }  { glPLSlice0_V_12_ce0 mem_ce 1 1 }  { glPLSlice0_V_12_we0 mem_we 1 1 }  { glPLSlice0_V_12_d0 mem_din 1 180 }  { glPLSlice0_V_12_q0 mem_dout 0 180 } } }
	glPLSlice0_V_13 { ap_memory {  { glPLSlice0_V_13_address0 mem_address 1 6 }  { glPLSlice0_V_13_ce0 mem_ce 1 1 }  { glPLSlice0_V_13_we0 mem_we 1 1 }  { glPLSlice0_V_13_d0 mem_din 1 180 }  { glPLSlice0_V_13_q0 mem_dout 0 180 } } }
	glPLSlice0_V_14 { ap_memory {  { glPLSlice0_V_14_address0 mem_address 1 6 }  { glPLSlice0_V_14_ce0 mem_ce 1 1 }  { glPLSlice0_V_14_we0 mem_we 1 1 }  { glPLSlice0_V_14_d0 mem_din 1 180 }  { glPLSlice0_V_14_q0 mem_dout 0 180 } } }
	glPLSlice0_V_15 { ap_memory {  { glPLSlice0_V_15_address0 mem_address 1 6 }  { glPLSlice0_V_15_ce0 mem_ce 1 1 }  { glPLSlice0_V_15_we0 mem_we 1 1 }  { glPLSlice0_V_15_d0 mem_din 1 180 }  { glPLSlice0_V_15_q0 mem_dout 0 180 } } }
	glPLSlice1_V_0 { ap_memory {  { glPLSlice1_V_0_address0 mem_address 1 6 }  { glPLSlice1_V_0_ce0 mem_ce 1 1 }  { glPLSlice1_V_0_we0 mem_we 1 1 }  { glPLSlice1_V_0_d0 mem_din 1 180 }  { glPLSlice1_V_0_q0 mem_dout 0 180 } } }
	glPLSlice1_V_1 { ap_memory {  { glPLSlice1_V_1_address0 mem_address 1 6 }  { glPLSlice1_V_1_ce0 mem_ce 1 1 }  { glPLSlice1_V_1_we0 mem_we 1 1 }  { glPLSlice1_V_1_d0 mem_din 1 180 }  { glPLSlice1_V_1_q0 mem_dout 0 180 } } }
	glPLSlice1_V_2 { ap_memory {  { glPLSlice1_V_2_address0 mem_address 1 6 }  { glPLSlice1_V_2_ce0 mem_ce 1 1 }  { glPLSlice1_V_2_we0 mem_we 1 1 }  { glPLSlice1_V_2_d0 mem_din 1 180 }  { glPLSlice1_V_2_q0 mem_dout 0 180 } } }
	glPLSlice1_V_3 { ap_memory {  { glPLSlice1_V_3_address0 mem_address 1 6 }  { glPLSlice1_V_3_ce0 mem_ce 1 1 }  { glPLSlice1_V_3_we0 mem_we 1 1 }  { glPLSlice1_V_3_d0 mem_din 1 180 }  { glPLSlice1_V_3_q0 mem_dout 0 180 } } }
	glPLSlice1_V_4 { ap_memory {  { glPLSlice1_V_4_address0 mem_address 1 6 }  { glPLSlice1_V_4_ce0 mem_ce 1 1 }  { glPLSlice1_V_4_we0 mem_we 1 1 }  { glPLSlice1_V_4_d0 mem_din 1 180 }  { glPLSlice1_V_4_q0 mem_dout 0 180 } } }
	glPLSlice1_V_5 { ap_memory {  { glPLSlice1_V_5_address0 mem_address 1 6 }  { glPLSlice1_V_5_ce0 mem_ce 1 1 }  { glPLSlice1_V_5_we0 mem_we 1 1 }  { glPLSlice1_V_5_d0 mem_din 1 180 }  { glPLSlice1_V_5_q0 mem_dout 0 180 } } }
	glPLSlice1_V_6 { ap_memory {  { glPLSlice1_V_6_address0 mem_address 1 6 }  { glPLSlice1_V_6_ce0 mem_ce 1 1 }  { glPLSlice1_V_6_we0 mem_we 1 1 }  { glPLSlice1_V_6_d0 mem_din 1 180 }  { glPLSlice1_V_6_q0 mem_dout 0 180 } } }
	glPLSlice1_V_7 { ap_memory {  { glPLSlice1_V_7_address0 mem_address 1 6 }  { glPLSlice1_V_7_ce0 mem_ce 1 1 }  { glPLSlice1_V_7_we0 mem_we 1 1 }  { glPLSlice1_V_7_d0 mem_din 1 180 }  { glPLSlice1_V_7_q0 mem_dout 0 180 } } }
	glPLSlice1_V_8 { ap_memory {  { glPLSlice1_V_8_address0 mem_address 1 6 }  { glPLSlice1_V_8_ce0 mem_ce 1 1 }  { glPLSlice1_V_8_we0 mem_we 1 1 }  { glPLSlice1_V_8_d0 mem_din 1 180 }  { glPLSlice1_V_8_q0 mem_dout 0 180 } } }
	glPLSlice1_V_9 { ap_memory {  { glPLSlice1_V_9_address0 mem_address 1 6 }  { glPLSlice1_V_9_ce0 mem_ce 1 1 }  { glPLSlice1_V_9_we0 mem_we 1 1 }  { glPLSlice1_V_9_d0 mem_din 1 180 }  { glPLSlice1_V_9_q0 mem_dout 0 180 } } }
	glPLSlice1_V_10 { ap_memory {  { glPLSlice1_V_10_address0 mem_address 1 6 }  { glPLSlice1_V_10_ce0 mem_ce 1 1 }  { glPLSlice1_V_10_we0 mem_we 1 1 }  { glPLSlice1_V_10_d0 mem_din 1 180 }  { glPLSlice1_V_10_q0 mem_dout 0 180 } } }
	glPLSlice1_V_11 { ap_memory {  { glPLSlice1_V_11_address0 mem_address 1 6 }  { glPLSlice1_V_11_ce0 mem_ce 1 1 }  { glPLSlice1_V_11_we0 mem_we 1 1 }  { glPLSlice1_V_11_d0 mem_din 1 180 }  { glPLSlice1_V_11_q0 mem_dout 0 180 } } }
	glPLSlice1_V_12 { ap_memory {  { glPLSlice1_V_12_address0 mem_address 1 6 }  { glPLSlice1_V_12_ce0 mem_ce 1 1 }  { glPLSlice1_V_12_we0 mem_we 1 1 }  { glPLSlice1_V_12_d0 mem_din 1 180 }  { glPLSlice1_V_12_q0 mem_dout 0 180 } } }
	glPLSlice1_V_13 { ap_memory {  { glPLSlice1_V_13_address0 mem_address 1 6 }  { glPLSlice1_V_13_ce0 mem_ce 1 1 }  { glPLSlice1_V_13_we0 mem_we 1 1 }  { glPLSlice1_V_13_d0 mem_din 1 180 }  { glPLSlice1_V_13_q0 mem_dout 0 180 } } }
	glPLSlice1_V_14 { ap_memory {  { glPLSlice1_V_14_address0 mem_address 1 6 }  { glPLSlice1_V_14_ce0 mem_ce 1 1 }  { glPLSlice1_V_14_we0 mem_we 1 1 }  { glPLSlice1_V_14_d0 mem_din 1 180 }  { glPLSlice1_V_14_q0 mem_dout 0 180 } } }
	glPLSlice1_V_15 { ap_memory {  { glPLSlice1_V_15_address0 mem_address 1 6 }  { glPLSlice1_V_15_ce0 mem_ce 1 1 }  { glPLSlice1_V_15_we0 mem_we 1 1 }  { glPLSlice1_V_15_d0 mem_din 1 180 }  { glPLSlice1_V_15_q0 mem_dout 0 180 } } }
	glPLSlice2_V_0 { ap_memory {  { glPLSlice2_V_0_address0 mem_address 1 6 }  { glPLSlice2_V_0_ce0 mem_ce 1 1 }  { glPLSlice2_V_0_we0 mem_we 1 1 }  { glPLSlice2_V_0_d0 mem_din 1 180 }  { glPLSlice2_V_0_q0 mem_dout 0 180 } } }
	glPLSlice2_V_1 { ap_memory {  { glPLSlice2_V_1_address0 mem_address 1 6 }  { glPLSlice2_V_1_ce0 mem_ce 1 1 }  { glPLSlice2_V_1_we0 mem_we 1 1 }  { glPLSlice2_V_1_d0 mem_din 1 180 }  { glPLSlice2_V_1_q0 mem_dout 0 180 } } }
	glPLSlice2_V_2 { ap_memory {  { glPLSlice2_V_2_address0 mem_address 1 6 }  { glPLSlice2_V_2_ce0 mem_ce 1 1 }  { glPLSlice2_V_2_we0 mem_we 1 1 }  { glPLSlice2_V_2_d0 mem_din 1 180 }  { glPLSlice2_V_2_q0 mem_dout 0 180 } } }
	glPLSlice2_V_3 { ap_memory {  { glPLSlice2_V_3_address0 mem_address 1 6 }  { glPLSlice2_V_3_ce0 mem_ce 1 1 }  { glPLSlice2_V_3_we0 mem_we 1 1 }  { glPLSlice2_V_3_d0 mem_din 1 180 }  { glPLSlice2_V_3_q0 mem_dout 0 180 } } }
	glPLSlice2_V_4 { ap_memory {  { glPLSlice2_V_4_address0 mem_address 1 6 }  { glPLSlice2_V_4_ce0 mem_ce 1 1 }  { glPLSlice2_V_4_we0 mem_we 1 1 }  { glPLSlice2_V_4_d0 mem_din 1 180 }  { glPLSlice2_V_4_q0 mem_dout 0 180 } } }
	glPLSlice2_V_5 { ap_memory {  { glPLSlice2_V_5_address0 mem_address 1 6 }  { glPLSlice2_V_5_ce0 mem_ce 1 1 }  { glPLSlice2_V_5_we0 mem_we 1 1 }  { glPLSlice2_V_5_d0 mem_din 1 180 }  { glPLSlice2_V_5_q0 mem_dout 0 180 } } }
	glPLSlice2_V_6 { ap_memory {  { glPLSlice2_V_6_address0 mem_address 1 6 }  { glPLSlice2_V_6_ce0 mem_ce 1 1 }  { glPLSlice2_V_6_we0 mem_we 1 1 }  { glPLSlice2_V_6_d0 mem_din 1 180 }  { glPLSlice2_V_6_q0 mem_dout 0 180 } } }
	glPLSlice2_V_7 { ap_memory {  { glPLSlice2_V_7_address0 mem_address 1 6 }  { glPLSlice2_V_7_ce0 mem_ce 1 1 }  { glPLSlice2_V_7_we0 mem_we 1 1 }  { glPLSlice2_V_7_d0 mem_din 1 180 }  { glPLSlice2_V_7_q0 mem_dout 0 180 } } }
	glPLSlice2_V_8 { ap_memory {  { glPLSlice2_V_8_address0 mem_address 1 6 }  { glPLSlice2_V_8_ce0 mem_ce 1 1 }  { glPLSlice2_V_8_we0 mem_we 1 1 }  { glPLSlice2_V_8_d0 mem_din 1 180 }  { glPLSlice2_V_8_q0 mem_dout 0 180 } } }
	glPLSlice2_V_9 { ap_memory {  { glPLSlice2_V_9_address0 mem_address 1 6 }  { glPLSlice2_V_9_ce0 mem_ce 1 1 }  { glPLSlice2_V_9_we0 mem_we 1 1 }  { glPLSlice2_V_9_d0 mem_din 1 180 }  { glPLSlice2_V_9_q0 mem_dout 0 180 } } }
	glPLSlice2_V_10 { ap_memory {  { glPLSlice2_V_10_address0 mem_address 1 6 }  { glPLSlice2_V_10_ce0 mem_ce 1 1 }  { glPLSlice2_V_10_we0 mem_we 1 1 }  { glPLSlice2_V_10_d0 mem_din 1 180 }  { glPLSlice2_V_10_q0 mem_dout 0 180 } } }
	glPLSlice2_V_11 { ap_memory {  { glPLSlice2_V_11_address0 mem_address 1 6 }  { glPLSlice2_V_11_ce0 mem_ce 1 1 }  { glPLSlice2_V_11_we0 mem_we 1 1 }  { glPLSlice2_V_11_d0 mem_din 1 180 }  { glPLSlice2_V_11_q0 mem_dout 0 180 } } }
	glPLSlice2_V_12 { ap_memory {  { glPLSlice2_V_12_address0 mem_address 1 6 }  { glPLSlice2_V_12_ce0 mem_ce 1 1 }  { glPLSlice2_V_12_we0 mem_we 1 1 }  { glPLSlice2_V_12_d0 mem_din 1 180 }  { glPLSlice2_V_12_q0 mem_dout 0 180 } } }
	glPLSlice2_V_13 { ap_memory {  { glPLSlice2_V_13_address0 mem_address 1 6 }  { glPLSlice2_V_13_ce0 mem_ce 1 1 }  { glPLSlice2_V_13_we0 mem_we 1 1 }  { glPLSlice2_V_13_d0 mem_din 1 180 }  { glPLSlice2_V_13_q0 mem_dout 0 180 } } }
	glPLSlice2_V_14 { ap_memory {  { glPLSlice2_V_14_address0 mem_address 1 6 }  { glPLSlice2_V_14_ce0 mem_ce 1 1 }  { glPLSlice2_V_14_we0 mem_we 1 1 }  { glPLSlice2_V_14_d0 mem_din 1 180 }  { glPLSlice2_V_14_q0 mem_dout 0 180 } } }
	glPLSlice2_V_15 { ap_memory {  { glPLSlice2_V_15_address0 mem_address 1 6 }  { glPLSlice2_V_15_ce0 mem_ce 1 1 }  { glPLSlice2_V_15_we0 mem_we 1 1 }  { glPLSlice2_V_15_d0 mem_din 1 180 }  { glPLSlice2_V_15_q0 mem_dout 0 180 } } }
}
