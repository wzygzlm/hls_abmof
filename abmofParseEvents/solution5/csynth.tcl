############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
open_project abmofParseEvents
set_top parseEvents
add_files abmofParseEvents/src/abmof_hw_accel.cpp
add_files abmofParseEvents/src/abmof_hw_accel.h
open_solution "solution5"
set_part {xc7z007sclg225-1}
create_clock -period 10 -name default
set_clock_uncertainty 0.1
source "./abmofParseEvents/solution5/directives.tcl"
csynth_design
