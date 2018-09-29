############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
set_directive_pipeline "sad"
set_directive_array_partition -type complete -dim 0 "colSADSum/colSADSumLoop" input1
set_directive_array_partition -type complete -dim 0 "colSADSum/colSADSumLoop" input2
set_directive_unroll -factor 2 "colSADSum/colSADSumInnerLoop"
set_directive_inline -off "sad"
set_directive_pipeline "colSADSum"
set_directive_inline -off "colSADSum"
set_directive_array_reshape -type complete -dim 1 "blockSADSum" t1Block
set_directive_array_reshape -type complete -dim 1 "blockSADSum" t2Block
set_directive_array_partition -type complete -dim 0 "colSADSum" t1Col
set_directive_inline "sadSum"
set_directive_pipeline "sadSum"
set_directive_array_reshape -type complete -dim 2 "testPipelinedMiniSADSum" in1
set_directive_array_reshape -type complete -dim 2 "testPipelinedMiniSADSum" in2
set_directive_inline -off "min"
set_directive_pipeline "updateMiniSumTmp"
set_directive_array_partition -type complete -dim 0 "updateMiniSumTmp" out
set_directive_inline -off "updateMiniSumTmp"
set_directive_pipeline "minStream"
set_directive_pipeline "min"
set_directive_array_reshape -type complete -dim 1 "min" inArr
set_directive_pipeline "testPipelinedMiniSADSum/Loop_1"
set_directive_array_reshape -type complete -dim 1 "miniSADSum" t1Block
set_directive_array_reshape -type complete -dim 1 "miniSADSum" t2Block
set_directive_array_partition -type complete -dim 0 "miniSADSum" localSumReg
set_directive_pipeline "miniSADSum"
set_directive_pipeline "testPipelinedMiniSADSum/Loop_2"
