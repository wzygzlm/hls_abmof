############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
set_directive_resource -core AddSub_DSP "sad/calOFDSPLoop" tmpSum
set_directive_pipeline "sad"
set_directive_inline -off "sadSum"
set_directive_array_partition -type complete -dim 0 "sad" refBlock
set_directive_array_partition -type complete -dim 0 "sad" targetBlocks
set_directive_inline -off "sad"
set_directive_unroll "sadStream/sadStreamUnrollLoop"
set_directive_pipeline "sadStream/sadStreamLoop2"
set_directive_pipeline "blockSADHW"
set_directive_array_partition -type complete -dim 0 "blockSADHW" blockIn1
set_directive_array_partition -type complete -dim 0 "blockSADHW" blockIn2
set_directive_array_partition -type complete -dim 0 "blockWindowSADHW" blockIn1
set_directive_array_partition -type complete -dim 0 "blockWindowSADHW" blockIn2
set_directive_pipeline "blockWindowSADHW/blockWindowSADHW_label5"
set_directive_unroll "blockWindowSADHW/blockWindowSADHW_label6"
set_directive_unroll "blockWindowSADHW/blockWindowSADHW_label7"
