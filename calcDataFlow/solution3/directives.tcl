############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
set_directive_array_partition -type complete -dim 0 "calcOF" refBlock
set_directive_array_partition -type complete -dim 0 "calcOF" targetBlocks
set_directive_array_partition -type complete -dim 0 "calcOF" sum
set_directive_unroll "calcOF/calOFLoop1"
set_directive_pipeline "calcOF"
set_directive_allocation -limit 1 -type operation "sadSum" add
