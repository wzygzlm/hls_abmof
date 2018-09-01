set C_TypeInfoList {{ 
"parseEvents" : [[], { "return": [[], "void"]} , [{"ExternC" : 0}], [ {"data": [[],{ "pointer": "0"}] }, {"eventsArraySize": [[],"1"] }, {"eventSlice": [[],{ "pointer": "1"}] }],[],""], 
"0": [ "uint64_t", {"typedef": [[[], {"scalar": "long long unsigned int"}],""]}], 
"1": [ "int32_t", {"typedef": [[[], {"scalar": "int"}],""]}]
}}
set moduleName parseEvents
set isTaskLevelControl 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set C_modelName {parseEvents}
set C_modelType { void 0 }
set C_modelArgList {
	{ data int 64 regular {fifo 0 volatile }  }
	{ eventsArraySize int 32 regular  }
	{ eventSlice int 32 regular {fifo 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "data", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "data","cData": "long long unsigned int","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "eventsArraySize", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "eventsArraySize","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "eventSlice", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "eventSlice","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} ]}
# RTL Port declarations: 
set portNum 13
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ data_dout sc_in sc_lv 64 signal 0 } 
	{ data_empty_n sc_in sc_logic 1 signal 0 } 
	{ data_read sc_out sc_logic 1 signal 0 } 
	{ eventsArraySize sc_in sc_lv 32 signal 1 } 
	{ eventSlice_din sc_out sc_lv 32 signal 2 } 
	{ eventSlice_full_n sc_in sc_logic 1 signal 2 } 
	{ eventSlice_write sc_out sc_logic 1 signal 2 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "data_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "data", "role": "dout" }} , 
 	{ "name": "data_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data", "role": "empty_n" }} , 
 	{ "name": "data_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data", "role": "read" }} , 
 	{ "name": "eventsArraySize", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "eventsArraySize", "role": "default" }} , 
 	{ "name": "eventSlice_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "eventSlice", "role": "din" }} , 
 	{ "name": "eventSlice_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "eventSlice", "role": "full_n" }} , 
 	{ "name": "eventSlice_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "eventSlice", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30"],
		"CDFG" : "parseEvents",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2", "EstimateLatencyMax" : "20006",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"InDataflowNetwork" : "0",
		"Port" : [
			{"Name" : "data", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "data_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "eventsArraySize", "Type" : "None", "Direction" : "I"},
			{"Name" : "eventSlice", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "eventSlice_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "glPLActiveSliceIdx_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "glPLSlice0_V_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice0_V_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice0_V_2", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice0_V_3", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice0_V_4", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice0_V_5", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice0_V_6", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice0_V_7", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice1_V_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice1_V_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice1_V_2", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice1_V_3", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice1_V_4", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice1_V_5", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice1_V_6", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice1_V_7", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice2_V_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice2_V_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice2_V_2", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice2_V_3", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice2_V_4", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice2_V_5", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice2_V_6", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glPLSlice2_V_7", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "glCnt", "Type" : "OVld", "Direction" : "IO"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.glPLSlice0_V_0_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.glPLSlice0_V_1_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.glPLSlice0_V_2_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.glPLSlice0_V_3_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.glPLSlice0_V_4_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.glPLSlice0_V_5_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.glPLSlice0_V_6_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.glPLSlice0_V_7_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.glPLSlice1_V_0_U", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.glPLSlice1_V_1_U", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.glPLSlice1_V_2_U", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.glPLSlice1_V_3_U", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.glPLSlice1_V_4_U", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.glPLSlice1_V_5_U", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.glPLSlice1_V_6_U", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.glPLSlice1_V_7_U", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.glPLSlice2_V_0_U", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.glPLSlice2_V_1_U", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.glPLSlice2_V_2_U", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.glPLSlice2_V_3_U", "Parent" : "0"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.glPLSlice2_V_4_U", "Parent" : "0"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.glPLSlice2_V_5_U", "Parent" : "0"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.glPLSlice2_V_6_U", "Parent" : "0"},
	{"ID" : "24", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.glPLSlice2_V_7_U", "Parent" : "0"},
	{"ID" : "25", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.parseEvents_mux_8zec_U1", "Parent" : "0"},
	{"ID" : "26", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.parseEvents_mux_8zec_U2", "Parent" : "0"},
	{"ID" : "27", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.parseEvents_mux_8zec_U3", "Parent" : "0"},
	{"ID" : "28", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.parseEvents_mux_8zec_U4", "Parent" : "0"},
	{"ID" : "29", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.parseEvents_mux_8zec_U5", "Parent" : "0"},
	{"ID" : "30", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.parseEvents_mux_8zec_U6", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	parseEvents {
		data {Type I LastRead 2 FirstWrite -1}
		eventsArraySize {Type I LastRead 0 FirstWrite -1}
		eventSlice {Type O LastRead -1 FirstWrite 7}
		glPLActiveSliceIdx_V {Type IO LastRead -1 FirstWrite -1}
		glPLSlice0_V_0 {Type IO LastRead -1 FirstWrite -1}
		glPLSlice0_V_1 {Type IO LastRead -1 FirstWrite -1}
		glPLSlice0_V_2 {Type IO LastRead -1 FirstWrite -1}
		glPLSlice0_V_3 {Type IO LastRead -1 FirstWrite -1}
		glPLSlice0_V_4 {Type IO LastRead -1 FirstWrite -1}
		glPLSlice0_V_5 {Type IO LastRead -1 FirstWrite -1}
		glPLSlice0_V_6 {Type IO LastRead -1 FirstWrite -1}
		glPLSlice0_V_7 {Type IO LastRead -1 FirstWrite -1}
		glPLSlice1_V_0 {Type IO LastRead -1 FirstWrite -1}
		glPLSlice1_V_1 {Type IO LastRead -1 FirstWrite -1}
		glPLSlice1_V_2 {Type IO LastRead -1 FirstWrite -1}
		glPLSlice1_V_3 {Type IO LastRead -1 FirstWrite -1}
		glPLSlice1_V_4 {Type IO LastRead -1 FirstWrite -1}
		glPLSlice1_V_5 {Type IO LastRead -1 FirstWrite -1}
		glPLSlice1_V_6 {Type IO LastRead -1 FirstWrite -1}
		glPLSlice1_V_7 {Type IO LastRead -1 FirstWrite -1}
		glPLSlice2_V_0 {Type IO LastRead -1 FirstWrite -1}
		glPLSlice2_V_1 {Type IO LastRead -1 FirstWrite -1}
		glPLSlice2_V_2 {Type IO LastRead -1 FirstWrite -1}
		glPLSlice2_V_3 {Type IO LastRead -1 FirstWrite -1}
		glPLSlice2_V_4 {Type IO LastRead -1 FirstWrite -1}
		glPLSlice2_V_5 {Type IO LastRead -1 FirstWrite -1}
		glPLSlice2_V_6 {Type IO LastRead -1 FirstWrite -1}
		glPLSlice2_V_7 {Type IO LastRead -1 FirstWrite -1}
		glCnt {Type IO LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2", "Max" : "20006"}
	, {"Name" : "Interval", "Min" : "3", "Max" : "20007"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	data { ap_fifo {  { data_dout fifo_data 0 64 }  { data_empty_n fifo_status 0 1 }  { data_read fifo_update 1 1 } } }
	eventsArraySize { ap_none {  { eventsArraySize in_data 0 32 } } }
	eventSlice { ap_fifo {  { eventSlice_din fifo_data 1 32 }  { eventSlice_full_n fifo_status 0 1 }  { eventSlice_write fifo_update 1 1 } } }
}

set busDeadlockParameterList { 
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
	data { fifo_read 1 no_conditional }
	eventSlice { fifo_write 1 no_conditional }
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
