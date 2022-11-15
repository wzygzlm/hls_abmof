############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
open_project eventFIFOtoStream
set_top EVMUXDataToXYTSStream
add_files eventFIFOtoStream/src/protocolTest.c
add_files eventFIFOtoStream/src/main.h
add_files eventFIFOtoStream/src/main.cpp
add_files -tb eventFIFOtoStream/src/test.cpp
open_solution "mEDFLOW"
set_part {xc7z035ffg676-2} -tool vivado
create_clock -period 10 -name default
#source "./eventFIFOtoStream/mEDFLOW/directives.tcl"
csim_design
csynth_design
cosim_design -trace_level all
export_design -rtl verilog -format ip_catalog
