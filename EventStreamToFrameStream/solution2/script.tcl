############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
open_project EventStreamToFrameStream
set_top EventStreamToFrameStream
add_files EventStreamToFrameStream/src/main.cpp
add_files EventStreamToFrameStream/src/minizedVersion
open_solution "solution2"
set_part {xc7z010clg225-1} -tool vivado
create_clock -period 10 -name default
#source "./EventStreamToFrameStream/solution2/directives.tcl"
#csim_design
csynth_design
#cosim_design
export_design -rtl verilog -format ip_catalog
