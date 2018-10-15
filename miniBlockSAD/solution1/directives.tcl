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
set_directive_array_reshape -type complete -dim 2 "blockToColStreams" refBlock
set_directive_array_reshape -type complete -dim 2 "blockToColStreams" tagBlock
set_directive_pipeline -rewind "blockToColStreams/blockToColStreams_label1"
set_directive_pipeline "reOrderColStreams/reOrderColStreams_label3"
set_directive_pipeline "reOrderColStreams/reOrderColStreams_label4"
set_directive_dataflow "reOrderColStreams"
set_directive_pipeline "sadParaUnits"
set_directive_array_partition -type complete -dim 1 "sadParaUnits" t1Col
set_directive_array_partition -type complete -dim 1 "sadParaUnits" t2Col
set_directive_array_partition -type complete -dim 1 "sadParaUnits" retVal
set_directive_pipeline "colSADSum"
set_directive_array_partition -type complete -dim 1 "colSADSum" t1Col
set_directive_array_partition -type complete -dim 1 "colSADSum" t2Col
set_directive_array_partition -type complete -dim 1 "colSADSum" retVal
set_directive_pipeline "readPixFromBigColData"
set_directive_pipeline "readSmallColDataFromBigColData"
set_directive_dataflow "colStreamToMinStream2"
set_directive_array_partition -type complete -dim 1 "colStreamToMinStream2" colData0
set_directive_array_partition -type complete -dim 1 "colStreamToMinStream2" colData1
set_directive_pipeline "colStreamToMinStream2/reOrderColStreams2_label7"
set_directive_pipeline "colStreamToMinStream2/reOrderColStreams2_label0"
set_directive_pipeline "colStreamToColSum/colStreamToColSum_label2"
set_directive_dataflow "colStreamToColSum"
set_directive_pipeline "accumulateStream/accumulateStream_label3"
set_directive_array_partition -type complete -dim 1 "accumulateStream" lastSumData
