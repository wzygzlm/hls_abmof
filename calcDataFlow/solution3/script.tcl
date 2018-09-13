############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
open_project calcDataFlow
set_top calcOF
add_files calcDataFlow/src/calcDataFlow.cpp
add_files calcDataFlow/src/calcDataFlow.h
add_files -tb calcDataFlow/src/test.cpp
open_solution "solution3"
set_part {xc7z007sclg225-1}
create_clock -period 10 -name default
set_clock_uncertainty 0.1
source "./calcDataFlow/solution3/directives.tcl"
csim_design -setup
csynth_design
cosim_design
export_design -format ip_catalog
