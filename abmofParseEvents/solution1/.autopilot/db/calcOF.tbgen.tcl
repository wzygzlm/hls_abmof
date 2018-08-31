set moduleName calcOF
set isTaskLevelControl 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set C_modelName {calcOF}
set C_modelType { void 0 }
set C_modelArgList {
	{ x int 16 regular  }
	{ y int 16 regular  }
	{ glPLTminus1SliceIdx_s int 2 regular {pointer 0} {global 0}  }
	{ glPLTminus2SliceIdx_s int 2 regular {pointer 0} {global 0}  }
	{ glPLSlices_V int 720 regular {array 720 { 1 1 } 1 1 } {global 0}  }
	{ refBlock_V int 4 regular {array 529 { 0 3 } 0 1 } {global 1}  }
	{ targetBlocks_V int 4 regular {array 529 { 0 3 } 0 1 } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "x", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "y", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "glPLTminus1SliceIdx_s", "interface" : "wire", "bitwidth" : 2, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "glPLTminus2SliceIdx_s", "interface" : "wire", "bitwidth" : 2, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "glPLSlices_V", "interface" : "memory", "bitwidth" : 720, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "refBlock_V", "interface" : "memory", "bitwidth" : 4, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":3,"cElement": [{"cName": "refBlock.V","cData": "int4","bit_use": { "low": 0,"up": 3},"cArray": [{"low" : 0,"up" : 22,"step" : 1},{"low" : 0,"up" : 22,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "targetBlocks_V", "interface" : "memory", "bitwidth" : 4, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":3,"cElement": [{"cName": "targetBlocks.V","cData": "int4","bit_use": { "low": 0,"up": 3},"cArray": [{"low" : 0,"up" : 22,"step" : 1},{"low" : 0,"up" : 22,"step" : 1}]}]}], "extern" : 0} ]}
# RTL Port declarations: 
set portNum 24
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ x sc_in sc_lv 16 signal 0 } 
	{ y sc_in sc_lv 16 signal 1 } 
	{ glPLTminus1SliceIdx_s sc_in sc_lv 2 signal 2 } 
	{ glPLTminus2SliceIdx_s sc_in sc_lv 2 signal 3 } 
	{ glPLSlices_V_address0 sc_out sc_lv 10 signal 4 } 
	{ glPLSlices_V_ce0 sc_out sc_logic 1 signal 4 } 
	{ glPLSlices_V_q0 sc_in sc_lv 720 signal 4 } 
	{ glPLSlices_V_address1 sc_out sc_lv 10 signal 4 } 
	{ glPLSlices_V_ce1 sc_out sc_logic 1 signal 4 } 
	{ glPLSlices_V_q1 sc_in sc_lv 720 signal 4 } 
	{ refBlock_V_address0 sc_out sc_lv 10 signal 5 } 
	{ refBlock_V_ce0 sc_out sc_logic 1 signal 5 } 
	{ refBlock_V_we0 sc_out sc_logic 1 signal 5 } 
	{ refBlock_V_d0 sc_out sc_lv 4 signal 5 } 
	{ targetBlocks_V_address0 sc_out sc_lv 10 signal 6 } 
	{ targetBlocks_V_ce0 sc_out sc_logic 1 signal 6 } 
	{ targetBlocks_V_we0 sc_out sc_logic 1 signal 6 } 
	{ targetBlocks_V_d0 sc_out sc_lv 4 signal 6 } 
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
 	{ "name": "glPLTminus1SliceIdx_s", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "glPLTminus1SliceIdx_s", "role": "default" }} , 
 	{ "name": "glPLTminus2SliceIdx_s", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "glPLTminus2SliceIdx_s", "role": "default" }} , 
 	{ "name": "glPLSlices_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "glPLSlices_V", "role": "address0" }} , 
 	{ "name": "glPLSlices_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_V", "role": "ce0" }} , 
 	{ "name": "glPLSlices_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":720, "type": "signal", "bundle":{"name": "glPLSlices_V", "role": "q0" }} , 
 	{ "name": "glPLSlices_V_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "glPLSlices_V", "role": "address1" }} , 
 	{ "name": "glPLSlices_V_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "glPLSlices_V", "role": "ce1" }} , 
 	{ "name": "glPLSlices_V_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":720, "type": "signal", "bundle":{"name": "glPLSlices_V", "role": "q1" }} , 
 	{ "name": "refBlock_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "refBlock_V", "role": "address0" }} , 
 	{ "name": "refBlock_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "refBlock_V", "role": "ce0" }} , 
 	{ "name": "refBlock_V_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "refBlock_V", "role": "we0" }} , 
 	{ "name": "refBlock_V_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "refBlock_V", "role": "d0" }} , 
 	{ "name": "targetBlocks_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "targetBlocks_V", "role": "address0" }} , 
 	{ "name": "targetBlocks_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "targetBlocks_V", "role": "ce0" }} , 
 	{ "name": "targetBlocks_V_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "targetBlocks_V", "role": "we0" }} , 
 	{ "name": "targetBlocks_V_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "targetBlocks_V", "role": "d0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
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
	{"Name" : "Latency", "Min" : "3244", "Max" : "3244"}
	, {"Name" : "Interval", "Min" : "3244", "Max" : "3244"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	x { ap_none {  { x in_data 0 16 } } }
	y { ap_none {  { y in_data 0 16 } } }
	glPLTminus1SliceIdx_s { ap_none {  { glPLTminus1SliceIdx_s in_data 0 2 } } }
	glPLTminus2SliceIdx_s { ap_none {  { glPLTminus2SliceIdx_s in_data 0 2 } } }
	glPLSlices_V { ap_memory {  { glPLSlices_V_address0 mem_address 1 10 }  { glPLSlices_V_ce0 mem_ce 1 1 }  { glPLSlices_V_q0 mem_dout 0 720 }  { glPLSlices_V_address1 mem_address 1 10 }  { glPLSlices_V_ce1 mem_ce 1 1 }  { glPLSlices_V_q1 mem_dout 0 720 } } }
	refBlock_V { ap_memory {  { refBlock_V_address0 mem_address 1 10 }  { refBlock_V_ce0 mem_ce 1 1 }  { refBlock_V_we0 mem_we 1 1 }  { refBlock_V_d0 mem_din 1 4 } } }
	targetBlocks_V { ap_memory {  { targetBlocks_V_address0 mem_address 1 10 }  { targetBlocks_V_ce0 mem_ce 1 1 }  { targetBlocks_V_we0 mem_we 1 1 }  { targetBlocks_V_d0 mem_din 1 4 } } }
}
