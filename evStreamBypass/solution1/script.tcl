############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
open_project evStreamBypass
set_top EvStreamBypass
add_files evStreamBypass/src/main.cpp
add_files evStreamBypass/src/main.h
open_solution "solution1"
set_part {xc7z045ffg900-1} -tool vivado
create_clock -period 10 -name default
#source "./evStreamBypass/solution1/directives.tcl"
#csim_design
csynth_design
#cosim_design -trace_level all
export_design -rtl verilog -format ip_catalog
