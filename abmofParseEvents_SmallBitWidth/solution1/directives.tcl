############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
set_directive_array_partition -type cyclic -factor 16 -dim 1 "parseEvents" glPLSlice0
set_directive_array_partition -type cyclic -factor 16 -dim 1 "parseEvents" glPLSlice1
set_directive_array_partition -type cyclic -factor 16 -dim 1 "parseEvents" glPLSlice2
set_directive_interface -mode ap_fifo "parseEvents" data
set_directive_interface -mode ap_fifo "parseEvents" eventSlice
set_directive_resource -core RAM_T2P_BRAM "parseEvents" glPLSlice0
set_directive_resource -core RAM_T2P_BRAM "parseEvents" glPLSlice1
set_directive_resource -core RAM_T2P_BRAM "parseEvents" glPLSlice2
set_directive_pipeline "parseEvents/loop_1"
set_directive_inline "accumulateHW"
