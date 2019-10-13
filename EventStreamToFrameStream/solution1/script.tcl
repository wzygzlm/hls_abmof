############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
open_project EventStreamToFrameStream
set_top eventStreamToConstEncntFrameStream
add_files EventStreamToFrameStream/src/main.cpp
add_files EventStreamToFrameStream/src/minizedVersion.cpp
add_files EventStreamToFrameStream/src/national_flag.c
add_files -tb EventStreamToFrameStream/src/test.cpp
open_solution "solution1"
set_part {xc7z045ffg900-1}
create_clock -period 10 -name default
set_clock_uncertainty 0.1
#source "./EventStreamToFrameStream/solution1/directives.tcl"
csim_design
csynth_design
cosim_design -trace_level all
export_design -rtl verilog -format ip_catalog
