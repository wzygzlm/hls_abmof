############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
open_project EventStreamToFrameStream
set_top eventStreamToConstEncntFrameStream
add_files EventStreamToFrameStream/src/national_flag.c
add_files EventStreamToFrameStream/src/minizedVersion.cpp
add_files EventStreamToFrameStream/src/main.cpp
add_files -tb EventStreamToFrameStream/src/test.cpp
open_solution "minizedSolution"
set_part {xc7z007sclg225-1} -tool vivado
create_clock -period 10 -name default
#source "./EventStreamToFrameStream/minizedSolution/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -rtl verilog -format ip_catalog
