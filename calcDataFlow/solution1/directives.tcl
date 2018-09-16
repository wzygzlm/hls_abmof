############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
set_directive_inline "sadSum"
set_directive_unroll -factor 1 "sadSum/calOFLoop2"
set_directive_array_partition -type complete -dim 0 "colSADSum" t1Block
set_directive_array_partition -type complete -dim 0 "colSADSum" t2Blocks
set_directive_pipeline "sad"
set_directive_array_partition -type complete -dim 0 "colSADSum/colSADSumLoop" input1
set_directive_array_partition -type complete -dim 0 "colSADSum/colSADSumLoop" input2
set_directive_unroll "colSADSum/colSADSumInnerLoop"
set_directive_inline -off "sad"
set_directive_array_partition -type complete -dim 0 "colSADSum" retVal
set_directive_pipeline "colSADSum"
