############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
open_project XYTSStreamToRawStream
set_top XYTSStreamToRawStream
add_files XYTSStreamToRawStream/src/main.h
add_files XYTSStreamToRawStream/src/main.cpp
open_solution "mEDFLOW"
set_part {xc7z035ffg676-2} -tool vivado
create_clock -period 10 -name default
set_clock_uncertainty 0.1
#source "./XYTSStreamToRawStream/mEDFLOW/directives.tcl"
#csim_design
csynth_design
#cosim_design
export_design -rtl verilog -format ip_catalog
