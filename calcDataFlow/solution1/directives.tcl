############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
set_directive_unroll -factor 1 "sadSum/calOFLoop2"
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
set_directive_array_partition -type complete -dim 0 "colSADSum" t2Col
set_directive_array_reshape -type complete -dim 1 "blockSADSum" sumBlock
set_directive_array_partition -type complete -dim 0 "colSADSum" retVal
set_directive_interface -mode ap_fifo "blockSADSum" t2Block
set_directive_pipeline "blockSADSum"
set_directive_pipeline "miniSADSum"
set_directive_array_partition -type complete -dim 0 "miniSADSum" t2Block
set_directive_interface -mode ap_fifo "blockSADSum" t1Block
set_directive_interface -mode ap_fifo "blockSADSum" t2Block
set_directive_array_reshape -type complete -dim 2 "miniSADSum" localSumReg
set_directive_array_partition -type complete -dim 0 "miniSADSum" t1Block
set_directive_array_partition -type complete -dim 0 "min" inArr
set_directive_unroll "min/minLoop"
set_directive_pipeline "min"
set_directive_inline -off "min"
set_directive_inline -off "sadSum"
set_directive_stream -depth 8 -dim 1 "miniSADSum" localSumReg
set_directive_array_partition -type complete -dim 0 "miniSADSum" tmpLocalSum
set_directive_resource -core FIFO_SRL "miniSADSum" localSumReg
