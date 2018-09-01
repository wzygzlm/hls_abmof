; ModuleID = 'E:/xfOpenCV/hls_2018_1/abmofParseEvents/solution5/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-w64-mingw32"

@targetBlocks_V = constant [225 x i4] zeroinitializer
@sum = global i16 0, align 2
@refBlock_V = constant [225 x i4] zeroinitializer
@partFactor = global i32 6, align 4
@parseEvents_str = internal unnamed_addr constant [12 x i8] c"parseEvents\00"
@llvm_global_ctors_1 = appending global [1 x void ()*] [void ()* @_GLOBAL__I_a]
@llvm_global_ctors_0 = appending global [1 x i32] [i32 65535]
@glPLSlice2_V_3 = internal global [240 x i180] zeroinitializer
@glPLSlice2_V_2 = internal global [240 x i180] zeroinitializer
@glPLSlice2_V_1 = internal global [240 x i180] zeroinitializer
@glPLSlice2_V_0 = internal global [240 x i180] zeroinitializer
@glPLSlice1_V_3 = internal global [240 x i180] zeroinitializer
@glPLSlice1_V_2 = internal global [240 x i180] zeroinitializer
@glPLSlice1_V_1 = internal global [240 x i180] zeroinitializer
@glPLSlice1_V_0 = internal global [240 x i180] zeroinitializer
@glPLSlice0_V_3 = internal global [240 x i180] zeroinitializer
@glPLSlice0_V_2 = internal global [240 x i180] zeroinitializer
@glPLSlice0_V_1 = internal global [240 x i180] zeroinitializer
@glPLSlice0_V_0 = internal global [240 x i180] zeroinitializer
@glPLActiveSliceIdx_V = internal unnamed_addr global i2 0
@glCnt = internal unnamed_addr global i16 0, align 2
@p_str13 = private unnamed_addr constant [12 x i8] c"Cond_Region\00", align 1
@p_str12 = private unnamed_addr constant [7 x i8] c"loop_1\00", align 1
@p_str11 = private unnamed_addr constant [8 x i8] c"ap_fifo\00", align 1
@p_str10 = private unnamed_addr constant [13 x i8] c"RAM_T2P_BRAM\00", align 1
@p_str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1

define void @parseEvents(i64* %data, i32 %eventsArraySize, i32* %eventSlice) nounwind uwtable {
  call void (...)* @_ssdm_op_SpecBitsMap(i64* %data) nounwind, !map !131
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %eventsArraySize) nounwind, !map !135
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %eventSlice) nounwind, !map !141
  call void (...)* @_ssdm_op_SpecTopModule([12 x i8]* @parseEvents_str) nounwind
  %eventsArraySize_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %eventsArraySize) nounwind
  call void (...)* @_ssdm_op_SpecMemCore([240 x i180]* @glPLSlice2_V_0, [240 x i180]* @glPLSlice2_V_1, [240 x i180]* @glPLSlice2_V_2, [240 x i180]* @glPLSlice2_V_3, [1 x i8]* @p_str, [13 x i8]* @p_str10, [1 x i8]* @p_str, i32 -1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str) nounwind
  call void (...)* @_ssdm_op_SpecMemCore([240 x i180]* @glPLSlice1_V_0, [240 x i180]* @glPLSlice1_V_1, [240 x i180]* @glPLSlice1_V_2, [240 x i180]* @glPLSlice1_V_3, [1 x i8]* @p_str, [13 x i8]* @p_str10, [1 x i8]* @p_str, i32 -1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str) nounwind
  call void (...)* @_ssdm_op_SpecMemCore([240 x i180]* @glPLSlice0_V_0, [240 x i180]* @glPLSlice0_V_1, [240 x i180]* @glPLSlice0_V_2, [240 x i180]* @glPLSlice0_V_3, [1 x i8]* @p_str, [13 x i8]* @p_str10, [1 x i8]* @p_str, i32 -1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i64* %data, [8 x i8]* @p_str11, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32* %eventSlice, [8 x i8]* @p_str11, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str) nounwind
  %glPLActiveSliceIdx_V_1 = load i2* @glPLActiveSliceIdx_V, align 1
  %tmp = icmp eq i2 %glPLActiveSliceIdx_V_1, 0
  br i1 %tmp, label %1, label %2

; <label>:1                                       ; preds = %0
  store i2 1, i2* @glPLActiveSliceIdx_V, align 1
  br label %._crit_edge

; <label>:2                                       ; preds = %0
  %tmp_1 = icmp eq i2 %glPLActiveSliceIdx_V_1, 1
  br i1 %tmp_1, label %3, label %4

; <label>:3                                       ; preds = %2
  store i2 -2, i2* @glPLActiveSliceIdx_V, align 1
  br label %._crit_edge

; <label>:4                                       ; preds = %2
  %tmp_2 = icmp eq i2 %glPLActiveSliceIdx_V_1, -2
  br i1 %tmp_2, label %5, label %._crit_edge

; <label>:5                                       ; preds = %4
  store i2 0, i2* @glPLActiveSliceIdx_V, align 1
  br label %._crit_edge

._crit_edge:                                      ; preds = %5, %4, %3, %1
  %glPLActiveSliceIdx_V_2 = phi i2 [ 1, %1 ], [ -2, %3 ], [ 0, %5 ], [ %glPLActiveSliceIdx_V_1, %4 ]
  %i_op_assign = alloca i16
  %tmp_s = icmp eq i2 %glPLActiveSliceIdx_V_2, 0
  %tmp_7 = icmp eq i2 %glPLActiveSliceIdx_V_2, 1
  %tmp_9 = icmp eq i2 %glPLActiveSliceIdx_V_2, -2
  br label %6

; <label>:6                                       ; preds = %accumulateHW.exit_ifconv, %._crit_edge
  %p_019_rec = phi i31 [ 0, %._crit_edge ], [ %i, %accumulateHW.exit_ifconv ]
  %i_cast = zext i31 %p_019_rec to i32
  %tmp_3 = icmp slt i32 %i_cast, %eventsArraySize_read
  %i = add i31 %p_019_rec, 1
  br i1 %tmp_3, label %7, label %19

; <label>:7                                       ; preds = %6
  call void (...)* @_ssdm_op_SpecLoopName([7 x i8]* @p_str12) nounwind
  %tmp_4 = call i32 (...)* @_ssdm_op_SpecRegionBegin([7 x i8]* @p_str12) nounwind
  call void (...)* @_ssdm_op_SpecPipeline(i32 -1, i32 1, i32 1, i32 0, [1 x i8]* @p_str) nounwind
  call void (...)* @_ssdm_op_SpecLoopTripCount(i32 0, i32 10000, i32 5000, [1 x i8]* @p_str) nounwind
  %tmp_5 = call i64 @_ssdm_op_Read.ap_fifo.volatile.i64P(i64* %data) nounwind
  %x = call i9 @_ssdm_op_PartSelect.i9.i64.i32.i32(i64 %tmp_5, i32 17, i32 25)
  %y = call i9 @_ssdm_op_PartSelect.i9.i64.i32.i32(i64 %tmp_5, i32 2, i32 10)
  %tmp_14 = call i1 @_ssdm_op_BitSelect.i1.i64.i32(i64 %tmp_5, i32 1)
  %tmp_6 = call i32 (...)* @_ssdm_op_SpecRegionBegin([12 x i8]* @p_str13) nounwind
  call void (...)* @_ssdm_op_SpecOccurrence(i32 5000, [1 x i8]* @p_str) nounwind
  %empty = call i32 (...)* @_ssdm_op_SpecRegionEnd([12 x i8]* @p_str13, i32 %tmp_6) nounwind
  %tmp_8 = call i8 @_ssdm_op_PartSelect.i8.i64.i32.i32(i64 %tmp_5, i32 17, i32 24)
  %tmp_10 = call i10 @_ssdm_op_BitConcatenate.i10.i8.i2(i8 %tmp_8, i2 0)
  %tmp_12_cast = zext i9 %y to i10
  %tmp_11 = call i7 @_ssdm_op_PartSelect.i7.i64.i32.i32(i64 %tmp_5, i32 4, i32 10)
  %tmp_12 = call i9 @_ssdm_op_BitConcatenate.i9.i7.i2(i7 %tmp_11, i2 0)
  %tmp_14_cast = sext i9 %tmp_12 to i10
  %p_0505_0_i = sub i10 %tmp_10, %tmp_14_cast
  %tmp_13 = call i2 @_ssdm_op_PartSelect.i2.i64.i32.i32(i64 %tmp_5, i32 2, i32 3)
  %xNewIdx_V = add i10 %tmp_12_cast, %p_0505_0_i
  br i1 %tmp_14, label %8, label %accumulateHW.exit_ifconv

; <label>:8                                       ; preds = %7
  br i1 %tmp_s, label %9, label %11

; <label>:9                                       ; preds = %8
  %newIndex1 = call i8 @_ssdm_op_PartSelect.i8.i10.i32.i32(i10 %xNewIdx_V, i32 2, i32 9)
  %newIndex2 = zext i8 %newIndex1 to i64
  %glPLSlice0_V_0_addr = getelementptr [240 x i180]* @glPLSlice0_V_0, i64 0, i64 %newIndex2
  %glPLSlice0_V_1_addr = getelementptr [240 x i180]* @glPLSlice0_V_1, i64 0, i64 %newIndex2
  %glPLSlice0_V_2_addr = getelementptr [240 x i180]* @glPLSlice0_V_2, i64 0, i64 %newIndex2
  %glPLSlice0_V_3_addr = getelementptr [240 x i180]* @glPLSlice0_V_3, i64 0, i64 %newIndex2
  %glPLSlice0_V_0_load = load i180* %glPLSlice0_V_0_addr, align 8
  %glPLSlice0_V_1_load = load i180* %glPLSlice0_V_1_addr, align 8
  %glPLSlice0_V_2_load = load i180* %glPLSlice0_V_2_addr, align 8
  %glPLSlice0_V_3_load = load i180* %glPLSlice0_V_3_addr, align 8
  %tmpData_V = call i180 @_ssdm_op_Mux.ap_auto.4i180.i2(i180 %glPLSlice0_V_0_load, i180 %glPLSlice0_V_1_load, i180 %glPLSlice0_V_2_load, i180 %glPLSlice0_V_3_load, i2 %tmp_13) nounwind
  %tmp_18_cast = sext i9 %tmp_12 to i32
  %tmp_15 = call i1 @_ssdm_op_BitSelect.i1.i180.i32(i180 %tmpData_V, i32 %tmp_18_cast)
  %index_assign_1_s = or i32 %tmp_18_cast, 1
  %tmp_16 = call i1 @_ssdm_op_BitSelect.i1.i180.i32(i180 %tmpData_V, i32 %index_assign_1_s)
  %index_assign_1_1 = or i9 %tmp_12, 2
  %index_assign_1_1_cas = sext i9 %index_assign_1_1 to i32
  %tmp_17 = call i1 @_ssdm_op_BitSelect.i1.i180.i32(i180 %tmpData_V, i32 %index_assign_1_1_cas)
  %index_assign_1_2 = or i9 %tmp_12, 3
  %index_assign_1_2_cas = sext i9 %index_assign_1_2 to i32
  %tmp_18 = call i1 @_ssdm_op_BitSelect.i1.i180.i32(i180 %tmpData_V, i32 %index_assign_1_2_cas)
  %p_Result_12_3 = call i4 @_ssdm_op_BitConcatenate.i4.i1.i1.i1.i1(i1 %tmp_18, i1 %tmp_17, i1 %tmp_16, i1 %tmp_15)
  %tmpTmpData_V = add i4 1, %p_Result_12_3
  %tmp_19 = trunc i4 %tmpTmpData_V to i1
  %p_Repl2_2 = zext i1 %tmp_19 to i64
  %tmp_20 = call i180 @_ssdm_op_BitSet.i180.i180.i32.i64(i180 %tmpData_V, i32 %tmp_18_cast, i64 %p_Repl2_2)
  %tmp_21 = call i1 @_ssdm_op_BitSelect.i1.i4.i32(i4 %tmpTmpData_V, i32 1)
  %p_Repl2_2_1 = zext i1 %tmp_21 to i64
  %tmp_22 = call i180 @_ssdm_op_BitSet.i180.i180.i32.i64(i180 %tmp_20, i32 %index_assign_1_s, i64 %p_Repl2_2_1)
  %tmp_23 = call i1 @_ssdm_op_BitSelect.i1.i4.i32(i4 %tmpTmpData_V, i32 2)
  %p_Repl2_2_2 = zext i1 %tmp_23 to i64
  %tmp_24 = call i180 @_ssdm_op_BitSet.i180.i180.i32.i64(i180 %tmp_22, i32 %index_assign_1_1_cas, i64 %p_Repl2_2_2)
  %tmp_25 = call i1 @_ssdm_op_BitSelect.i1.i4.i32(i4 %tmpTmpData_V, i32 3)
  %p_Repl2_2_3 = zext i1 %tmp_25 to i64
  %tmp_29 = call i180 @_ssdm_op_BitSet.i180.i180.i32.i64(i180 %tmp_24, i32 %index_assign_1_2_cas, i64 %p_Repl2_2_3)
  switch i2 %tmp_13, label %branch11 [
    i2 0, label %branch8
    i2 1, label %branch9
    i2 -2, label %branch10
  ]

; <label>:10                                      ; preds = %branch11, %branch10, %branch9, %branch8
  br label %18

; <label>:11                                      ; preds = %8
  br i1 %tmp_7, label %12, label %14

; <label>:12                                      ; preds = %11
  %newIndex3 = call i8 @_ssdm_op_PartSelect.i8.i10.i32.i32(i10 %xNewIdx_V, i32 2, i32 9)
  %newIndex4 = zext i8 %newIndex3 to i64
  %glPLSlice1_V_0_addr = getelementptr [240 x i180]* @glPLSlice1_V_0, i64 0, i64 %newIndex4
  %glPLSlice1_V_1_addr = getelementptr [240 x i180]* @glPLSlice1_V_1, i64 0, i64 %newIndex4
  %glPLSlice1_V_2_addr = getelementptr [240 x i180]* @glPLSlice1_V_2, i64 0, i64 %newIndex4
  %glPLSlice1_V_3_addr = getelementptr [240 x i180]* @glPLSlice1_V_3, i64 0, i64 %newIndex4
  %glPLSlice1_V_0_load = load i180* %glPLSlice1_V_0_addr, align 8
  %glPLSlice1_V_1_load = load i180* %glPLSlice1_V_1_addr, align 8
  %glPLSlice1_V_2_load = load i180* %glPLSlice1_V_2_addr, align 8
  %glPLSlice1_V_3_load = load i180* %glPLSlice1_V_3_addr, align 8
  %tmpData_V_1 = call i180 @_ssdm_op_Mux.ap_auto.4i180.i2(i180 %glPLSlice1_V_0_load, i180 %glPLSlice1_V_1_load, i180 %glPLSlice1_V_2_load, i180 %glPLSlice1_V_3_load, i2 %tmp_13) nounwind
  %tmp_22_cast = sext i9 %tmp_12 to i32
  %tmp_31 = call i1 @_ssdm_op_BitSelect.i1.i180.i32(i180 %tmpData_V_1, i32 %tmp_22_cast)
  %index_assign_5_s = or i32 %tmp_22_cast, 1
  %tmp_33 = call i1 @_ssdm_op_BitSelect.i1.i180.i32(i180 %tmpData_V_1, i32 %index_assign_5_s)
  %index_assign_5_1 = or i9 %tmp_12, 2
  %index_assign_5_1_cas = sext i9 %index_assign_5_1 to i32
  %tmp_34 = call i1 @_ssdm_op_BitSelect.i1.i180.i32(i180 %tmpData_V_1, i32 %index_assign_5_1_cas)
  %index_assign_5_2 = or i9 %tmp_12, 3
  %index_assign_5_2_cas = sext i9 %index_assign_5_2 to i32
  %tmp_36 = call i1 @_ssdm_op_BitSelect.i1.i180.i32(i180 %tmpData_V_1, i32 %index_assign_5_2_cas)
  %p_Result_14_3 = call i4 @_ssdm_op_BitConcatenate.i4.i1.i1.i1.i1(i1 %tmp_36, i1 %tmp_34, i1 %tmp_33, i1 %tmp_31)
  %tmpTmpData_V_1 = add i4 1, %p_Result_14_3
  %tmp_37 = trunc i4 %tmpTmpData_V_1 to i1
  %p_Repl2_4 = zext i1 %tmp_37 to i64
  %tmp_38 = call i180 @_ssdm_op_BitSet.i180.i180.i32.i64(i180 %tmpData_V_1, i32 %tmp_22_cast, i64 %p_Repl2_4)
  %tmp_39 = call i1 @_ssdm_op_BitSelect.i1.i4.i32(i4 %tmpTmpData_V_1, i32 1)
  %p_Repl2_4_1 = zext i1 %tmp_39 to i64
  %tmp_40 = call i180 @_ssdm_op_BitSet.i180.i180.i32.i64(i180 %tmp_38, i32 %index_assign_5_s, i64 %p_Repl2_4_1)
  %tmp_41 = call i1 @_ssdm_op_BitSelect.i1.i4.i32(i4 %tmpTmpData_V_1, i32 2)
  %p_Repl2_4_2 = zext i1 %tmp_41 to i64
  %tmp_42 = call i180 @_ssdm_op_BitSet.i180.i180.i32.i64(i180 %tmp_40, i32 %index_assign_5_1_cas, i64 %p_Repl2_4_2)
  %tmp_43 = call i1 @_ssdm_op_BitSelect.i1.i4.i32(i4 %tmpTmpData_V_1, i32 3)
  %p_Repl2_4_3 = zext i1 %tmp_43 to i64
  %tmp_44 = call i180 @_ssdm_op_BitSet.i180.i180.i32.i64(i180 %tmp_42, i32 %index_assign_5_2_cas, i64 %p_Repl2_4_3)
  switch i2 %tmp_13, label %branch7 [
    i2 0, label %branch4
    i2 1, label %branch5
    i2 -2, label %branch6
  ]

; <label>:13                                      ; preds = %branch7, %branch6, %branch5, %branch4
  br label %17

; <label>:14                                      ; preds = %11
  br i1 %tmp_9, label %15, label %._crit_edge1.i

; <label>:15                                      ; preds = %14
  %newIndex = call i8 @_ssdm_op_PartSelect.i8.i10.i32.i32(i10 %xNewIdx_V, i32 2, i32 9)
  %newIndex5 = zext i8 %newIndex to i64
  %glPLSlice2_V_0_addr = getelementptr [240 x i180]* @glPLSlice2_V_0, i64 0, i64 %newIndex5
  %glPLSlice2_V_1_addr = getelementptr [240 x i180]* @glPLSlice2_V_1, i64 0, i64 %newIndex5
  %glPLSlice2_V_2_addr = getelementptr [240 x i180]* @glPLSlice2_V_2, i64 0, i64 %newIndex5
  %glPLSlice2_V_3_addr = getelementptr [240 x i180]* @glPLSlice2_V_3, i64 0, i64 %newIndex5
  %glPLSlice2_V_0_load = load i180* %glPLSlice2_V_0_addr, align 8
  %glPLSlice2_V_1_load = load i180* %glPLSlice2_V_1_addr, align 8
  %glPLSlice2_V_2_load = load i180* %glPLSlice2_V_2_addr, align 8
  %glPLSlice2_V_3_load = load i180* %glPLSlice2_V_3_addr, align 8
  %tmpData_V_2 = call i180 @_ssdm_op_Mux.ap_auto.4i180.i2(i180 %glPLSlice2_V_0_load, i180 %glPLSlice2_V_1_load, i180 %glPLSlice2_V_2_load, i180 %glPLSlice2_V_3_load, i2 %tmp_13) nounwind
  %tmp_27_cast = sext i9 %tmp_12 to i32
  %tmp_45 = call i1 @_ssdm_op_BitSelect.i1.i180.i32(i180 %tmpData_V_2, i32 %tmp_27_cast)
  %index_assign_9_s = or i32 %tmp_27_cast, 1
  %tmp_46 = call i1 @_ssdm_op_BitSelect.i1.i180.i32(i180 %tmpData_V_2, i32 %index_assign_9_s)
  %index_assign_9_1 = or i9 %tmp_12, 2
  %index_assign_9_1_cas = sext i9 %index_assign_9_1 to i32
  %tmp_47 = call i1 @_ssdm_op_BitSelect.i1.i180.i32(i180 %tmpData_V_2, i32 %index_assign_9_1_cas)
  %index_assign_9_2 = or i9 %tmp_12, 3
  %index_assign_9_2_cas = sext i9 %index_assign_9_2 to i32
  %tmp_48 = call i1 @_ssdm_op_BitSelect.i1.i180.i32(i180 %tmpData_V_2, i32 %index_assign_9_2_cas)
  %p_Result_16_3 = call i4 @_ssdm_op_BitConcatenate.i4.i1.i1.i1.i1(i1 %tmp_48, i1 %tmp_47, i1 %tmp_46, i1 %tmp_45)
  %tmpTmpData_V_2 = add i4 1, %p_Result_16_3
  %tmp_49 = trunc i4 %tmpTmpData_V_2 to i1
  %p_Repl2_5 = zext i1 %tmp_49 to i64
  %tmp_50 = call i180 @_ssdm_op_BitSet.i180.i180.i32.i64(i180 %tmpData_V_2, i32 %tmp_27_cast, i64 %p_Repl2_5)
  %tmp_51 = call i1 @_ssdm_op_BitSelect.i1.i4.i32(i4 %tmpTmpData_V_2, i32 1)
  %p_Repl2_5_1 = zext i1 %tmp_51 to i64
  %tmp_52 = call i180 @_ssdm_op_BitSet.i180.i180.i32.i64(i180 %tmp_50, i32 %index_assign_9_s, i64 %p_Repl2_5_1)
  %tmp_53 = call i1 @_ssdm_op_BitSelect.i1.i4.i32(i4 %tmpTmpData_V_2, i32 2)
  %p_Repl2_5_2 = zext i1 %tmp_53 to i64
  %tmp_54 = call i180 @_ssdm_op_BitSet.i180.i180.i32.i64(i180 %tmp_52, i32 %index_assign_9_1_cas, i64 %p_Repl2_5_2)
  %tmp_55 = call i1 @_ssdm_op_BitSelect.i1.i4.i32(i4 %tmpTmpData_V_2, i32 3)
  %p_Repl2_5_3 = zext i1 %tmp_55 to i64
  %tmp_56 = call i180 @_ssdm_op_BitSet.i180.i180.i32.i64(i180 %tmp_54, i32 %index_assign_9_2_cas, i64 %p_Repl2_5_3)
  switch i2 %tmp_13, label %branch3 [
    i2 0, label %branch0
    i2 1, label %branch1
    i2 -2, label %branch2
  ]

; <label>:16                                      ; preds = %branch3, %branch2, %branch1, %branch0
  br label %._crit_edge1.i

._crit_edge1.i:                                   ; preds = %16, %14
  br label %17

; <label>:17                                      ; preds = %._crit_edge1.i, %13
  br label %18

; <label>:18                                      ; preds = %17, %10
  br label %accumulateHW.exit_ifconv

accumulateHW.exit_ifconv:                         ; preds = %7, %18
  %i_op_assign_load = load i16* %i_op_assign
  %tmp_26 = icmp eq i31 %p_019_rec, 0
  %tmp_34_cast = zext i9 %x to i10
  %tmp_27 = add i10 1, %tmp_34_cast
  %arrayNo3 = call i2 @_ssdm_op_PartSelect.i2.i64.i32.i32(i64 %tmp_5, i32 17, i32 18)
  %newIndex6 = call i8 @_ssdm_op_PartSelect.i8.i10.i32.i32(i10 %tmp_27, i32 2, i32 9)
  %newIndex7 = zext i8 %newIndex6 to i64
  %glPLSlice0_V_1_addr_1 = getelementptr [240 x i180]* @glPLSlice0_V_1, i64 0, i64 %newIndex7
  %glPLSlice0_V_1_load_1 = load i180* %glPLSlice0_V_1_addr_1, align 8
  %glPLSlice0_V_2_addr_1 = getelementptr [240 x i180]* @glPLSlice0_V_2, i64 0, i64 %newIndex7
  %glPLSlice0_V_2_load_1 = load i180* %glPLSlice0_V_2_addr_1, align 8
  %glPLSlice0_V_3_addr_1 = getelementptr [240 x i180]* @glPLSlice0_V_3, i64 0, i64 %newIndex7
  %glPLSlice0_V_3_load_1 = load i180* %glPLSlice0_V_3_addr_1, align 8
  %glPLSlice0_V_0_addr_1 = getelementptr [240 x i180]* @glPLSlice0_V_0, i64 0, i64 %newIndex7
  %glPLSlice0_V_0_load_1 = load i180* %glPLSlice0_V_0_addr_1, align 8
  %tmp_28 = call i180 @_ssdm_op_Mux.ap_auto.4i180.i2(i180 %glPLSlice0_V_1_load_1, i180 %glPLSlice0_V_2_load_1, i180 %glPLSlice0_V_3_load_1, i180 %glPLSlice0_V_0_load_1, i2 %arrayNo3) nounwind
  %tmp_57 = trunc i180 %tmp_28 to i32
  %glPLSlice1_V_1_addr_1 = getelementptr [240 x i180]* @glPLSlice1_V_1, i64 0, i64 %newIndex7
  %glPLSlice1_V_1_load_1 = load i180* %glPLSlice1_V_1_addr_1, align 8
  %glPLSlice1_V_2_addr_1 = getelementptr [240 x i180]* @glPLSlice1_V_2, i64 0, i64 %newIndex7
  %glPLSlice1_V_2_load_1 = load i180* %glPLSlice1_V_2_addr_1, align 8
  %glPLSlice1_V_3_addr_1 = getelementptr [240 x i180]* @glPLSlice1_V_3, i64 0, i64 %newIndex7
  %glPLSlice1_V_3_load_1 = load i180* %glPLSlice1_V_3_addr_1, align 8
  %glPLSlice1_V_0_addr_1 = getelementptr [240 x i180]* @glPLSlice1_V_0, i64 0, i64 %newIndex7
  %glPLSlice1_V_0_load_1 = load i180* %glPLSlice1_V_0_addr_1, align 8
  %tmp_30 = call i180 @_ssdm_op_Mux.ap_auto.4i180.i2(i180 %glPLSlice1_V_1_load_1, i180 %glPLSlice1_V_2_load_1, i180 %glPLSlice1_V_3_load_1, i180 %glPLSlice1_V_0_load_1, i2 %arrayNo3) nounwind
  %tmp_58 = trunc i180 %tmp_30 to i32
  %glPLSlice2_V_1_addr_1 = getelementptr [240 x i180]* @glPLSlice2_V_1, i64 0, i64 %newIndex7
  %glPLSlice2_V_1_load_1 = load i180* %glPLSlice2_V_1_addr_1, align 8
  %glPLSlice2_V_2_addr_1 = getelementptr [240 x i180]* @glPLSlice2_V_2, i64 0, i64 %newIndex7
  %glPLSlice2_V_2_load_1 = load i180* %glPLSlice2_V_2_addr_1, align 8
  %glPLSlice2_V_3_addr_1 = getelementptr [240 x i180]* @glPLSlice2_V_3, i64 0, i64 %newIndex7
  %glPLSlice2_V_3_load_1 = load i180* %glPLSlice2_V_3_addr_1, align 8
  %glPLSlice2_V_0_addr_1 = getelementptr [240 x i180]* @glPLSlice2_V_0, i64 0, i64 %newIndex7
  %glPLSlice2_V_0_load_1 = load i180* %glPLSlice2_V_0_addr_1, align 8
  %tmp_32 = call i180 @_ssdm_op_Mux.ap_auto.4i180.i2(i180 %glPLSlice2_V_1_load_1, i180 %glPLSlice2_V_2_load_1, i180 %glPLSlice2_V_3_load_1, i180 %glPLSlice2_V_0_load_1, i2 %arrayNo3) nounwind
  %tmp_59 = trunc i180 %tmp_32 to i32
  %tmp_40_cast = zext i16 %i_op_assign_load to i17
  %i_op_assign_1 = call i17 @_ssdm_op_BitConcatenate.i17.i9.i8(i9 %y, i8 0)
  %i_op_assign_7_pn = select i1 %tmp_26, i17 %tmp_40_cast, i17 %i_op_assign_1
  %i_op_assign_7_pn_cas = zext i17 %i_op_assign_7_pn to i32
  %tmp1 = add i32 %tmp_57, %i_op_assign_7_pn_cas
  %tmp2 = add i32 %tmp_58, %tmp_59
  %storemerge = add i32 %tmp2, %tmp1
  call void @_ssdm_op_Write.ap_fifo.i32P(i32* %eventSlice, i32 %storemerge) nounwind
  %localCnt = add i16 1, %i_op_assign_load
  %glCnt_load = load i16* @glCnt, align 2
  %tmp_35 = add i16 1, %glCnt_load
  store i16 %tmp_35, i16* @glCnt, align 2
  %empty_8 = call i32 (...)* @_ssdm_op_SpecRegionEnd([7 x i8]* @p_str12, i32 %tmp_4) nounwind
  store i16 %localCnt, i16* %i_op_assign
  br label %6

; <label>:19                                      ; preds = %6
  ret void

branch0:                                          ; preds = %15
  store i180 %tmp_56, i180* %glPLSlice2_V_0_addr, align 8
  br label %16

branch1:                                          ; preds = %15
  store i180 %tmp_56, i180* %glPLSlice2_V_1_addr, align 8
  br label %16

branch2:                                          ; preds = %15
  store i180 %tmp_56, i180* %glPLSlice2_V_2_addr, align 8
  br label %16

branch3:                                          ; preds = %15
  store i180 %tmp_56, i180* %glPLSlice2_V_3_addr, align 8
  br label %16

branch4:                                          ; preds = %12
  store i180 %tmp_44, i180* %glPLSlice1_V_0_addr, align 8
  br label %13

branch5:                                          ; preds = %12
  store i180 %tmp_44, i180* %glPLSlice1_V_1_addr, align 8
  br label %13

branch6:                                          ; preds = %12
  store i180 %tmp_44, i180* %glPLSlice1_V_2_addr, align 8
  br label %13

branch7:                                          ; preds = %12
  store i180 %tmp_44, i180* %glPLSlice1_V_3_addr, align 8
  br label %13

branch8:                                          ; preds = %9
  store i180 %tmp_29, i180* %glPLSlice0_V_0_addr, align 8
  br label %10

branch9:                                          ; preds = %9
  store i180 %tmp_29, i180* %glPLSlice0_V_1_addr, align 8
  br label %10

branch10:                                         ; preds = %9
  store i180 %tmp_29, i180* %glPLSlice0_V_2_addr, align 8
  br label %10

branch11:                                         ; preds = %9
  store i180 %tmp_29, i180* %glPLSlice0_V_3_addr, align 8
  br label %10
}

declare i64 @llvm.part.select.i64(i64, i32, i32) nounwind readnone

declare i10 @llvm.part.select.i10(i10, i32, i32) nounwind readnone

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

define weak void @_ssdm_op_SpecOccurrence(...) nounwind {
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

define weak i9 @_ssdm_op_PartSelect.i9.i64.i32.i32(i64, i32, i32) nounwind readnone {
entry:
  %empty = call i64 @llvm.part.select.i64(i64 %0, i32 %1, i32 %2)
  %empty_9 = trunc i64 %empty to i9
  ret i9 %empty_9
}

define weak i8 @_ssdm_op_PartSelect.i8.i64.i32.i32(i64, i32, i32) nounwind readnone {
entry:
  %empty = call i64 @llvm.part.select.i64(i64 %0, i32 %1, i32 %2)
  %empty_10 = trunc i64 %empty to i8
  ret i8 %empty_10
}

define weak i8 @_ssdm_op_PartSelect.i8.i10.i32.i32(i10, i32, i32) nounwind readnone {
entry:
  %empty = call i10 @llvm.part.select.i10(i10 %0, i32 %1, i32 %2)
  %empty_11 = trunc i10 %empty to i8
  ret i8 %empty_11
}

define weak i7 @_ssdm_op_PartSelect.i7.i64.i32.i32(i64, i32, i32) nounwind readnone {
entry:
  %empty = call i64 @llvm.part.select.i64(i64 %0, i32 %1, i32 %2)
  %empty_12 = trunc i64 %empty to i7
  ret i7 %empty_12
}

declare i32 @_ssdm_op_PartSelect.i32.i180.i32.i32(i180, i32, i32) nounwind readnone

define weak i2 @_ssdm_op_PartSelect.i2.i64.i32.i32(i64, i32, i32) nounwind readnone {
entry:
  %empty = call i64 @llvm.part.select.i64(i64 %0, i32 %1, i32 %2)
  %empty_13 = trunc i64 %empty to i2
  ret i2 %empty_13
}

declare i1 @_ssdm_op_PartSelect.i1.i4.i32.i32(i4, i32, i32) nounwind readnone

define weak i180 @_ssdm_op_Mux.ap_auto.4i180.i2(i180, i180, i180, i180, i2) {
entry:
  switch i2 %4, label %case3 [
    i2 0, label %case0
    i2 1, label %case1
    i2 -2, label %case2
  ]

case0:                                            ; preds = %case3, %case2, %case1, %entry
  %merge = phi i180 [ %0, %entry ], [ %1, %case1 ], [ %2, %case2 ], [ %3, %case3 ]
  ret i180 %merge

case1:                                            ; preds = %entry
  br label %case0

case2:                                            ; preds = %entry
  br label %case0

case3:                                            ; preds = %entry
  br label %case0
}

define weak i180 @_ssdm_op_BitSet.i180.i180.i32.i64(i180, i32, i64) nounwind readnone {
entry:
  %empty = icmp ne i64 %2, 0
  %empty_14 = zext i1 %empty to i180
  %empty_15 = zext i32 %1 to i180
  %empty_16 = shl i180 %empty_14, %empty_15
  %empty_17 = shl i180 1, %empty_15
  %empty_18 = xor i180 %empty_17, -1
  %empty_19 = and i180 %empty_18, %0
  %empty_20 = or i180 %empty_16, %empty_19
  ret i180 %empty_20
}

define weak i1 @_ssdm_op_BitSelect.i1.i64.i32(i64, i32) nounwind readnone {
entry:
  %empty = zext i32 %1 to i64
  %empty_21 = shl i64 1, %empty
  %empty_22 = and i64 %0, %empty_21
  %empty_23 = icmp ne i64 %empty_22, 0
  ret i1 %empty_23
}

define weak i1 @_ssdm_op_BitSelect.i1.i4.i32(i4, i32) nounwind readnone {
entry:
  %empty = trunc i32 %1 to i4
  %empty_24 = shl i4 1, %empty
  %empty_25 = and i4 %0, %empty_24
  %empty_26 = icmp ne i4 %empty_25, 0
  ret i1 %empty_26
}

define weak i1 @_ssdm_op_BitSelect.i1.i2.i32(i2, i32) nounwind readnone {
entry:
  %empty = trunc i32 %1 to i2
  %empty_27 = shl i2 1, %empty
  %empty_28 = and i2 %0, %empty_27
  %empty_29 = icmp ne i2 %empty_28, 0
  ret i1 %empty_29
}

define weak i1 @_ssdm_op_BitSelect.i1.i180.i32(i180, i32) nounwind readnone {
entry:
  %empty = zext i32 %1 to i180
  %empty_30 = shl i180 1, %empty
  %empty_31 = and i180 %0, %empty_30
  %empty_32 = icmp ne i180 %empty_31, 0
  ret i1 %empty_32
}

define weak i9 @_ssdm_op_BitConcatenate.i9.i7.i2(i7, i2) nounwind readnone {
entry:
  %empty = zext i7 %0 to i9
  %empty_33 = zext i2 %1 to i9
  %empty_34 = shl i9 %empty, 2
  %empty_35 = or i9 %empty_34, %empty_33
  ret i9 %empty_35
}

define weak i4 @_ssdm_op_BitConcatenate.i4.i1.i1.i1.i1(i1, i1, i1, i1) nounwind readnone {
entry:
  %empty = zext i1 %2 to i2
  %empty_36 = zext i1 %3 to i2
  %empty_37 = shl i2 %empty, 1
  %empty_38 = or i2 %empty_37, %empty_36
  %empty_39 = zext i1 %1 to i3
  %empty_40 = zext i2 %empty_38 to i3
  %empty_41 = shl i3 %empty_39, 2
  %empty_42 = or i3 %empty_41, %empty_40
  %empty_43 = zext i1 %0 to i4
  %empty_44 = zext i3 %empty_42 to i4
  %empty_45 = shl i4 %empty_43, 3
  %empty_46 = or i4 %empty_45, %empty_44
  ret i4 %empty_46
}

define weak i17 @_ssdm_op_BitConcatenate.i17.i9.i8(i9, i8) nounwind readnone {
entry:
  %empty = zext i9 %0 to i17
  %empty_47 = zext i8 %1 to i17
  %empty_48 = shl i17 %empty, 8
  %empty_49 = or i17 %empty_48, %empty_47
  ret i17 %empty_49
}

define weak i10 @_ssdm_op_BitConcatenate.i10.i8.i2(i8, i2) nounwind readnone {
entry:
  %empty = zext i8 %0 to i10
  %empty_50 = zext i2 %1 to i10
  %empty_51 = shl i10 %empty, 2
  %empty_52 = or i10 %empty_51, %empty_50
  ret i10 %empty_52
}

declare i32 @_autotb_FifoWrite_i32(i32*, i32)

declare i64 @_autotb_FifoRead_i64(i64*)

declare void @_GLOBAL__I_a() nounwind

!opencl.kernels = !{!0, !7, !13, !19, !19, !25, !31, !25, !25, !25, !34, !34, !36, !36, !25, !38, !25, !25, !25, !40, !40, !42, !42, !44, !25, !25, !25, !40, !40, !46, !46, !48, !50, !50, !25, !52, !54, !54, !56, !25, !25, !25, !58, !58, !60, !60, !62, !25, !25, !25, !58, !58, !64, !64, !25, !25, !66, !69, !25, !71, !73, !75, !76, !25, !71, !78, !25, !81, !81, !85, !87, !87, !25, !89, !25, !25, !25, !91, !91, !93, !93, !95, !96, !96, !98, !25, !100, !75, !102, !102, !25, !25, !103, !106, !34, !34, !108, !110, !25, !25, !25, !112, !112, !34, !34, !64, !64, !25, !25, !25, !25, !25, !25, !25, !25, !25, !25, !25, !25}
!hls.encrypted.func = !{}
!llvm.map.gv = !{!114, !121, !126}

!0 = metadata !{null, metadata !1, metadata !2, metadata !3, metadata !4, metadata !5, metadata !6}
!1 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0, i32 0, i32 0}
!2 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none", metadata !"none"}
!3 = metadata !{metadata !"kernel_arg_type", metadata !"int16_t", metadata !"int16_t", metadata !"_Bool", metadata !"int64_t"}
!4 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !"", metadata !""}
!5 = metadata !{metadata !"kernel_arg_name", metadata !"x", metadata !"y", metadata !"pol", metadata !"ts"}
!6 = metadata !{metadata !"reqd_work_group_size", i32 1, i32 1, i32 1}
!7 = metadata !{void (i64*, i32, i32*)* @parseEvents, metadata !8, metadata !9, metadata !10, metadata !11, metadata !12, metadata !6}
!8 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 0, i32 1}
!9 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none"}
!10 = metadata !{metadata !"kernel_arg_type", metadata !"uint64_t*", metadata !"int32_t", metadata !"int32_t*"}
!11 = metadata !{metadata !"kernel_arg_type_qual", metadata !"const", metadata !"", metadata !""}
!12 = metadata !{metadata !"kernel_arg_name", metadata !"data", metadata !"eventsArraySize", metadata !"eventSlice"}
!13 = metadata !{null, metadata !14, metadata !15, metadata !16, metadata !17, metadata !18, metadata !6}
!14 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0}
!15 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none"}
!16 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<182, true> &", metadata !"int"}
!17 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !""}
!18 = metadata !{metadata !"kernel_arg_name", metadata !"op", metadata !"i_op"}
!19 = metadata !{null, metadata !20, metadata !21, metadata !22, metadata !23, metadata !24, metadata !6}
!20 = metadata !{metadata !"kernel_arg_addr_space", i32 0}
!21 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none"}
!22 = metadata !{metadata !"kernel_arg_type", metadata !"int"}
!23 = metadata !{metadata !"kernel_arg_type_qual", metadata !""}
!24 = metadata !{metadata !"kernel_arg_name", metadata !"op"}
!25 = metadata !{null, metadata !26, metadata !27, metadata !28, metadata !29, metadata !30, metadata !6}
!26 = metadata !{metadata !"kernel_arg_addr_space"}
!27 = metadata !{metadata !"kernel_arg_access_qual"}
!28 = metadata !{metadata !"kernel_arg_type"}
!29 = metadata !{metadata !"kernel_arg_type_qual"}
!30 = metadata !{metadata !"kernel_arg_name"}
!31 = metadata !{null, metadata !14, metadata !15, metadata !32, metadata !17, metadata !33, metadata !6}
!32 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<182, true> &", metadata !"const ap_int_base<32, true> &"}
!33 = metadata !{metadata !"kernel_arg_name", metadata !"op", metadata !"op2"}
!34 = metadata !{null, metadata !20, metadata !21, metadata !35, metadata !23, metadata !24, metadata !6}
!35 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<32, true> &"}
!36 = metadata !{null, metadata !20, metadata !21, metadata !37, metadata !23, metadata !24, metadata !6}
!37 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<182, true> &"}
!38 = metadata !{null, metadata !14, metadata !15, metadata !39, metadata !17, metadata !33, metadata !6}
!39 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<184, true> &", metadata !"const ap_int_base<4, true> &"}
!40 = metadata !{null, metadata !20, metadata !21, metadata !41, metadata !23, metadata !24, metadata !6}
!41 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<4, true> &"}
!42 = metadata !{null, metadata !20, metadata !21, metadata !43, metadata !23, metadata !24, metadata !6}
!43 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<184, true> &"}
!44 = metadata !{null, metadata !14, metadata !15, metadata !45, metadata !17, metadata !33, metadata !6}
!45 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<183, true> &", metadata !"const ap_int_base<4, true> &"}
!46 = metadata !{null, metadata !20, metadata !21, metadata !47, metadata !23, metadata !24, metadata !6}
!47 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<183, true> &"}
!48 = metadata !{null, metadata !14, metadata !15, metadata !49, metadata !17, metadata !18, metadata !6}
!49 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<182, true> &", metadata !"ushort"}
!50 = metadata !{null, metadata !20, metadata !21, metadata !51, metadata !23, metadata !24, metadata !6}
!51 = metadata !{metadata !"kernel_arg_type", metadata !"ushort"}
!52 = metadata !{null, metadata !14, metadata !15, metadata !53, metadata !17, metadata !33, metadata !6}
!53 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<182, true> &", metadata !"const ap_int_base<16, false> &"}
!54 = metadata !{null, metadata !20, metadata !21, metadata !55, metadata !23, metadata !24, metadata !6}
!55 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<16, false> &"}
!56 = metadata !{null, metadata !14, metadata !15, metadata !57, metadata !17, metadata !33, metadata !6}
!57 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<181, true> &", metadata !"const ap_int_base<180, true> &"}
!58 = metadata !{null, metadata !20, metadata !21, metadata !59, metadata !23, metadata !24, metadata !6}
!59 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<180, true> &"}
!60 = metadata !{null, metadata !20, metadata !21, metadata !61, metadata !23, metadata !24, metadata !6}
!61 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<181, true> &"}
!62 = metadata !{null, metadata !14, metadata !15, metadata !63, metadata !17, metadata !33, metadata !6}
!63 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<180, true> &", metadata !"const ap_int_base<180, true> &"}
!64 = metadata !{null, metadata !20, metadata !21, metadata !22, metadata !23, metadata !65, metadata !6}
!65 = metadata !{metadata !"kernel_arg_name", metadata !"val"}
!66 = metadata !{null, metadata !20, metadata !21, metadata !67, metadata !23, metadata !68, metadata !6}
!67 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<2> &"}
!68 = metadata !{metadata !"kernel_arg_name", metadata !"op2"}
!69 = metadata !{null, metadata !20, metadata !21, metadata !70, metadata !23, metadata !65, metadata !6}
!70 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_bit_ref<4, true> &"}
!71 = metadata !{null, metadata !20, metadata !21, metadata !72, metadata !23, metadata !65, metadata !6}
!72 = metadata !{metadata !"kernel_arg_type", metadata !"ulong long"}
!73 = metadata !{null, metadata !14, metadata !15, metadata !74, metadata !17, metadata !33, metadata !6}
!74 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<4, true> &", metadata !"int"}
!75 = metadata !{null, metadata !20, metadata !21, metadata !35, metadata !23, metadata !68, metadata !6}
!76 = metadata !{null, metadata !20, metadata !21, metadata !77, metadata !23, metadata !65, metadata !6}
!77 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_bit_ref<180, true> &"}
!78 = metadata !{null, metadata !20, metadata !21, metadata !79, metadata !23, metadata !80, metadata !6}
!79 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<40, true> &"}
!80 = metadata !{metadata !"kernel_arg_name", metadata !"index"}
!81 = metadata !{null, metadata !82, metadata !15, metadata !83, metadata !17, metadata !84, metadata !6}
!82 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 0}
!83 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<180, true>*", metadata !"int"}
!84 = metadata !{metadata !"kernel_arg_name", metadata !"bv", metadata !"index"}
!85 = metadata !{null, metadata !14, metadata !15, metadata !86, metadata !17, metadata !18, metadata !6}
!86 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<39, true> &", metadata !"signed char"}
!87 = metadata !{null, metadata !20, metadata !21, metadata !88, metadata !23, metadata !24, metadata !6}
!88 = metadata !{metadata !"kernel_arg_type", metadata !"signed char"}
!89 = metadata !{null, metadata !14, metadata !15, metadata !90, metadata !17, metadata !33, metadata !6}
!90 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<39, true> &", metadata !"const ap_int_base<8, true> &"}
!91 = metadata !{null, metadata !20, metadata !21, metadata !92, metadata !23, metadata !24, metadata !6}
!92 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<8, true> &"}
!93 = metadata !{null, metadata !20, metadata !21, metadata !94, metadata !23, metadata !24, metadata !6}
!94 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<39, true> &"}
!95 = metadata !{null, metadata !20, metadata !21, metadata !22, metadata !23, metadata !80, metadata !6}
!96 = metadata !{null, metadata !82, metadata !15, metadata !97, metadata !17, metadata !84, metadata !6}
!97 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<4, true>*", metadata !"int"}
!98 = metadata !{null, metadata !20, metadata !21, metadata !99, metadata !23, metadata !68, metadata !6}
!99 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int<180> &"}
!100 = metadata !{null, metadata !14, metadata !15, metadata !101, metadata !17, metadata !33, metadata !6}
!101 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<2, false> &", metadata !"int"}
!102 = metadata !{null, metadata !20, metadata !21, metadata !79, metadata !23, metadata !24, metadata !6}
!103 = metadata !{null, metadata !14, metadata !15, metadata !104, metadata !17, metadata !105, metadata !6}
!104 = metadata !{metadata !"kernel_arg_type", metadata !"int", metadata !"const ap_int_base<39, true> &"}
!105 = metadata !{metadata !"kernel_arg_name", metadata !"i_op", metadata !"op"}
!106 = metadata !{null, metadata !14, metadata !15, metadata !107, metadata !17, metadata !33, metadata !6}
!107 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<32, true> &", metadata !"const ap_int_base<39, true> &"}
!108 = metadata !{null, metadata !14, metadata !15, metadata !109, metadata !17, metadata !105, metadata !6}
!109 = metadata !{metadata !"kernel_arg_type", metadata !"int", metadata !"const ap_int_base<7, true> &"}
!110 = metadata !{null, metadata !14, metadata !15, metadata !111, metadata !17, metadata !33, metadata !6}
!111 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<32, true> &", metadata !"const ap_int_base<7, true> &"}
!112 = metadata !{null, metadata !20, metadata !21, metadata !113, metadata !23, metadata !24, metadata !6}
!113 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<7, true> &"}
!114 = metadata !{metadata !115, i16* @sum}
!115 = metadata !{metadata !116}
!116 = metadata !{i32 0, i32 15, metadata !117}
!117 = metadata !{metadata !118}
!118 = metadata !{metadata !"sum", metadata !119, metadata !"short", i32 0, i32 15}
!119 = metadata !{metadata !120}
!120 = metadata !{i32 0, i32 0, i32 1}
!121 = metadata !{metadata !122, i32* @partFactor}
!122 = metadata !{metadata !123}
!123 = metadata !{i32 0, i32 31, metadata !124}
!124 = metadata !{metadata !125}
!125 = metadata !{metadata !"partFactor", metadata !119, metadata !"int", i32 0, i32 31}
!126 = metadata !{metadata !127, [1 x i32]* @llvm_global_ctors_0}
!127 = metadata !{metadata !128}
!128 = metadata !{i32 0, i32 31, metadata !129}
!129 = metadata !{metadata !130}
!130 = metadata !{metadata !"llvm.global_ctors.0", metadata !119, metadata !"", i32 0, i32 31}
!131 = metadata !{metadata !132}
!132 = metadata !{i32 0, i32 63, metadata !133}
!133 = metadata !{metadata !134}
!134 = metadata !{metadata !"data", metadata !119, metadata !"long long unsigned int", i32 0, i32 63}
!135 = metadata !{metadata !136}
!136 = metadata !{i32 0, i32 31, metadata !137}
!137 = metadata !{metadata !138}
!138 = metadata !{metadata !"eventsArraySize", metadata !139, metadata !"int", i32 0, i32 31}
!139 = metadata !{metadata !140}
!140 = metadata !{i32 0, i32 0, i32 0}
!141 = metadata !{metadata !142}
!142 = metadata !{i32 0, i32 31, metadata !143}
!143 = metadata !{metadata !144}
!144 = metadata !{metadata !"eventSlice", metadata !119, metadata !"int", i32 0, i32 31}
