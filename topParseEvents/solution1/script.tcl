############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
open_project topParseEvents
set_top topHW
add_files topParseEvents/src/abmofAccel.cpp
add_files topParseEvents/src/abmofAccel.h
open_solution "solution1"
set_part {xc7z007sclg225-1} -tool vivado
create_clock -period 10 -name default
set_clock_uncertainty 0.1
source "./topParseEvents/solution1/directives.tcl"
#csim_design
csynth_design
#cosim_design
export_design -format ip_catalog
