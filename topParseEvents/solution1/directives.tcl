############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
set_directive_resource -core RAM_T2P_BRAM "writePix" glPLSlices
set_directive_pipeline "writePix"
set_directive_unroll "readPixFromCol/readWiderBitsLoop"
set_directive_unroll "writePixToCol/writeWiderBitsLoop"
set_directive_inline "readPixFromCol"
set_directive_inline "writePixToCol"
set_directive_inline "writePix"
set_directive_inline "readBlockCols"
set_directive_unroll "readPixFromTwoCols/readTwoColsWiderBitsLoop"
set_directive_inline "readPixFromTwoCols"
set_directive_array_partition -type complete -dim 1 "writePix" glPLSlices
set_directive_interface -mode ap_fifo -depth 100 "parseEvents" eventSlice
set_directive_pipeline "readBlockCols"
set_directive_inline -off "sadSum"
set_directive_unroll -factor 1 "sadSum/calOFLoop2"
set_directive_inline -off "sad"
set_directive_pipeline "sad"
set_directive_inline -off "colSADSum"
set_directive_pipeline "colSADSum"
set_directive_array_partition -type complete -dim 0 "colSADSum" t1Col
set_directive_array_partition -type complete -dim 0 "colSADSum" retVal
set_directive_array_partition -type complete -dim 0 "colSADSum" t2Col
set_directive_array_partition -type complete -dim 0 "colSADSum/colSADSumLoop" input1
set_directive_array_partition -type complete -dim 0 "colSADSum/colSADSumLoop" input2
set_directive_array_reshape -type complete -dim 1 "blockSADSum" sumBlock
set_directive_array_reshape -type complete -dim 1 "blockSADSum" t1Block
set_directive_array_reshape -type complete -dim 1 "blockSADSum" t2Block
set_directive_pipeline "blockSADSum"
set_directive_interface -mode ap_fifo "blockSADSum" t1Block
set_directive_interface -mode ap_fifo "blockSADSum" t2Block
set_directive_inline -off "min"
set_directive_pipeline "min"
set_directive_array_partition -type complete -dim 0 "miniSADSum" localSumReg
set_directive_array_partition -type complete -dim 0 "min" inArr
set_directive_inline "miniSADSum"
set_directive_inline "readBlockColsAndMiniSADSum"
set_directive_array_reshape -type complete -dim 1 "readBlockCols" refCol
set_directive_array_reshape -type complete -dim 1 "readBlockCols" tagCol
set_directive_array_reshape -type complete -dim 1 "miniSADSum" t1Block
set_directive_array_reshape -type complete -dim 1 "miniSADSum" t2Block
set_directive_loop_tripcount -min 1 -max 10000 "getXandY/getXandYLoop"
set_directive_inline -off "getXandY"
set_directive_pipeline "getXandY/getXandYLoop"
set_directive_inline -off "miniSADSumWrapper"
set_directive_pipeline "parseEvents/outputLoop"
set_directive_loop_tripcount -min 1 -max 10000 "parseEvents/outputLoop"
set_directive_interface -mode ap_fifo -depth 100 "parseEvents" dataStream
set_directive_dataflow "parseEvents/DFRegion"
set_directive_resource -core FIFO_SRL "parseEvents/DFRegion" yStream
set_directive_resource -core FIFO_SRL "parseEvents/DFRegion" xStream
set_directive_pipeline "miniSADSum"
set_directive_interface -mode ap_fifo "miniSADSumWrapper" miniSumRet
set_directive_loop_tripcount -min 1 -max 10000 "miniSADSumWrapper/wrapperLoop"
set_directive_pipeline "rwSlices/rwSlicesInnerLoop"
set_directive_pipeline "miniSADSumWrapper/innerLoop_1"
set_directive_inline "resetPix"
set_directive_loop_tripcount -min 1 -max 10000 "rwSlices/rwSlicesLoop"
set_directive_stream -depth 2 -dim 1 "parseEvents/DFRegion" refStream
set_directive_stream -depth 2 -dim 1 "parseEvents/DFRegion" tagStreamIn
set_directive_resource -core FIFO_SRL "parseEvents/DFRegion" refStream
set_directive_resource -core FIFO_SRL "parseEvents/DFRegion" tagStreamIn
set_directive_array_partition -type cyclic -factor 1 -dim 3 "writePix" glPLSlices
set_directive_dependence -variable glPLSlices -type inter -dependent false "writePix"
set_directive_pipeline "rwSlices/resetLoop"
