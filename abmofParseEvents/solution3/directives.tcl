############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
set_directive_interface -mode ap_fifo "parseEvents" eventSlice
set_directive_interface -mode ap_fifo "parseEvents" data
set_directive_inline "accumulateHW"
set_directive_pipeline "parseEvents/loop_1"
set_directive_dependence -variable glPLSlices -type inter -direction RAW -dependent false "parseEvents"
set_directive_resource -core RAM_2P_BRAM "parseEvents" glPLSlices
set_directive_array_partition -type cyclic -factor 16 -dim 2 "parseEvents" glPLSlices
set_directive_occurrence -cycle 5000 "parseEvents/Cond_Region"
set_directive_array_partition -type complete -dim 0 "parseEvents" refBlock
set_directive_array_partition -type complete -dim 0 "parseEvents" targetBlocks
