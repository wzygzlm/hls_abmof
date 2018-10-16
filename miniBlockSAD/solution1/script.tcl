############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
open_project miniBlockSAD
set_top accumulateStream
add_files miniBlockSAD/src/xf_stereoBM_config.h
add_files miniBlockSAD/src/xf_headers.h
add_files miniBlockSAD/src/xf_config_params.h
add_files miniBlockSAD/src/miniBlockSAD.cpp
add_files miniBlockSAD/src/ambofAccel.h
add_files -tb miniBlockSAD/src/test.cpp
open_solution "solution1"
set_part {xc7z007sclg225-1} -tool vivado
create_clock -period 10 -name default
set_clock_uncertainty 0.1
source "./miniBlockSAD/solution1/directives.tcl"
csim_design -setup
csynth_design
cosim_design
export_design -rtl verilog -format ip_catalog
