############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
open_project abmofParseEvents_SmallBitWidth
set_top parseEvents
add_files abmofParseEvents_SmallBitWidth/src/abmof_hw_accel.h
add_files abmofParseEvents_SmallBitWidth/src/abmof_hw_accel.cpp
open_solution "solution4"
set_part {xc7z007sclg225-1}
create_clock -period 30 -name default
set_clock_uncertainty 0.1
source "./abmofParseEvents_SmallBitWidth/solution4/directives.tcl"
#csim_design
csynth_design
#cosim_design
export_design -format ip_catalog
