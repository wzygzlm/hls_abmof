############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
open_project sum_test
set_top sum
add_files sum_test/src/sum.cpp
open_solution "solution4"
set_part {xc7z007sclg225-1}
create_clock -period 10 -name default
source "./sum_test/solution4/directives.tcl"
#csim_design
csynth_design
#cosim_design
export_design -format ip_catalog
