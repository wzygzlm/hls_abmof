; ModuleID = 'E:/xfOpenCV/hls_2018_1/abmofParseEvents/solution1/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-w64-mingw32"

@targetBlocks_V = constant [529 x i4] zeroinitializer
@sum = global i16 0, align 2
@refBlock_V = constant [529 x i4] zeroinitializer
@partFactor = global i32 6, align 4
@parseEvents_str = internal unnamed_addr constant [12 x i8] c"parseEvents\00"
@llvm_global_ctors_1 = appending global [1 x void ()*] [void ()* @_GLOBAL__I_a]
@llvm_global_ctors_0 = appending global [1 x i32] [i32 65535]
@glPLSlices_V_2 = internal global [240 x i720] zeroinitializer
@glPLSlices_V_1 = internal global [240 x i720] zeroinitializer
@glPLSlices_V_0 = internal global [240 x i720] zeroinitializer
@glPLActiveSliceIdx_V = internal unnamed_addr global i2 0
@glCnt = internal unnamed_addr global i16 0, align 2
@p_str13 = private unnamed_addr constant [7 x i8] c"loop_1\00", align 1
@p_str12 = private unnamed_addr constant [8 x i8] c"ap_fifo\00", align 1
@p_str11 = private unnamed_addr constant [12 x i8] c"RAM_2P_BRAM\00", align 1
@p_str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1

define void @parseEvents(i64* %data, i32 %eventsArraySize, i32* %eventSlice) nounwind uwtable {
._crit_edge:
  call void (...)* @_ssdm_op_SpecBitsMap(i64* %data) nounwind, !map !100
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %eventsArraySize) nounwind, !map !104
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %eventSlice) nounwind, !map !110
  call void (...)* @_ssdm_op_SpecTopModule([12 x i8]* @parseEvents_str) nounwind
  %eventsArraySize_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %eventsArraySize) nounwind
  call void (...)* @_ssdm_op_SpecMemCore([240 x i720]* @glPLSlices_V_0, [240 x i720]* @glPLSlices_V_1, [240 x i720]* @glPLSlices_V_2, [1 x i8]* @p_str, [12 x i8]* @p_str11, [1 x i8]* @p_str, i32 -1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i64* %data, [8 x i8]* @p_str12, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32* %eventSlice, [8 x i8]* @p_str12, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str) nounwind
  %glPLActiveSliceIdx_V_1 = load i2* @glPLActiveSliceIdx_V, align 1
  %tmp = icmp eq i2 %glPLActiveSliceIdx_V_1, 0
  %p_glPLActiveSliceIdx_s = select i1 %tmp, i2 1, i2 %glPLActiveSliceIdx_V_1
  %tmp_2 = icmp eq i2 %p_glPLActiveSliceIdx_s, 1
  %glPLActiveSliceIdx_V_2 = select i1 %tmp_2, i2 -2, i2 %p_glPLActiveSliceIdx_s
  %tmp_3 = trunc i2 %glPLActiveSliceIdx_V_2 to i1
  %tmp_4 = icmp eq i2 %glPLActiveSliceIdx_V_2, -2
  %tmp1 = or i1 %tmp, %tmp_4
  %p_glPLActiveSliceIdx_1 = or i1 %tmp1, %tmp_2
  %glPLActiveSliceIdx_V_4 = select i1 %tmp_4, i2 0, i2 -2
  %tmp_9 = or i1 %tmp_4, %tmp_2
  %p_glPLActiveSliceIdx_2 = select i1 %tmp_9, i2 %glPLActiveSliceIdx_V_4, i2 1
  %not_tmp_4 = xor i1 %tmp_4, true
  %p_glPLActiveSliceIdx_3 = and i1 %tmp_3, %not_tmp_4
  br i1 %p_glPLActiveSliceIdx_1, label %mergeST, label %._crit_edge195.new

; <label>:0                                       ; preds = %._crit_edge195.new, %accumulateHW.exit_ifconv
  %p_07_rec = phi i31 [ 0, %._crit_edge195.new ], [ %i, %accumulateHW.exit_ifconv ]
  %i_cast = zext i31 %p_07_rec to i32
  %tmp_5 = icmp slt i32 %i_cast, %eventsArraySize_read
  %i = add i31 %p_07_rec, 1
  br i1 %tmp_5, label %1, label %4

; <label>:1                                       ; preds = %0
  call void (...)* @_ssdm_op_SpecLoopName([7 x i8]* @p_str13) nounwind
  %tmp_1 = call i32 (...)* @_ssdm_op_SpecRegionBegin([7 x i8]* @p_str13) nounwind
  call void (...)* @_ssdm_op_SpecPipeline(i32 -1, i32 1, i32 1, i32 0, [1 x i8]* @p_str) nounwind
  call void (...)* @_ssdm_op_SpecLoopTripCount(i32 0, i32 10000, i32 5000, [1 x i8]* @p_str) nounwind
  %tmp_6 = call i64 @_ssdm_op_Read.ap_fifo.volatile.i64P(i64* %data) nounwind
  %x = call i15 @_ssdm_op_PartSelect.i15.i64.i32.i32(i64 %tmp_6, i32 17, i32 31)
  %x_cast = zext i15 %x to i16
  %tmp_11 = call i1 @_ssdm_op_BitSelect.i1.i64.i32(i64 %tmp_6, i32 1)
  br i1 %tmp_11, label %2, label %accumulateHW.exit_ifconv

; <label>:2                                       ; preds = %1
  %arrayNo = urem i15 %x, 3
  %arrayNo_cast3 = zext i15 %arrayNo to i16
  %tmp_12 = trunc i15 %arrayNo to i3
  %zext_cast = zext i15 %x to i32
  %mul = mul i32 43691, %zext_cast
  %newIndex1_cast = call i9 @_ssdm_op_PartSelect.i9.i32.i32.i32(i32 %mul, i32 17, i32 25)
  %tmp_8 = add i9 %tmp_3_cast, %newIndex1_cast
  %tmp_8_cast = sext i9 %tmp_8 to i64
  %glPLSlices_V_0_addr = getelementptr [240 x i720]* @glPLSlices_V_0, i64 0, i64 %tmp_8_cast
  %glPLSlices_V_1_addr = getelementptr [240 x i720]* @glPLSlices_V_1, i64 0, i64 %tmp_8_cast
  %glPLSlices_V_2_addr = getelementptr [240 x i720]* @glPLSlices_V_2, i64 0, i64 %tmp_8_cast
  %glPLSlices_V_0_load = load i720* %glPLSlices_V_0_addr, align 16
  %glPLSlices_V_1_load = load i720* %glPLSlices_V_1_addr, align 16
  %glPLSlices_V_2_load = load i720* %glPLSlices_V_2_addr, align 16
  %tmpData_V = call i720 @_ssdm_op_Mux.ap_auto.3i720.i16(i720 %glPLSlices_V_0_load, i720 %glPLSlices_V_1_load, i720 %glPLSlices_V_2_load, i16 %arrayNo_cast3) nounwind
  %tmp_s = call i15 @_ssdm_op_PartSelect.i15.i64.i32.i32(i64 %tmp_6, i32 2, i32 16)
  %tmp_7 = call i17 @_ssdm_op_BitConcatenate.i17.i15.i2(i15 %tmp_s, i2 0)
  %tmp_14_cast = zext i17 %tmp_7 to i32
  %tmp_13 = call i1 @_ssdm_op_BitSelect.i1.i720.i32(i720 %tmpData_V, i32 %tmp_14_cast)
  %index_assign_1_s = or i17 %tmp_7, 1
  %index_assign_1_cast = zext i17 %index_assign_1_s to i32
  %tmp_15 = call i1 @_ssdm_op_BitSelect.i1.i720.i32(i720 %tmpData_V, i32 %index_assign_1_cast)
  %index_assign_1_1 = or i17 %tmp_7, 2
  %index_assign_1_1_cas = zext i17 %index_assign_1_1 to i32
  %tmp_18 = call i1 @_ssdm_op_BitSelect.i1.i720.i32(i720 %tmpData_V, i32 %index_assign_1_1_cas)
  %index_assign_1_2 = or i17 %tmp_7, 3
  %index_assign_1_2_cas = zext i17 %index_assign_1_2 to i32
  %tmp_20 = call i1 @_ssdm_op_BitSelect.i1.i720.i32(i720 %tmpData_V, i32 %index_assign_1_2_cas)
  %p_Result_4_3 = call i4 @_ssdm_op_BitConcatenate.i4.i1.i1.i1.i1(i1 %tmp_20, i1 %tmp_18, i1 %tmp_15, i1 %tmp_13)
  %tmpTmpData_V = add i4 1, %p_Result_4_3
  %tmp_23 = trunc i4 %tmpTmpData_V to i1
  %p_Repl2_1 = zext i1 %tmp_23 to i64
  %tmp_24 = call i720 @_ssdm_op_BitSet.i720.i720.i32.i64(i720 %tmpData_V, i32 %tmp_14_cast, i64 %p_Repl2_1)
  %tmp_25 = call i1 @_ssdm_op_BitSelect.i1.i4.i32(i4 %tmpTmpData_V, i32 1)
  %p_Repl2_1_1 = zext i1 %tmp_25 to i64
  %tmp_26 = call i720 @_ssdm_op_BitSet.i720.i720.i32.i64(i720 %tmp_24, i32 %index_assign_1_cast, i64 %p_Repl2_1_1)
  %tmp_27 = call i1 @_ssdm_op_BitSelect.i1.i4.i32(i4 %tmpTmpData_V, i32 2)
  %p_Repl2_1_2 = zext i1 %tmp_27 to i64
  %tmp_28 = call i720 @_ssdm_op_BitSet.i720.i720.i32.i64(i720 %tmp_26, i32 %index_assign_1_1_cas, i64 %p_Repl2_1_2)
  %tmp_29 = call i1 @_ssdm_op_BitSelect.i1.i4.i32(i4 %tmpTmpData_V, i32 3)
  %p_Repl2_1_3 = zext i1 %tmp_29 to i64
  %tmp_30 = call i720 @_ssdm_op_BitSet.i720.i720.i32.i64(i720 %tmp_28, i32 %index_assign_1_2_cas, i64 %p_Repl2_1_3)
  switch i3 %tmp_12, label %branch2 [
    i3 0, label %branch0
    i3 1, label %branch1
  ]

; <label>:3                                       ; preds = %branch2, %branch1, %branch0
  br label %accumulateHW.exit_ifconv

accumulateHW.exit_ifconv:                         ; preds = %1, %3
  %i_op_assign_load = load i16* %i_op_assign
  %tmp_10 = icmp eq i31 %p_07_rec, 0
  %tmp_15_cast = zext i16 %i_op_assign_load to i25
  %tmp_14 = call i15 @_ssdm_op_PartSelect.i15.i64.i32.i32(i64 %tmp_6, i32 2, i32 16)
  %tmp_16 = call i23 @_ssdm_op_BitConcatenate.i23.i15.i8(i15 %tmp_14, i8 0)
  %tmp_21_cast = zext i23 %tmp_16 to i25
  %tmp_31 = call i1 @_ssdm_op_BitSelect.i1.i64.i32(i64 %tmp_6, i32 1)
  %sum_load = load i16* @sum, align 2
  %tmp_23_cast = sext i16 %sum_load to i25
  %tmp_17 = call i17 @_ssdm_op_BitConcatenate.i17.i1.i16(i1 %tmp_31, i16 %x_cast)
  %tmp_20_cast = zext i17 %tmp_17 to i25
  %tmp2 = add i25 %tmp_21_cast, %tmp_23_cast
  %tmp_19 = add i25 %tmp2, %tmp_20_cast
  %storemerge = select i1 %tmp_10, i25 %tmp_15_cast, i25 %tmp_19
  %storemerge_cast = sext i25 %storemerge to i32
  call void @_ssdm_op_Write.ap_fifo.i32P(i32* %eventSlice, i32 %storemerge_cast) nounwind
  %localCnt = add i16 %i_op_assign_load, 1
  %glCnt_load = load i16* @glCnt, align 2
  %tmp_21 = add i16 %glCnt_load, 1
  store i16 %tmp_21, i16* @glCnt, align 2
  %empty = call i32 (...)* @_ssdm_op_SpecRegionEnd([7 x i8]* @p_str13, i32 %tmp_1) nounwind
  store i16 %localCnt, i16* %i_op_assign
  br label %0

; <label>:4                                       ; preds = %0
  ret void

branch0:                                          ; preds = %2
  store i720 %tmp_30, i720* %glPLSlices_V_0_addr, align 16
  br label %3

branch1:                                          ; preds = %2
  store i720 %tmp_30, i720* %glPLSlices_V_1_addr, align 16
  br label %3

branch2:                                          ; preds = %2
  store i720 %tmp_30, i720* %glPLSlices_V_2_addr, align 16
  br label %3

mergeST:                                          ; preds = %._crit_edge
  store i2 %p_glPLActiveSliceIdx_2, i2* @glPLActiveSliceIdx_V, align 1
  br label %._crit_edge195.new

._crit_edge195.new:                               ; preds = %mergeST, %._crit_edge
  %i_op_assign = alloca i16
  %tmp_3_cast = select i1 %p_glPLActiveSliceIdx_3, i9 240, i9 0
  br label %0
}

declare i64 @llvm.part.select.i64(i64, i32, i32) nounwind readnone

declare i32 @llvm.part.select.i32(i32, i32, i32) nounwind readnone

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

define weak void @_ssdm_op_Write.ap_fifo.i32P(i32*, i32) {
entry:
  %empty = call i32 @_autotb_FifoWrite_i32(i32* %0, i32 %1)
  ret void
}

define weak void @_ssdm_op_SpecTopModule(...) {
entry:
  ret void
}

define weak i32 @_ssdm_op_SpecRegionEnd(...) {
entry:
  ret i32 0
}

define weak i32 @_ssdm_op_SpecRegionBegin(...) {
entry:
  ret i32 0
}

define weak void @_ssdm_op_SpecPipeline(...) nounwind {
entry:
  ret void
}

define weak void @_ssdm_op_SpecMemCore(...) {
entry:
  ret void
}

define weak void @_ssdm_op_SpecLoopTripCount(...) nounwind {
entry:
  ret void
}

define weak void @_ssdm_op_SpecLoopName(...) nounwind {
entry:
  ret void
}

define weak void @_ssdm_op_SpecInterface(...) nounwind {
entry:
  ret void
}

define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

define weak i64 @_ssdm_op_Read.ap_fifo.volatile.i64P(i64*) {
entry:
  %empty = call i64 @_autotb_FifoRead_i64(i64* %0)
  ret i64 %empty
}

define weak i32 @_ssdm_op_Read.ap_auto.i32(i32) {
entry:
  ret i32 %0
}

define weak i9 @_ssdm_op_PartSelect.i9.i32.i32.i32(i32, i32, i32) nounwind readnone {
entry:
  %empty = call i32 @llvm.part.select.i32(i32 %0, i32 %1, i32 %2)
  %empty_8 = trunc i32 %empty to i9
  ret i9 %empty_8
}

declare i3 @_ssdm_op_PartSelect.i3.i15.i32.i32(i15, i32, i32) nounwind readnone

define weak i15 @_ssdm_op_PartSelect.i15.i64.i32.i32(i64, i32, i32) nounwind readnone {
entry:
  %empty = call i64 @llvm.part.select.i64(i64 %0, i32 %1, i32 %2)
  %empty_9 = trunc i64 %empty to i15
  ret i15 %empty_9
}

declare i1 @_ssdm_op_PartSelect.i1.i4.i32.i32(i4, i32, i32) nounwind readnone

declare i1 @_ssdm_op_PartSelect.i1.i2.i32.i32(i2, i32, i32) nounwind readnone

define weak i720 @_ssdm_op_Mux.ap_auto.3i720.i16(i720, i720, i720, i16) {
entry:
  switch i16 %3, label %case2 [
    i16 0, label %case0
    i16 1, label %case1
  ]

case0:                                            ; preds = %case2, %case1, %entry
  %merge = phi i720 [ %0, %entry ], [ %1, %case1 ], [ %2, %case2 ]
  ret i720 %merge

case1:                                            ; preds = %entry
  br label %case0

case2:                                            ; preds = %entry
  br label %case0
}

define weak i720 @_ssdm_op_BitSet.i720.i720.i32.i64(i720, i32, i64) nounwind readnone {
entry:
  %empty = icmp ne i64 %2, 0
  %empty_10 = zext i1 %empty to i720
  %empty_11 = zext i32 %1 to i720
  %empty_12 = shl i720 %empty_10, %empty_11
  %empty_13 = shl i720 1, %empty_11
  %empty_14 = xor i720 %empty_13, -1
  %empty_15 = and i720 %empty_14, %0
  %empty_16 = or i720 %empty_12, %empty_15
  ret i720 %empty_16
}

define weak i1 @_ssdm_op_BitSelect.i1.i720.i32(i720, i32) nounwind readnone {
entry:
  %empty = zext i32 %1 to i720
  %empty_17 = shl i720 1, %empty
  %empty_18 = and i720 %0, %empty_17
  %empty_19 = icmp ne i720 %empty_18, 0
  ret i1 %empty_19
}

define weak i1 @_ssdm_op_BitSelect.i1.i64.i32(i64, i32) nounwind readnone {
entry:
  %empty = zext i32 %1 to i64
  %empty_20 = shl i64 1, %empty
  %empty_21 = and i64 %0, %empty_20
  %empty_22 = icmp ne i64 %empty_21, 0
  ret i1 %empty_22
}

define weak i1 @_ssdm_op_BitSelect.i1.i4.i32(i4, i32) nounwind readnone {
entry:
  %empty = trunc i32 %1 to i4
  %empty_23 = shl i4 1, %empty
  %empty_24 = and i4 %0, %empty_23
  %empty_25 = icmp ne i4 %empty_24, 0
  ret i1 %empty_25
}

define weak i1 @_ssdm_op_BitSelect.i1.i2.i32(i2, i32) nounwind readnone {
entry:
  %empty = trunc i32 %1 to i2
  %empty_26 = shl i2 1, %empty
  %empty_27 = and i2 %0, %empty_26
  %empty_28 = icmp ne i2 %empty_27, 0
  ret i1 %empty_28
}

define weak i4 @_ssdm_op_BitConcatenate.i4.i1.i1.i1.i1(i1, i1, i1, i1) nounwind readnone {
entry:
  %empty = zext i1 %2 to i2
  %empty_29 = zext i1 %3 to i2
  %empty_30 = shl i2 %empty, 1
  %empty_31 = or i2 %empty_30, %empty_29
  %empty_32 = zext i1 %1 to i3
  %empty_33 = zext i2 %empty_31 to i3
  %empty_34 = shl i3 %empty_32, 2
  %empty_35 = or i3 %empty_34, %empty_33
  %empty_36 = zext i1 %0 to i4
  %empty_37 = zext i3 %empty_35 to i4
  %empty_38 = shl i4 %empty_36, 3
  %empty_39 = or i4 %empty_38, %empty_37
  ret i4 %empty_39
}

define weak i23 @_ssdm_op_BitConcatenate.i23.i15.i8(i15, i8) nounwind readnone {
entry:
  %empty = zext i15 %0 to i23
  %empty_40 = zext i8 %1 to i23
  %empty_41 = shl i23 %empty, 8
  %empty_42 = or i23 %empty_41, %empty_40
  ret i23 %empty_42
}

define weak i17 @_ssdm_op_BitConcatenate.i17.i15.i2(i15, i2) nounwind readnone {
entry:
  %empty = zext i15 %0 to i17
  %empty_43 = zext i2 %1 to i17
  %empty_44 = shl i17 %empty, 2
  %empty_45 = or i17 %empty_44, %empty_43
  ret i17 %empty_45
}

define weak i17 @_ssdm_op_BitConcatenate.i17.i1.i16(i1, i16) nounwind readnone {
entry:
  %empty = zext i1 %0 to i17
  %empty_46 = zext i16 %1 to i17
  %empty_47 = shl i17 %empty, 16
  %empty_48 = or i17 %empty_47, %empty_46
  ret i17 %empty_48
}

declare void @_ssdm_SpecDependence(...) nounwind

declare i32 @_autotb_FifoWrite_i32(i32*, i32)

declare i64 @_autotb_FifoRead_i64(i64*)

declare void @_GLOBAL__I_a() nounwind

!opencl.kernels = !{!0, !7, !13, !19, !7, !25, !7, !7, !7, !28, !28, !34, !34, !36, !39, !39, !7, !41, !7, !7, !7, !28, !28, !43, !43, !7, !7, !45, !7, !7, !7, !28, !28, !47, !47, !49, !51, !51, !7, !53, !7, !7, !7, !28, !28, !55, !55, !57, !57, !7, !7, !59, !62, !64, !57, !57, !7, !7, !65, !7, !67, !69, !64, !71, !7, !67, !73, !75, !75, !73, !79, !79, !81, !7, !7, !7, !7, !7, !7, !7, !7, !7}
!hls.encrypted.func = !{}
!llvm.map.gv = !{!83, !90, !95}

!0 = metadata !{null, metadata !1, metadata !2, metadata !3, metadata !4, metadata !5, metadata !6}
!1 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0, i32 0, i32 0}
!2 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none", metadata !"none"}
!3 = metadata !{metadata !"kernel_arg_type", metadata !"int16_t", metadata !"int16_t", metadata !"_Bool", metadata !"int64_t"}
!4 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !"", metadata !""}
!5 = metadata !{metadata !"kernel_arg_name", metadata !"x", metadata !"y", metadata !"pol", metadata !"ts"}
!6 = metadata !{metadata !"reqd_work_group_size", i32 1, i32 1, i32 1}
!7 = metadata !{null, metadata !8, metadata !9, metadata !10, metadata !11, metadata !12, metadata !6}
!8 = metadata !{metadata !"kernel_arg_addr_space"}
!9 = metadata !{metadata !"kernel_arg_access_qual"}
!10 = metadata !{metadata !"kernel_arg_type"}
!11 = metadata !{metadata !"kernel_arg_type_qual"}
!12 = metadata !{metadata !"kernel_arg_name"}
!13 = metadata !{null, metadata !14, metadata !15, metadata !16, metadata !17, metadata !18, metadata !6}
!14 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0}
!15 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none"}
!16 = metadata !{metadata !"kernel_arg_type", metadata !"int16_t", metadata !"int16_t"}
!17 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !""}
!18 = metadata !{metadata !"kernel_arg_name", metadata !"x", metadata !"y"}
!19 = metadata !{void (i64*, i32, i32*)* @parseEvents, metadata !20, metadata !21, metadata !22, metadata !23, metadata !24, metadata !6}
!20 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 0, i32 1}
!21 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none"}
!22 = metadata !{metadata !"kernel_arg_type", metadata !"uint64_t*", metadata !"int32_t", metadata !"int32_t*"}
!23 = metadata !{metadata !"kernel_arg_type_qual", metadata !"const", metadata !"", metadata !""}
!24 = metadata !{metadata !"kernel_arg_name", metadata !"data", metadata !"eventsArraySize", metadata !"eventSlice"}
!25 = metadata !{null, metadata !14, metadata !15, metadata !26, metadata !17, metadata !27, metadata !6}
!26 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<33, true> &", metadata !"const ap_int_base<4, true> &"}
!27 = metadata !{metadata !"kernel_arg_name", metadata !"op", metadata !"op2"}
!28 = metadata !{null, metadata !29, metadata !30, metadata !31, metadata !32, metadata !33, metadata !6}
!29 = metadata !{metadata !"kernel_arg_addr_space", i32 0}
!30 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none"}
!31 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<4, true> &"}
!32 = metadata !{metadata !"kernel_arg_type_qual", metadata !""}
!33 = metadata !{metadata !"kernel_arg_name", metadata !"op"}
!34 = metadata !{null, metadata !29, metadata !30, metadata !35, metadata !32, metadata !33, metadata !6}
!35 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<33, true> &"}
!36 = metadata !{null, metadata !14, metadata !15, metadata !37, metadata !17, metadata !38, metadata !6}
!37 = metadata !{metadata !"kernel_arg_type", metadata !"int", metadata !"const ap_int_base<4, true> &"}
!38 = metadata !{metadata !"kernel_arg_name", metadata !"i_op", metadata !"op"}
!39 = metadata !{null, metadata !29, metadata !30, metadata !40, metadata !32, metadata !33, metadata !6}
!40 = metadata !{metadata !"kernel_arg_type", metadata !"int"}
!41 = metadata !{null, metadata !14, metadata !15, metadata !42, metadata !17, metadata !27, metadata !6}
!42 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<32, true> &", metadata !"const ap_int_base<4, true> &"}
!43 = metadata !{null, metadata !29, metadata !30, metadata !44, metadata !32, metadata !33, metadata !6}
!44 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<32, true> &"}
!45 = metadata !{null, metadata !14, metadata !15, metadata !46, metadata !17, metadata !27, metadata !6}
!46 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<18, true> &", metadata !"const ap_int_base<4, true> &"}
!47 = metadata !{null, metadata !29, metadata !30, metadata !48, metadata !32, metadata !33, metadata !6}
!48 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<18, true> &"}
!49 = metadata !{null, metadata !14, metadata !15, metadata !50, metadata !17, metadata !38, metadata !6}
!50 = metadata !{metadata !"kernel_arg_type", metadata !"ushort", metadata !"const ap_int_base<4, true> &"}
!51 = metadata !{null, metadata !29, metadata !30, metadata !52, metadata !32, metadata !33, metadata !6}
!52 = metadata !{metadata !"kernel_arg_type", metadata !"ushort"}
!53 = metadata !{null, metadata !14, metadata !15, metadata !54, metadata !17, metadata !27, metadata !6}
!54 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<16, false> &", metadata !"const ap_int_base<4, true> &"}
!55 = metadata !{null, metadata !29, metadata !30, metadata !56, metadata !32, metadata !33, metadata !6}
!56 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<16, false> &"}
!57 = metadata !{null, metadata !29, metadata !30, metadata !40, metadata !32, metadata !58, metadata !6}
!58 = metadata !{metadata !"kernel_arg_name", metadata !"val"}
!59 = metadata !{null, metadata !29, metadata !30, metadata !60, metadata !32, metadata !61, metadata !6}
!60 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<2> &"}
!61 = metadata !{metadata !"kernel_arg_name", metadata !"op2"}
!62 = metadata !{null, metadata !14, metadata !15, metadata !63, metadata !17, metadata !27, metadata !6}
!63 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<2, false> &", metadata !"int"}
!64 = metadata !{null, metadata !29, metadata !30, metadata !44, metadata !32, metadata !61, metadata !6}
!65 = metadata !{null, metadata !29, metadata !30, metadata !66, metadata !32, metadata !58, metadata !6}
!66 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_bit_ref<4, true> &"}
!67 = metadata !{null, metadata !29, metadata !30, metadata !68, metadata !32, metadata !58, metadata !6}
!68 = metadata !{metadata !"kernel_arg_type", metadata !"ulong long"}
!69 = metadata !{null, metadata !14, metadata !15, metadata !70, metadata !17, metadata !27, metadata !6}
!70 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<4, true> &", metadata !"int"}
!71 = metadata !{null, metadata !29, metadata !30, metadata !72, metadata !32, metadata !58, metadata !6}
!72 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_bit_ref<720, true> &"}
!73 = metadata !{null, metadata !29, metadata !30, metadata !40, metadata !32, metadata !74, metadata !6}
!74 = metadata !{metadata !"kernel_arg_name", metadata !"index"}
!75 = metadata !{null, metadata !76, metadata !15, metadata !77, metadata !17, metadata !78, metadata !6}
!76 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 0}
!77 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<720, true>*", metadata !"int"}
!78 = metadata !{metadata !"kernel_arg_name", metadata !"bv", metadata !"index"}
!79 = metadata !{null, metadata !76, metadata !15, metadata !80, metadata !17, metadata !78, metadata !6}
!80 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<4, true>*", metadata !"int"}
!81 = metadata !{null, metadata !29, metadata !30, metadata !82, metadata !32, metadata !61, metadata !6}
!82 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int<720> &"}
!83 = metadata !{metadata !84, i16* @sum}
!84 = metadata !{metadata !85}
!85 = metadata !{i32 0, i32 15, metadata !86}
!86 = metadata !{metadata !87}
!87 = metadata !{metadata !"sum", metadata !88, metadata !"short", i32 0, i32 15}
!88 = metadata !{metadata !89}
!89 = metadata !{i32 0, i32 0, i32 1}
!90 = metadata !{metadata !91, i32* @partFactor}
!91 = metadata !{metadata !92}
!92 = metadata !{i32 0, i32 31, metadata !93}
!93 = metadata !{metadata !94}
!94 = metadata !{metadata !"partFactor", metadata !88, metadata !"int", i32 0, i32 31}
!95 = metadata !{metadata !96, [1 x i32]* @llvm_global_ctors_0}
!96 = metadata !{metadata !97}
!97 = metadata !{i32 0, i32 31, metadata !98}
!98 = metadata !{metadata !99}
!99 = metadata !{metadata !"llvm.global_ctors.0", metadata !88, metadata !"", i32 0, i32 31}
!100 = metadata !{metadata !101}
!101 = metadata !{i32 0, i32 63, metadata !102}
!102 = metadata !{metadata !103}
!103 = metadata !{metadata !"data", metadata !88, metadata !"long long unsigned int", i32 0, i32 63}
!104 = metadata !{metadata !105}
!105 = metadata !{i32 0, i32 31, metadata !106}
!106 = metadata !{metadata !107}
!107 = metadata !{metadata !"eventsArraySize", metadata !108, metadata !"int", i32 0, i32 31}
!108 = metadata !{metadata !109}
!109 = metadata !{i32 0, i32 0, i32 0}
!110 = metadata !{metadata !111}
!111 = metadata !{i32 0, i32 31, metadata !112}
!112 = metadata !{metadata !113}
!113 = metadata !{metadata !"eventSlice", metadata !88, metadata !"int", i32 0, i32 31}
