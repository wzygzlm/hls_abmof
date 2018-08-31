set moduleName accumulateHW
set isTaskLevelControl 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set C_modelName {accumulateHW}
set C_modelType { void 0 }
set C_modelArgList {
	{ x int 16 regular  }
	{ y int 16 regular  }
	{ pol uint 1 regular  }
	{ glPLActiveSliceIdx_V int 2 regular {pointer 0} {global 0}  }
	{ glPLSlices_V int 720 regular {array 720 { 2 3 } 1 1 } {global 2}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "x", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "y", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "pol", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "glPLActiveSliceIdx_V", "interface" : "wire", "bitwidth" : 2, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "glPLSlices_V", "interface" : "memory", "bitwidth" : 720, "direction" : "READWRITE", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 15
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ x sc_in sc_lv 16 signal 0 } 
	{ y sc_in sc_lv 16 signal 1 } 
	{ pol sc_in sc_logic 1 signal 2 } 
	{ glPLActiveSliceIdx_V sc_in sc_lv 2 signal 3 } 
	{ glPLSlices_V_address0 sc_out sc_lv 10 signal 4 } 
	{ glPLSlices_V_ce0 sc_out sc_logic 1 signal 4 } 
	{ glPLSlices_V_we0 sc_out sc_logic 1 signal 4 } 
	{ glPLSlices_V_d0 sc_out sc_lv 720 signal 4 } 
	{ glPLSlices_V_q0 sc_in sc_lv 720 signal 4 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "x", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "x", "role": "default" }} , 
 	{ "name": "y", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "y", "role": "default" }} , 
 	{ "name": "pol", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "pol", "role": "default" }} , 
 	{ "name": "glPLActiveSliceIdx_V", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "glPLActiveSliceIdx_V", "role": "default" }} , 
 	{ "name": "glPLSlices_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "glPLSlices_V", "role": "address0" }} , 
 	{ "name": "glPLSlices_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_V", "role": "ce0" }} , 
 	{ "name": "glPLSlices_V_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_V", "role": "we0" }} , 
 	{ "name": "glPLSlices_V_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":720, "type": "signal", "bundle":{"name": "glPLSlices_V", "role": "d0" }} , 
 	{ "name": "glPLSlices_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":720, "type": "signal", "bundle":{"name": "glPLSlices_V", "role": "q0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
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
			{"Name" : "glPLSlices_V", "Type" : "Memory", "Direction" : "IO"}]}]}


set ArgLastReadFirstWriteLatency {
	accumulateHW {
		x {Type I LastRead 0 FirstWrite -1}
		y {Type I LastRead 0 FirstWrite -1}
		pol {Type I LastRead 0 FirstWrite -1}
		glPLActiveSliceIdx_V {Type I LastRead 0 FirstWrite -1}
		glPLSlices_V {Type IO LastRead 0 FirstWrite 3}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "11"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "11"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	x { ap_none {  { x in_data 0 16 } } }
	y { ap_none {  { y in_data 0 16 } } }
	pol { ap_none {  { pol in_data 0 1 } } }
	glPLActiveSliceIdx_V { ap_none {  { glPLActiveSliceIdx_V in_data 0 2 } } }
	glPLSlices_V { ap_memory {  { glPLSlices_V_address0 mem_address 1 10 }  { glPLSlices_V_ce0 mem_ce 1 1 }  { glPLSlices_V_we0 mem_we 1 1 }  { glPLSlices_V_d0 mem_din 1 720 }  { glPLSlices_V_q0 mem_dout 0 720 } } }
}
