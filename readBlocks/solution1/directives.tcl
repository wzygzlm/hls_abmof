############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
set_directive_resource -core RAM_T2P_BRAM "writePix" glPLSlices
set_directive_pipeline "writePix"
set_directive_dependence -variable glPLSlices -type inter -direction RAW -dependent false "writePix"
set_directive_array_partition -type complete -dim 1 "writePix" glPLSlices
set_directive_array_partition -type complete -dim 1 "readCols" glPLSlices
set_directive_unroll "readPixFromCol/readWiderBitsLoop"
set_directive_unroll "writePixToCol/writeWiderBitsLoop"
set_directive_inline "readPixFromCol"
set_directive_inline "writePixToCol"
set_directive_pipeline "testWriteAndReadHW"
set_directive_dependence -variable glPLSlices -type inter -direction RAW -dependent false "testWriteAndReadHW"
set_directive_inline -off "writePix"
