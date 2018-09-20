############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
open_project xlnk_LK_OF
set_top hls_LK
add_files xlnk_LK_OF/src/LKof_defines.h
add_files xlnk_LK_OF/src/LKof_hls_opt.cpp
add_files xlnk_LK_OF/src/LKof_ref.cpp
add_files xlnk_LK_OF/src/ap_bmp.cpp
add_files xlnk_LK_OF/src/ap_bmp.h
add_files xlnk_LK_OF/src/motion_compensation.cpp
add_files xlnk_LK_OF/src/sdsoc_defines.h
add_files -tb xlnk_LK_OF/src/LKof_main.cpp
open_solution "solution1"
set_part {xc7z007sclg225-1} -tool vivado
create_clock -period 10 -name default
set_clock_uncertainty 0.1
#source "./xlnk_LK_OF/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
