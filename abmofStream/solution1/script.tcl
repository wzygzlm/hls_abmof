############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
open_project abmofStream
set_top readPixFromCol
add_files abmofStream/src/abmofAccel.h
add_files abmofStream/src/abmofStream.cpp
open_solution "solution1"
set_part {xc7z007sclg225-1} -tool vivado
create_clock -period 10 -name default
set_clock_uncertainty 0.1
#source "./abmofStream/solution1/directives.tcl"
#csim_design
csynth_design
#cosim_design
export_design -format ip_catalog
