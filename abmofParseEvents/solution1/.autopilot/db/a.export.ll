; ModuleID = 'E:/xfOpenCV/hls_2018_1/abmofParseEvents/solution1/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-w64-mingw32"

@targetBlocks_V = global [529 x i4] zeroinitializer
@sum = global i16 0, align 2
@refBlock_V = global [529 x i4] zeroinitializer
@partFactor = global i32 6, align 4
@parseEvents_str = internal unnamed_addr constant [12 x i8] c"parseEvents\00"
@llvm_global_ctors_1 = appending global [1 x void ()*] [void ()* @_GLOBAL__I_a]
@llvm_global_ctors_0 = appending global [1 x i32] [i32 65535]
@glPLTminus2SliceIdx_s = internal unnamed_addr global i2 0
@glPLTminus1SliceIdx_s = internal unnamed_addr global i2 0
@glPLSlices_V = internal global [720 x i720] zeroinitializer
@glPLActiveSliceIdx_V = internal unnamed_addr global i2 0
@glCnt = internal unnamed_addr global i16 0, align 2
@p_str6 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@p_str5 = private unnamed_addr constant [20 x i8] c"accumulateHW_label2\00", align 1
@p_str14 = private unnamed_addr constant [7 x i8] c"loop_1\00", align 1
@p_str13 = private unnamed_addr constant [8 x i8] c"ap_fifo\00", align 1
@p_str12 = private unnamed_addr constant [19 x i8] c"parseEvents_label3\00", align 1
@p_str11 = private unnamed_addr constant [20 x i8] c"readBlockInnerLoop1\00", align 1
@p_str10 = private unnamed_addr constant [18 x i8] c"readRefBlockLoop1\00", align 1
@p_str = private unnamed_addr constant [20 x i8] c"accumulateHW_label1\00", align 1

define void @parseEvents(i32* %data, i32 %eventsArraySize, i32* %eventSlice) nounwind uwtable {
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %data) nounwind, !map !116
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %eventsArraySize) nounwind, !map !120
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %eventSlice) nounwind, !map !126
  call void (...)* @_ssdm_op_SpecTopModule([12 x i8]* @parseEvents_str) nounwind
  %eventsArraySize_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %eventsArraySize) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32* %data, [8 x i8]* @p_str13, i32 0, i32 0, [1 x i8]* @p_str6, i32 0, i32 0, [1 x i8]* @p_str6, [1 x i8]* @p_str6, [1 x i8]* @p_str6, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str6, [1 x i8]* @p_str6) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32* %eventSlice, [8 x i8]* @p_str13, i32 0, i32 0, [1 x i8]* @p_str6, i32 0, i32 0, [1 x i8]* @p_str6, [1 x i8]* @p_str6, [1 x i8]* @p_str6, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str6, [1 x i8]* @p_str6) nounwind
  %glPLActiveSliceIdx_V_1 = load i2* @glPLActiveSliceIdx_V, align 1
  %tmp = icmp eq i2 %glPLActiveSliceIdx_V_1, 0
  br i1 %tmp, label %1, label %._crit_edge

; <label>:1                                       ; preds = %0
  store i2 1, i2* @glPLActiveSliceIdx_V, align 1
  store i2 0, i2* @glPLTminus1SliceIdx_s, align 1
  store i2 -2, i2* @glPLTminus2SliceIdx_s, align 1
  br label %._crit_edge

._crit_edge:                                      ; preds = %1, %0
  %tmp_1 = phi i2 [ 1, %1 ], [ %glPLActiveSliceIdx_V_1, %0 ]
  %tmp_2 = icmp eq i2 %tmp_1, 1
  br i1 %tmp_2, label %2, label %._crit_edge198

; <label>:2                                       ; preds = %._crit_edge
  store i2 -2, i2* @glPLActiveSliceIdx_V, align 1
  store i2 1, i2* @glPLTminus1SliceIdx_s, align 1
  store i2 0, i2* @glPLTminus2SliceIdx_s, align 1
  br label %._crit_edge198

._crit_edge198:                                   ; preds = %2, %._crit_edge
  %tmp_3 = phi i2 [ -2, %2 ], [ %tmp_1, %._crit_edge ]
  %tmp_4 = icmp eq i2 %tmp_3, -2
  br i1 %tmp_4, label %3, label %._crit_edge199

; <label>:3                                       ; preds = %._crit_edge198
  store i2 0, i2* @glPLActiveSliceIdx_V, align 1
  store i2 -2, i2* @glPLTminus1SliceIdx_s, align 1
  store i2 1, i2* @glPLTminus2SliceIdx_s, align 1
  br label %._crit_edge199

._crit_edge199:                                   ; preds = %3, %._crit_edge198
  %tmp_5 = shl i32 %eventsArraySize_read, 1
  br label %4

; <label>:4                                       ; preds = %_ifconv, %._crit_edge199
  %i = phi i32 [ 0, %._crit_edge199 ], [ %i_1, %_ifconv ]
  %tmp_6 = icmp slt i32 %i, %tmp_5
  br i1 %tmp_6, label %_ifconv, label %5

_ifconv:                                          ; preds = %4
  call void (...)* @_ssdm_op_SpecLoopName([7 x i8]* @p_str14) nounwind
  %tmp_8 = call i32 (...)* @_ssdm_op_SpecRegionBegin([7 x i8]* @p_str14) nounwind
  call void (...)* @_ssdm_op_SpecLoopTripCount(i32 0, i32 10000, i32 5000, [1 x i8]* @p_str6) nounwind
  %tmp_7 = trunc i32 %i to i6
  %p_shl_cast = call i11 @_ssdm_op_BitConcatenate.i11.i6.i5(i6 %tmp_7, i5 0)
  %tmp_9 = trunc i32 %i to i8
  %p_shl1_cast = call i11 @_ssdm_op_BitConcatenate.i11.i8.i3(i8 %tmp_9, i3 0)
  %tmp_11 = sub i11 %p_shl_cast, %p_shl1_cast
  %tmp_21_cast = sext i11 %tmp_11 to i64
  %refBlock_V_addr = getelementptr [529 x i4]* @refBlock_V, i64 0, i64 %tmp_21_cast
  %targetBlocks_V_addr = getelementptr [529 x i4]* @targetBlocks_V, i64 0, i64 %tmp_21_cast
  %tmp_14 = call i32 @_ssdm_op_Read.ap_fifo.volatile.i32P(i32* %data) nounwind
  %tmp_15 = call i15 @_ssdm_op_PartSelect.i15.i32.i32.i32(i32 %tmp_14, i32 17, i32 31)
  %x = zext i15 %tmp_15 to i16
  %y = call i15 @_ssdm_op_PartSelect.i15.i32.i32.i32(i32 %tmp_14, i32 2, i32 16)
  %y_cast = zext i15 %y to i16
  %tmp_18 = call i1 @_ssdm_op_BitSelect.i1.i32.i32(i32 %tmp_14, i32 1)
  %tmp_s = call i2 @_ssdm_op_BitConcatenate.i2.i1.i1(i1 %tmp_18, i1 false)
  %pol = icmp ne i2 %tmp_s, 0
  call fastcc void @accumulateHW(i16 signext %x, i16 signext %y_cast, i1 zeroext %pol)
  call fastcc void @calcOF(i16 signext %x, i16 signext %y_cast)
  %tmp_10 = icmp eq i32 %i, 0
  %sum_load = load i16* @sum, align 2
  %lhs_V = sext i16 %sum_load to i17
  %refBlock_V_load = load i4* getelementptr inbounds ([529 x i4]* @refBlock_V, i64 0, i64 0), align 16
  %rhs_V = sext i4 %refBlock_V_load to i17
  %r_V = add nsw i17 %lhs_V, %rhs_V
  %targetBlocks_V_load = load i4* getelementptr inbounds ([529 x i4]* @targetBlocks_V, i64 0, i64 0), align 16
  %rhs_V_1_cast = sext i4 %targetBlocks_V_load to i17
  %r_V_1 = add i17 %r_V, %rhs_V_1_cast
  %tmp_11_cast = sext i17 %r_V_1 to i25
  %tmp_12 = call i23 @_ssdm_op_BitConcatenate.i23.i15.i8(i15 %y, i8 0)
  %tmp_15_cast_cast = zext i23 %tmp_12 to i24
  %refBlock_V_load_1 = load i4* %refBlock_V_addr, align 16
  %tmp_18_cast = sext i4 %refBlock_V_load_1 to i5
  %targetBlocks_V_load_1 = load i4* %targetBlocks_V_addr, align 16
  %tmp_19_cast = sext i4 %targetBlocks_V_load_1 to i5
  %tmp_13 = call i17 @_ssdm_op_BitConcatenate.i17.i1.i16(i1 %tmp_18, i16 %x)
  %tmp_14_cast = zext i17 %tmp_13 to i24
  %tmp1 = add i24 %tmp_15_cast_cast, %tmp_14_cast
  %tmp1_cast = zext i24 %tmp1 to i25
  %tmp3 = add i5 %tmp_18_cast, %tmp_19_cast
  %tmp3_cast = sext i5 %tmp3 to i17
  %tmp2 = add i17 %tmp3_cast, %lhs_V
  %tmp2_cast_cast = sext i17 %tmp2 to i25
  %tmp_16 = add i25 %tmp2_cast_cast, %tmp1_cast
  %storemerge = select i1 %tmp_10, i25 %tmp_11_cast, i25 %tmp_16
  %storemerge_cast = sext i25 %storemerge to i32
  call void @_ssdm_op_Write.ap_fifo.i32P(i32* %eventSlice, i32 %storemerge_cast) nounwind
  %glCnt_load = load i16* @glCnt, align 2
  %tmp_17 = add i16 1, %glCnt_load
  store i16 %tmp_17, i16* @glCnt, align 2
  %empty = call i32 (...)* @_ssdm_op_SpecRegionEnd([7 x i8]* @p_str14, i32 %tmp_8) nounwind
  %i_1 = add nsw i32 2, %i
  br label %4

; <label>:5                                       ; preds = %4
  ret void
}

declare i32 @llvm.part.select.i32(i32, i32, i32) nounwind readnone

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

define internal fastcc void @calcOF(i16 signext %x, i16 signext %y) nounwind uwtable {
  %p_Val2_s = alloca i4
  %p_Val2_1 = alloca i4
  %y_read = call i16 @_ssdm_op_Read.ap_auto.i16(i16 %y) nounwind
  %x_read = call i16 @_ssdm_op_Read.ap_auto.i16(i16 %x) nounwind
  %tmp = trunc i16 %y_read to i15
  %tmp_s = call i17 @_ssdm_op_BitConcatenate.i17.i15.i2(i15 %tmp, i2 0)
  %glPLTminus1SliceIdx_1 = load i2* @glPLTminus1SliceIdx_s, align 1
  %tmp_19 = call i10 @_ssdm_op_BitConcatenate.i10.i2.i8(i2 %glPLTminus1SliceIdx_1, i8 0)
  %p_shl2_cast = zext i10 %tmp_19 to i11
  %tmp_20 = call i6 @_ssdm_op_BitConcatenate.i6.i2.i4(i2 %glPLTminus1SliceIdx_1, i4 0)
  %p_shl3_cast = zext i6 %tmp_20 to i11
  %tmp_21 = sub i11 %p_shl2_cast, %p_shl3_cast
  %glPLTminus2SliceIdx_1 = load i2* @glPLTminus2SliceIdx_s, align 1
  %tmp_23 = call i10 @_ssdm_op_BitConcatenate.i10.i2.i8(i2 %glPLTminus2SliceIdx_1, i8 0)
  %p_shl_cast = zext i10 %tmp_23 to i11
  %tmp_24 = call i6 @_ssdm_op_BitConcatenate.i6.i2.i4(i2 %glPLTminus2SliceIdx_1, i4 0)
  %p_shl1_cast = zext i6 %tmp_24 to i11
  %tmp_25 = sub i11 %p_shl_cast, %p_shl1_cast
  br label %1

; <label>:1                                       ; preds = %8, %0
  %k = phi i5 [ 0, %0 ], [ %k_1, %8 ]
  %phi_mul = phi i10 [ 0, %0 ], [ %next_mul, %8 ]
  %next_mul = add i10 %phi_mul, 23
  %exitcond1 = icmp eq i5 %k, -9
  call void (...)* @_ssdm_op_SpecLoopTripCount(i64 23, i64 23, i64 23)
  %k_1 = add i5 %k, 1
  br i1 %exitcond1, label %9, label %2

; <label>:2                                       ; preds = %1
  call void (...)* @_ssdm_op_SpecLoopName([18 x i8]* @p_str10) nounwind
  %tmp_18 = call i32 (...)* @_ssdm_op_SpecRegionBegin([18 x i8]* @p_str10) nounwind
  %tmp_26 = zext i5 %k to i11
  %tmp_27 = trunc i16 %x_read to i11
  %tmp_28 = add i11 %tmp_27, %tmp_26
  %tmp_29 = add i11 %tmp_21, %tmp_28
  %tmp_34_cast = sext i11 %tmp_29 to i64
  %glPLSlices_V_addr = getelementptr [720 x i720]* @glPLSlices_V, i64 0, i64 %tmp_34_cast
  %tmp_30 = add i11 %tmp_25, %tmp_28
  %tmp_35_cast = sext i11 %tmp_30 to i64
  %glPLSlices_V_addr_1 = getelementptr [720 x i720]* @glPLSlices_V, i64 0, i64 %tmp_35_cast
  %tmp1_V = load i720* %glPLSlices_V_addr, align 16
  %tmp2_V = load i720* %glPLSlices_V_addr_1, align 16
  br label %3

; <label>:3                                       ; preds = %7, %2
  %l = phi i5 [ 0, %2 ], [ %l_1, %7 ]
  %exitcond2 = icmp eq i5 %l, -9
  call void (...)* @_ssdm_op_SpecLoopTripCount(i64 23, i64 23, i64 23)
  %l_1 = add i5 %l, 1
  br i1 %exitcond2, label %8, label %4

; <label>:4                                       ; preds = %3
  call void (...)* @_ssdm_op_SpecLoopName([20 x i8]* @p_str11) nounwind
  %tmp_22 = call i32 (...)* @_ssdm_op_SpecRegionBegin([20 x i8]* @p_str11) nounwind
  br label %5

; <label>:5                                       ; preds = %6, %4
  %yIndex = phi i3 [ 0, %4 ], [ %yIndex_1, %6 ]
  %exitcond = icmp eq i3 %yIndex, -4
  call void (...)* @_ssdm_op_SpecLoopTripCount(i64 4, i64 4, i64 4)
  %yIndex_1 = add i3 %yIndex, 1
  br i1 %exitcond, label %7, label %6

; <label>:6                                       ; preds = %5
  %p_Val2_load_1 = load i4* %p_Val2_s
  %p_Val2_1_load_1 = load i4* %p_Val2_1
  call void (...)* @_ssdm_op_SpecLoopName([19 x i8]* @p_str12) nounwind
  %bvh_d_index = zext i3 %yIndex to i32
  %index_assign_cast = zext i3 %yIndex to i17
  %bvh_d_index_1 = add i17 %index_assign_cast, %tmp_s
  %index_assign_1_cast = zext i17 %bvh_d_index_1 to i32
  %p_Repl2_s = call i1 @_ssdm_op_BitSelect.i1.i720.i32(i720 %tmp1_V, i32 %index_assign_1_cast)
  %val_assign_cast = zext i1 %p_Repl2_s to i64
  %p_Result_s = call i4 @_ssdm_op_BitSet.i4.i4.i32.i64(i4 %p_Val2_1_load_1, i32 %bvh_d_index, i64 %val_assign_cast)
  %p_Repl2_1 = call i1 @_ssdm_op_BitSelect.i1.i720.i32(i720 %tmp2_V, i32 %index_assign_1_cast)
  %val_assign_1_cast = zext i1 %p_Repl2_1 to i64
  %p_Result_1 = call i4 @_ssdm_op_BitSet.i4.i4.i32.i64(i4 %p_Val2_load_1, i32 %bvh_d_index, i64 %val_assign_1_cast)
  store i4 %p_Result_s, i4* %p_Val2_1
  store i4 %p_Result_1, i4* %p_Val2_s
  br label %5

; <label>:7                                       ; preds = %5
  %p_Val2_load = load i4* %p_Val2_s
  %p_Val2_1_load = load i4* %p_Val2_1
  %tmp_23_cast = zext i5 %l to i10
  %tmp_31 = add i10 %phi_mul, %tmp_23_cast
  %tmp_37_cast = zext i10 %tmp_31 to i64
  %refBlock_V_addr = getelementptr [529 x i4]* @refBlock_V, i64 0, i64 %tmp_37_cast
  %targetBlocks_V_addr = getelementptr [529 x i4]* @targetBlocks_V, i64 0, i64 %tmp_37_cast
  store i4 %p_Val2_1_load, i4* %refBlock_V_addr, align 1
  store i4 %p_Val2_load, i4* %targetBlocks_V_addr, align 1
  %empty = call i32 (...)* @_ssdm_op_SpecRegionEnd([20 x i8]* @p_str11, i32 %tmp_22) nounwind
  br label %3

; <label>:8                                       ; preds = %3
  %empty_6 = call i32 (...)* @_ssdm_op_SpecRegionEnd([18 x i8]* @p_str10, i32 %tmp_18) nounwind
  br label %1

; <label>:9                                       ; preds = %1
  ret void
}

define internal fastcc void @accumulateHW(i16 signext %x, i16 signext %y, i1 zeroext %pol) nounwind uwtable {
  %pol_read = call i1 @_ssdm_op_Read.ap_auto.i1(i1 %pol) nounwind
  %y_read = call i16 @_ssdm_op_Read.ap_auto.i16(i16 %y) nounwind
  %x_read = call i16 @_ssdm_op_Read.ap_auto.i16(i16 %x) nounwind
  br i1 %pol_read, label %1, label %._crit_edge

; <label>:1                                       ; preds = %0
  %tmp = trunc i16 %x_read to i11
  %glPLActiveSliceIdx_V_2 = load i2* @glPLActiveSliceIdx_V, align 1
  %tmp_32 = call i10 @_ssdm_op_BitConcatenate.i10.i2.i8(i2 %glPLActiveSliceIdx_V_2, i8 0)
  %p_shl_cast = zext i10 %tmp_32 to i11
  %tmp_33 = call i6 @_ssdm_op_BitConcatenate.i6.i2.i4(i2 %glPLActiveSliceIdx_V_2, i4 0)
  %p_shl1_cast = zext i6 %tmp_33 to i11
  %tmp_34 = sub i11 %p_shl_cast, %p_shl1_cast
  %tmp_35 = add i11 %tmp, %tmp_34
  %tmp_41_cast = sext i11 %tmp_35 to i64
  %glPLSlices_V_addr = getelementptr [720 x i720]* @glPLSlices_V, i64 0, i64 %tmp_41_cast
  %tmpData_V_1 = load i720* %glPLSlices_V_addr, align 16
  %tmp_36 = trunc i16 %y_read to i15
  %tmp_s = call i17 @_ssdm_op_BitConcatenate.i17.i15.i2(i15 %tmp_36, i2 0)
  br label %2

; <label>:2                                       ; preds = %3, %1
  %p_Val2_4 = phi i4 [ undef, %1 ], [ %p_Result_s, %3 ]
  %yIndex = phi i3 [ 0, %1 ], [ %yIndex_2, %3 ]
  %exitcond3 = icmp eq i3 %yIndex, -4
  call void (...)* @_ssdm_op_SpecLoopTripCount(i64 4, i64 4, i64 4)
  %yIndex_2 = add i3 %yIndex, 1
  br i1 %exitcond3, label %4, label %3

; <label>:3                                       ; preds = %2
  call void (...)* @_ssdm_op_SpecLoopName([20 x i8]* @p_str) nounwind
  %bvh_d_index = zext i3 %yIndex to i32
  %index_assign_cast = zext i3 %yIndex to i17
  %bvh_d_index_2 = add i17 %index_assign_cast, %tmp_s
  %index_assign_2_cast = zext i17 %bvh_d_index_2 to i32
  %p_Repl2_s = call i1 @_ssdm_op_BitSelect.i1.i720.i32(i720 %tmpData_V_1, i32 %index_assign_2_cast)
  %val_assign_cast = zext i1 %p_Repl2_s to i64
  %p_Result_s = call i4 @_ssdm_op_BitSet.i4.i4.i32.i64(i4 %p_Val2_4, i32 %bvh_d_index, i64 %val_assign_cast)
  br label %2

; <label>:4                                       ; preds = %2
  %tmpTmpData_V = add i4 %p_Val2_4, 1
  br label %5

; <label>:5                                       ; preds = %6, %4
  %p_Val2_6 = phi i720 [ %tmpData_V_1, %4 ], [ %p_Result_2, %6 ]
  %yIndex1 = phi i3 [ 0, %4 ], [ %yIndex_3, %6 ]
  %exitcond = icmp eq i3 %yIndex1, -4
  call void (...)* @_ssdm_op_SpecLoopTripCount(i64 4, i64 4, i64 4)
  %yIndex_3 = add i3 %yIndex1, 1
  br i1 %exitcond, label %7, label %6

; <label>:6                                       ; preds = %5
  call void (...)* @_ssdm_op_SpecLoopName([20 x i8]* @p_str5) nounwind
  %bvh_d_index_4 = zext i3 %yIndex1 to i32
  %index_assign_4_cast = zext i3 %yIndex1 to i17
  %bvh_d_index_3 = add i17 %index_assign_4_cast, %tmp_s
  %index_assign_3_cast = zext i17 %bvh_d_index_3 to i32
  %tmp_39 = call i1 @_ssdm_op_BitSelect.i1.i4.i32(i4 %tmpTmpData_V, i32 %bvh_d_index_4)
  %p_Repl2_2 = zext i1 %tmp_39 to i64
  %p_Result_2 = call i720 @_ssdm_op_BitSet.i720.i720.i32.i64(i720 %p_Val2_6, i32 %index_assign_3_cast, i64 %p_Repl2_2)
  br label %5

; <label>:7                                       ; preds = %5
  store i720 %p_Val2_6, i720* %glPLSlices_V_addr, align 16
  br label %._crit_edge

._crit_edge:                                      ; preds = %7, %0
  ret void
}

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

define weak i32 @_ssdm_op_Read.ap_fifo.volatile.i32P(i32*) {
entry:
  %empty = call i32 @_autotb_FifoRead_i32(i32* %0)
  ret i32 %empty
}

define weak i32 @_ssdm_op_Read.ap_auto.i32(i32) {
entry:
  ret i32 %0
}

define weak i16 @_ssdm_op_Read.ap_auto.i16(i16) {
entry:
  ret i16 %0
}

define weak i1 @_ssdm_op_Read.ap_auto.i1(i1) {
entry:
  ret i1 %0
}

declare i8 @_ssdm_op_PartSelect.i8.i32.i32.i32(i32, i32, i32) nounwind readnone

declare i6 @_ssdm_op_PartSelect.i6.i32.i32.i32(i32, i32, i32) nounwind readnone

declare i31 @_ssdm_op_PartSelect.i31.i32.i32.i32(i32, i32, i32) nounwind readnone

define weak i15 @_ssdm_op_PartSelect.i15.i32.i32.i32(i32, i32, i32) nounwind readnone {
entry:
  %empty = call i32 @llvm.part.select.i32(i32 %0, i32 %1, i32 %2)
  %empty_7 = trunc i32 %empty to i15
  ret i15 %empty_7
}

declare i15 @_ssdm_op_PartSelect.i15.i16.i32.i32(i16, i32, i32) nounwind readnone

declare i11 @_ssdm_op_PartSelect.i11.i16.i32.i32(i16, i32, i32) nounwind readnone

define weak i720 @_ssdm_op_BitSet.i720.i720.i32.i64(i720, i32, i64) nounwind readnone {
entry:
  %empty = icmp ne i64 %2, 0
  %empty_8 = zext i1 %empty to i720
  %empty_9 = zext i32 %1 to i720
  %empty_10 = shl i720 %empty_8, %empty_9
  %empty_11 = shl i720 1, %empty_9
  %empty_12 = xor i720 %empty_11, -1
  %empty_13 = and i720 %empty_12, %0
  %empty_14 = or i720 %empty_10, %empty_13
  ret i720 %empty_14
}

define weak i4 @_ssdm_op_BitSet.i4.i4.i32.i64(i4, i32, i64) nounwind readnone {
entry:
  %empty = icmp ne i64 %2, 0
  %empty_15 = zext i1 %empty to i4
  %empty_16 = trunc i32 %1 to i4
  %empty_17 = shl i4 %empty_15, %empty_16
  %empty_18 = shl i4 1, %empty_16
  %empty_19 = xor i4 %empty_18, -1
  %empty_20 = and i4 %empty_19, %0
  %empty_21 = or i4 %empty_17, %empty_20
  ret i4 %empty_21
}

define weak i1 @_ssdm_op_BitSelect.i1.i720.i32(i720, i32) nounwind readnone {
entry:
  %empty = zext i32 %1 to i720
  %empty_22 = shl i720 1, %empty
  %empty_23 = and i720 %0, %empty_22
  %empty_24 = icmp ne i720 %empty_23, 0
  ret i1 %empty_24
}

define weak i1 @_ssdm_op_BitSelect.i1.i4.i32(i4, i32) nounwind readnone {
entry:
  %empty = trunc i32 %1 to i4
  %empty_25 = shl i4 1, %empty
  %empty_26 = and i4 %0, %empty_25
  %empty_27 = icmp ne i4 %empty_26, 0
  ret i1 %empty_27
}

define weak i1 @_ssdm_op_BitSelect.i1.i32.i32(i32, i32) nounwind readnone {
entry:
  %empty = shl i32 1, %1
  %empty_28 = and i32 %0, %empty
  %empty_29 = icmp ne i32 %empty_28, 0
  ret i1 %empty_29
}

define weak i6 @_ssdm_op_BitConcatenate.i6.i2.i4(i2, i4) nounwind readnone {
entry:
  %empty = zext i2 %0 to i6
  %empty_30 = zext i4 %1 to i6
  %empty_31 = shl i6 %empty, 4
  %empty_32 = or i6 %empty_31, %empty_30
  ret i6 %empty_32
}

declare i32 @_ssdm_op_BitConcatenate.i32.i31.i1(i31, i1) nounwind readnone

define weak i23 @_ssdm_op_BitConcatenate.i23.i15.i8(i15, i8) nounwind readnone {
entry:
  %empty = zext i15 %0 to i23
  %empty_33 = zext i8 %1 to i23
  %empty_34 = shl i23 %empty, 8
  %empty_35 = or i23 %empty_34, %empty_33
  ret i23 %empty_35
}

define weak i2 @_ssdm_op_BitConcatenate.i2.i1.i1(i1, i1) nounwind readnone {
entry:
  %empty = zext i1 %0 to i2
  %empty_36 = zext i1 %1 to i2
  %empty_37 = shl i2 %empty, 1
  %empty_38 = or i2 %empty_37, %empty_36
  ret i2 %empty_38
}

define weak i17 @_ssdm_op_BitConcatenate.i17.i15.i2(i15, i2) nounwind readnone {
entry:
  %empty = zext i15 %0 to i17
  %empty_39 = zext i2 %1 to i17
  %empty_40 = shl i17 %empty, 2
  %empty_41 = or i17 %empty_40, %empty_39
  ret i17 %empty_41
}

define weak i17 @_ssdm_op_BitConcatenate.i17.i1.i16(i1, i16) nounwind readnone {
entry:
  %empty = zext i1 %0 to i17
  %empty_42 = zext i16 %1 to i17
  %empty_43 = shl i17 %empty, 16
  %empty_44 = or i17 %empty_43, %empty_42
  ret i17 %empty_44
}

define weak i11 @_ssdm_op_BitConcatenate.i11.i8.i3(i8, i3) nounwind readnone {
entry:
  %empty = zext i8 %0 to i11
  %empty_45 = zext i3 %1 to i11
  %empty_46 = shl i11 %empty, 3
  %empty_47 = or i11 %empty_46, %empty_45
  ret i11 %empty_47
}

define weak i11 @_ssdm_op_BitConcatenate.i11.i6.i5(i6, i5) nounwind readnone {
entry:
  %empty = zext i6 %0 to i11
  %empty_48 = zext i5 %1 to i11
  %empty_49 = shl i11 %empty, 5
  %empty_50 = or i11 %empty_49, %empty_48
  ret i11 %empty_50
}

define weak i10 @_ssdm_op_BitConcatenate.i10.i2.i8(i2, i8) nounwind readnone {
entry:
  %empty = zext i2 %0 to i10
  %empty_51 = zext i8 %1 to i10
  %empty_52 = shl i10 %empty, 8
  %empty_53 = or i10 %empty_52, %empty_51
  ret i10 %empty_53
}

declare i32 @_autotb_FifoWrite_i32(i32*, i32)

declare i32 @_autotb_FifoRead_i32(i32*)

declare void @_GLOBAL__I_a() nounwind

!opencl.kernels = !{!0, !7, !13, !19, !7, !25, !7, !7, !7, !28, !28, !34, !34, !36, !39, !39, !7, !41, !7, !7, !7, !28, !28, !43, !43, !7, !7, !45, !7, !7, !7, !28, !28, !47, !47, !49, !51, !51, !7, !53, !7, !7, !7, !28, !28, !55, !55, !57, !57, !7, !7, !59, !62, !64, !65, !57, !57, !7, !7, !67, !7, !69, !71, !64, !73, !7, !69, !75, !77, !77, !75, !81, !81, !83, !7, !7, !7, !7, !7, !7, !7, !7, !7}
!hls.encrypted.func = !{}
!llvm.map.gv = !{!85, !92, !99, !104, !109, !114, !115}

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
!13 = metadata !{void (i16, i16)* @calcOF, metadata !14, metadata !15, metadata !16, metadata !17, metadata !18, metadata !6}
!14 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0}
!15 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none"}
!16 = metadata !{metadata !"kernel_arg_type", metadata !"int16_t", metadata !"int16_t"}
!17 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !""}
!18 = metadata !{metadata !"kernel_arg_name", metadata !"x", metadata !"y"}
!19 = metadata !{void (i32*, i32, i32*)* @parseEvents, metadata !20, metadata !21, metadata !22, metadata !23, metadata !24, metadata !6}
!20 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 0, i32 1}
!21 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none"}
!22 = metadata !{metadata !"kernel_arg_type", metadata !"uint32_t*", metadata !"int32_t", metadata !"int32_t*"}
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
!46 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<17, true> &", metadata !"const ap_int_base<4, true> &"}
!47 = metadata !{null, metadata !29, metadata !30, metadata !48, metadata !32, metadata !33, metadata !6}
!48 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<17, true> &"}
!49 = metadata !{null, metadata !14, metadata !15, metadata !50, metadata !17, metadata !38, metadata !6}
!50 = metadata !{metadata !"kernel_arg_type", metadata !"short", metadata !"const ap_int_base<4, true> &"}
!51 = metadata !{null, metadata !29, metadata !30, metadata !52, metadata !32, metadata !33, metadata !6}
!52 = metadata !{metadata !"kernel_arg_type", metadata !"short"}
!53 = metadata !{null, metadata !14, metadata !15, metadata !54, metadata !17, metadata !27, metadata !6}
!54 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<16, true> &", metadata !"const ap_int_base<4, true> &"}
!55 = metadata !{null, metadata !29, metadata !30, metadata !56, metadata !32, metadata !33, metadata !6}
!56 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<16, true> &"}
!57 = metadata !{null, metadata !29, metadata !30, metadata !40, metadata !32, metadata !58, metadata !6}
!58 = metadata !{metadata !"kernel_arg_name", metadata !"val"}
!59 = metadata !{null, metadata !29, metadata !30, metadata !60, metadata !32, metadata !61, metadata !6}
!60 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<2> &"}
!61 = metadata !{metadata !"kernel_arg_name", metadata !"op2"}
!62 = metadata !{null, metadata !14, metadata !15, metadata !63, metadata !17, metadata !27, metadata !6}
!63 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<2, false> &", metadata !"int"}
!64 = metadata !{null, metadata !29, metadata !30, metadata !44, metadata !32, metadata !61, metadata !6}
!65 = metadata !{null, metadata !29, metadata !30, metadata !66, metadata !32, metadata !61, metadata !6}
!66 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int<4> &"}
!67 = metadata !{null, metadata !29, metadata !30, metadata !68, metadata !32, metadata !58, metadata !6}
!68 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_bit_ref<4, true> &"}
!69 = metadata !{null, metadata !29, metadata !30, metadata !70, metadata !32, metadata !58, metadata !6}
!70 = metadata !{metadata !"kernel_arg_type", metadata !"ulong long"}
!71 = metadata !{null, metadata !14, metadata !15, metadata !72, metadata !17, metadata !27, metadata !6}
!72 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<4, true> &", metadata !"int"}
!73 = metadata !{null, metadata !29, metadata !30, metadata !74, metadata !32, metadata !58, metadata !6}
!74 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_bit_ref<720, true> &"}
!75 = metadata !{null, metadata !29, metadata !30, metadata !40, metadata !32, metadata !76, metadata !6}
!76 = metadata !{metadata !"kernel_arg_name", metadata !"index"}
!77 = metadata !{null, metadata !78, metadata !15, metadata !79, metadata !17, metadata !80, metadata !6}
!78 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 0}
!79 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<720, true>*", metadata !"int"}
!80 = metadata !{metadata !"kernel_arg_name", metadata !"bv", metadata !"index"}
!81 = metadata !{null, metadata !78, metadata !15, metadata !82, metadata !17, metadata !80, metadata !6}
!82 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<4, true>*", metadata !"int"}
!83 = metadata !{null, metadata !29, metadata !30, metadata !84, metadata !32, metadata !61, metadata !6}
!84 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int<720> &"}
!85 = metadata !{metadata !86, null}
!86 = metadata !{metadata !87}
!87 = metadata !{i32 0, i32 3, metadata !88}
!88 = metadata !{metadata !89}
!89 = metadata !{metadata !"targetBlocks.V", metadata !90, metadata !"int4", i32 0, i32 3}
!90 = metadata !{metadata !91, metadata !91}
!91 = metadata !{i32 0, i32 22, i32 1}
!92 = metadata !{metadata !93, i16* @sum}
!93 = metadata !{metadata !94}
!94 = metadata !{i32 0, i32 15, metadata !95}
!95 = metadata !{metadata !96}
!96 = metadata !{metadata !"sum", metadata !97, metadata !"short", i32 0, i32 15}
!97 = metadata !{metadata !98}
!98 = metadata !{i32 0, i32 0, i32 1}
!99 = metadata !{metadata !100, null}
!100 = metadata !{metadata !101}
!101 = metadata !{i32 0, i32 3, metadata !102}
!102 = metadata !{metadata !103}
!103 = metadata !{metadata !"refBlock.V", metadata !90, metadata !"int4", i32 0, i32 3}
!104 = metadata !{metadata !105, i32* @partFactor}
!105 = metadata !{metadata !106}
!106 = metadata !{i32 0, i32 31, metadata !107}
!107 = metadata !{metadata !108}
!108 = metadata !{metadata !"partFactor", metadata !97, metadata !"int", i32 0, i32 31}
!109 = metadata !{metadata !110, [1 x i32]* @llvm_global_ctors_0}
!110 = metadata !{metadata !111}
!111 = metadata !{i32 0, i32 31, metadata !112}
!112 = metadata !{metadata !113}
!113 = metadata !{metadata !"llvm.global_ctors.0", metadata !97, metadata !"", i32 0, i32 31}
!114 = metadata !{metadata !86, [529 x i4]* @targetBlocks_V}
!115 = metadata !{metadata !100, [529 x i4]* @refBlock_V}
!116 = metadata !{metadata !117}
!117 = metadata !{i32 0, i32 31, metadata !118}
!118 = metadata !{metadata !119}
!119 = metadata !{metadata !"data", metadata !97, metadata !"unsigned int", i32 0, i32 31}
!120 = metadata !{metadata !121}
!121 = metadata !{i32 0, i32 31, metadata !122}
!122 = metadata !{metadata !123}
!123 = metadata !{metadata !"eventsArraySize", metadata !124, metadata !"int", i32 0, i32 31}
!124 = metadata !{metadata !125}
!125 = metadata !{i32 0, i32 0, i32 0}
!126 = metadata !{metadata !127}
!127 = metadata !{i32 0, i32 31, metadata !128}
!128 = metadata !{metadata !129}
!129 = metadata !{metadata !"eventSlice", metadata !97, metadata !"int", i32 0, i32 31}
