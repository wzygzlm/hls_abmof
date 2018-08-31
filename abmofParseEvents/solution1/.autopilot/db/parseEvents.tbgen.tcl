set C_TypeInfoList {{ 
"parseEvents" : [[], { "return": [[], "void"]} , [{"ExternC" : 0}], [ {"data": [[],{ "pointer": "0"}] }, {"eventsArraySize": [[],"1"] }, {"eventSlice": [[],{ "pointer": "1"}] }],["2","3","4"],""],
 "2": [ "targetBlocks", [[], {"array": ["5", [23,23]]}],""],
 "3": [ "sum", [[],"6"],""],
 "4": [ "refBlock", [[], {"array": ["5", [23,23]]}],""], 
"5": [ "ap_int<4>", {"hls_type": {"ap_int": [[[[], {"scalar": { "int": 4}}]],""]}}], 
"6": [ "int16_t", {"typedef": [[[], {"scalar": "short"}],""]}], 
"1": [ "int32_t", {"typedef": [[[], {"scalar": "int"}],""]}], 
"0": [ "uint32_t", {"typedef": [[[], {"scalar": "unsigned int"}],""]}]
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
	{ data int 32 regular {fifo 0 volatile }  }
	{ eventsArraySize int 32 regular  }
	{ eventSlice int 32 regular {fifo 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "data", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "data","cData": "unsigned int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
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
	{ data_dout sc_in sc_lv 32 signal 0 } 
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
 	{ "name": "data_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "data", "role": "dout" }} , 
 	{ "name": "data_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data", "role": "empty_n" }} , 
 	{ "name": "data_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data", "role": "read" }} , 
 	{ "name": "eventsArraySize", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "eventsArraySize", "role": "default" }} , 
 	{ "name": "eventSlice_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "eventSlice", "role": "din" }} , 
 	{ "name": "eventSlice_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "eventSlice", "role": "full_n" }} , 
 	{ "name": "eventSlice_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "eventSlice", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5"],
		"CDFG" : "parseEvents",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "3", "EstimateLatencyMax" : "32620003",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"InDataflowNetwork" : "0",
		"WaitState" : [
			{"State" : "ap_ST_fsm_state5", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_accumulateHW_fu_186"},
			{"State" : "ap_ST_fsm_state7", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_calcOF_fu_197"}],
		"Port" : [
			{"Name" : "data", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "data_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "eventsArraySize", "Type" : "None", "Direction" : "I"},
			{"Name" : "eventSlice", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "eventSlice_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "glPLActiveSliceIdx_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "grp_accumulateHW_fu_186", "Port" : "glPLActiveSliceIdx_V"}]},
			{"Name" : "glPLTminus1SliceIdx_s", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_calcOF_fu_197", "Port" : "glPLTminus1SliceIdx_s"}]},
			{"Name" : "glPLTminus2SliceIdx_s", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_calcOF_fu_197", "Port" : "glPLTminus2SliceIdx_s"}]},
			{"Name" : "glPLSlices_V", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_calcOF_fu_197", "Port" : "glPLSlices_V"},
					{"ID" : "4", "SubInstance" : "grp_accumulateHW_fu_186", "Port" : "glPLSlices_V"}]},
			{"Name" : "refBlock_V", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_calcOF_fu_197", "Port" : "refBlock_V"}]},
			{"Name" : "targetBlocks_V", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_calcOF_fu_197", "Port" : "targetBlocks_V"}]},
			{"Name" : "sum", "Type" : "None", "Direction" : "I"},
			{"Name" : "glCnt", "Type" : "OVld", "Direction" : "IO"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.glPLSlices_V_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.refBlock_V_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.targetBlocks_V_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_accumulateHW_fu_186", "Parent" : "0",
		"CDFG" : "accumulateHW",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1", "EstimateLatencyMax" : "11",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"InDataflowNetwork" : "0",
		"Port" : [
			{"Name" : "x", "Type" : "None", "Direction" : "I"},
			{"Name" : "y", "Type" : "None", "Direction" : "I"},
			{"Name" : "pol", "Type" : "None", "Direction" : "I"},
			{"Name" : "glPLActiveSliceIdx_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "glPLSlices_V", "Type" : "Memory", "Direction" : "IO"}]},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_calcOF_fu_197", "Parent" : "0",
		"CDFG" : "calcOF",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "3244", "EstimateLatencyMax" : "3244",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"InDataflowNetwork" : "0",
		"Port" : [
			{"Name" : "x", "Type" : "None", "Direction" : "I"},
			{"Name" : "y", "Type" : "None", "Direction" : "I"},
			{"Name" : "glPLTminus1SliceIdx_s", "Type" : "None", "Direction" : "I"},
			{"Name" : "glPLTminus2SliceIdx_s", "Type" : "None", "Direction" : "I"},
			{"Name" : "glPLSlices_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "refBlock_V", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "targetBlocks_V", "Type" : "Memory", "Direction" : "O"}]}]}


set ArgLastReadFirstWriteLatency {
	parseEvents {
		data {Type I LastRead 3 FirstWrite -1}
		eventsArraySize {Type I LastRead 0 FirstWrite -1}
		eventSlice {Type O LastRead -1 FirstWrite 9}
		glPLActiveSliceIdx_V {Type IO LastRead -1 FirstWrite -1}
		glPLTminus1SliceIdx_s {Type IO LastRead -1 FirstWrite -1}
		glPLTminus2SliceIdx_s {Type IO LastRead -1 FirstWrite -1}
		glPLSlices_V {Type IO LastRead -1 FirstWrite -1}
		refBlock_V {Type IO LastRead -1 FirstWrite -1}
		targetBlocks_V {Type IO LastRead -1 FirstWrite -1}
		sum {Type I LastRead -1 FirstWrite -1}
		glCnt {Type IO LastRead -1 FirstWrite -1}}
	accumulateHW {
		x {Type I LastRead 0 FirstWrite -1}
		y {Type I LastRead 0 FirstWrite -1}
		pol {Type I LastRead 0 FirstWrite -1}
		glPLActiveSliceIdx_V {Type I LastRead 0 FirstWrite -1}
		glPLSlices_V {Type IO LastRead 0 FirstWrite 3}}
	calcOF {
		x {Type I LastRead 0 FirstWrite -1}
		y {Type I LastRead 0 FirstWrite -1}
		glPLTminus1SliceIdx_s {Type I LastRead 0 FirstWrite -1}
		glPLTminus2SliceIdx_s {Type I LastRead 0 FirstWrite -1}
		glPLSlices_V {Type I LastRead 2 FirstWrite -1}
		refBlock_V {Type O LastRead -1 FirstWrite 4}
		targetBlocks_V {Type O LastRead -1 FirstWrite 4}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "3", "Max" : "32620003"}
	, {"Name" : "Interval", "Min" : "4", "Max" : "32620004"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	data { ap_fifo {  { data_dout fifo_data 0 32 }  { data_empty_n fifo_status 0 1 }  { data_read fifo_update 1 1 } } }
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
