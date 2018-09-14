############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
set_directive_array_partition -type complete -dim 0 "calcOF" refBlock
set_directive_array_partition -type complete -dim 0 "calcOF" targetBlocks
set_directive_array_partition -type complete -dim 0 "calcOF" sum
set_directive_inline "sadSum"
set_directive_unroll -factor 1 "sadSum/calOFLoop2"
set_directive_pipeline "calcOF"
