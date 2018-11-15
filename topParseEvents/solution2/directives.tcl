############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
set_directive_interface -mode ap_fifo -depth 500 "parseEvents" dataStream
set_directive_pipeline "getXandY/getXandYLoop"
set_directive_loop_tripcount -min 1 -max 10000 "getXandY/getXandYLoop"
set_directive_loop_tripcount -min 1 -max 10000 "rwSlices/rwSlicesLoop"
set_directive_pipeline "rwSlices/resetLoop"
set_directive_loop_tripcount -min 1 -max 10000 "miniSADSumWrapper/wrapperLoop"
set_directive_loop_tripcount -min 1 -max 10000 "outputResult/outputLoop"
set_directive_pipeline "outputResult/outputLoop"
set_directive_interface -mode ap_fifo -depth 1000 "testRwslices" data
set_directive_interface -mode ap_fifo -depth 17000 "testRwslices" refData
set_directive_interface -mode ap_fifo -depth 17000 "testRwslices" tagData
set_directive_stream -depth 2 -dim 1 "testRwslices" pktEventDataStream
set_directive_stream -depth 2 -dim 1 "testRwslices" refStream
set_directive_stream -depth 2 -dim 1 "testRwslices" tagStreamIn
set_directive_dataflow "testRwslices"
set_directive_pipeline "testRwslices/getXandYLoop"
set_directive_pipeline "testRwslices/writeFromStream"
set_directive_loop_tripcount -min 1 -max 170000 "testRwslices/writeFromStream"
set_directive_interface -mode s_axilite -register "parseEvents"
set_directive_interface -mode ap_fifo "getXandY" data
set_directive_pipeline "feedbackWrapper/feedbackWrapperLoop"
set_directive_pipeline "rwSlicesAndColStreams/rwSlicesLoop"
set_directive_pipeline "rwSlicesAndColStreams/GenerateStreamLoop"
set_directive_dataflow "rwSlicesAndColStreams"
set_directive_resource -core RAM_1P_LUTRAM "rwSlicesAndColStreams" colData0
set_directive_resource -core RAM_2P_LUTRAM "rwSlicesAndColStreams" colData1
set_directive_interface -mode m_axi -depth 500 -offset slave -bundle gmem -num_read_outstanding 0 -max_read_burst_length 2 -max_write_burst_length 256 "parseEvents" eventSlice
