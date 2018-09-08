; ModuleID = 'E:/xfOpenCV/hls_2018_1/abmofParseEvents_SmallBitWidth/solution1/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-w64-mingw32"

@targetBlocks_V = constant [225 x i4] zeroinitializer
@sum = global i16 0, align 2
@refBlock_V = constant [225 x i4] zeroinitializer
@partFactor = global i32 6, align 4
@parseEvents_str = internal unnamed_addr constant [12 x i8] c"parseEvents\00"
@llvm_global_ctors_1 = appending global [1 x void ()*] [void ()* @_GLOBAL__I_a]
@llvm_global_ctors_0 = appending global [1 x i32] [i32 65535]
@glPLSlice2_V_9 = internal global [60 x i180] zeroinitializer
@glPLSlice2_V_8 = internal global [60 x i180] zeroinitializer
@glPLSlice2_V_7 = internal global [60 x i180] zeroinitializer
@glPLSlice2_V_6 = internal global [60 x i180] zeroinitializer
@glPLSlice2_V_5 = internal global [60 x i180] zeroinitializer
@glPLSlice2_V_4 = internal global [60 x i180] zeroinitializer
@glPLSlice2_V_3 = internal global [60 x i180] zeroinitializer
@glPLSlice2_V_2 = internal global [60 x i180] zeroinitializer
@glPLSlice2_V_15 = internal global [60 x i180] zeroinitializer
@glPLSlice2_V_14 = internal global [60 x i180] zeroinitializer
@glPLSlice2_V_13 = internal global [60 x i180] zeroinitializer
@glPLSlice2_V_12 = internal global [60 x i180] zeroinitializer
@glPLSlice2_V_11 = internal global [60 x i180] zeroinitializer
@glPLSlice2_V_10 = internal global [60 x i180] zeroinitializer
@glPLSlice2_V_1 = internal global [60 x i180] zeroinitializer
@glPLSlice2_V_0 = internal global [60 x i180] zeroinitializer
@glPLSlice1_V_9 = internal global [60 x i180] zeroinitializer
@glPLSlice1_V_8 = internal global [60 x i180] zeroinitializer
@glPLSlice1_V_7 = internal global [60 x i180] zeroinitializer
@glPLSlice1_V_6 = internal global [60 x i180] zeroinitializer
@glPLSlice1_V_5 = internal global [60 x i180] zeroinitializer
@glPLSlice1_V_4 = internal global [60 x i180] zeroinitializer
@glPLSlice1_V_3 = internal global [60 x i180] zeroinitializer
@glPLSlice1_V_2 = internal global [60 x i180] zeroinitializer
@glPLSlice1_V_15 = internal global [60 x i180] zeroinitializer
@glPLSlice1_V_14 = internal global [60 x i180] zeroinitializer
@glPLSlice1_V_13 = internal global [60 x i180] zeroinitializer
@glPLSlice1_V_12 = internal global [60 x i180] zeroinitializer
@glPLSlice1_V_11 = internal global [60 x i180] zeroinitializer
@glPLSlice1_V_10 = internal global [60 x i180] zeroinitializer
@glPLSlice1_V_1 = internal global [60 x i180] zeroinitializer
@glPLSlice1_V_0 = internal global [60 x i180] zeroinitializer
@glPLSlice0_V_9 = internal global [60 x i180] zeroinitializer
@glPLSlice0_V_8 = internal global [60 x i180] zeroinitializer
@glPLSlice0_V_7 = internal global [60 x i180] zeroinitializer
@glPLSlice0_V_6 = internal global [60 x i180] zeroinitializer
@glPLSlice0_V_5 = internal global [60 x i180] zeroinitializer
@glPLSlice0_V_4 = internal global [60 x i180] zeroinitializer
@glPLSlice0_V_3 = internal global [60 x i180] zeroinitializer
@glPLSlice0_V_2 = internal global [60 x i180] zeroinitializer
@glPLSlice0_V_15 = internal global [60 x i180] zeroinitializer
@glPLSlice0_V_14 = internal global [60 x i180] zeroinitializer
@glPLSlice0_V_13 = internal global [60 x i180] zeroinitializer
@glPLSlice0_V_12 = internal global [60 x i180] zeroinitializer
@glPLSlice0_V_11 = internal global [60 x i180] zeroinitializer
@glPLSlice0_V_10 = internal global [60 x i180] zeroinitializer
@glPLSlice0_V_1 = internal global [60 x i180] zeroinitializer
@glPLSlice0_V_0 = internal global [60 x i180] zeroinitializer
@glPLActiveSliceIdx_V = internal unnamed_addr global i2 0
@glCnt = internal unnamed_addr global i16 0, align 2
@p_str14 = private unnamed_addr constant [7 x i8] c"loop_1\00", align 1
@p_str12 = private unnamed_addr constant [8 x i8] c"ap_fifo\00", align 1
@p_str11 = private unnamed_addr constant [13 x i8] c"RAM_T2P_BRAM\00", align 1
@p_str10 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1

define void @parseEvents(i64* %data, i32 %eventsArraySize, i32* %eventSlice) nounwind uwtable {
  call void (...)* @_ssdm_op_SpecBitsMap(i64* %data) nounwind, !map !142
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %eventsArraySize) nounwind, !map !146
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %eventSlice) nounwind, !map !152
  call void (...)* @_ssdm_op_SpecTopModule([12 x i8]* @parseEvents_str) nounwind
  %eventsArraySize_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %eventsArraySize) nounwind
  call void (...)* @_ssdm_op_SpecMemCore([60 x i180]* @glPLSlice2_V_0, [60 x i180]* @glPLSlice2_V_1, [60 x i180]* @glPLSlice2_V_2, [60 x i180]* @glPLSlice2_V_3, [60 x i180]* @glPLSlice2_V_4, [60 x i180]* @glPLSlice2_V_5, [60 x i180]* @glPLSlice2_V_6, [60 x i180]* @glPLSlice2_V_7, [60 x i180]* @glPLSlice2_V_8, [60 x i180]* @glPLSlice2_V_9, [60 x i180]* @glPLSlice2_V_10, [60 x i180]* @glPLSlice2_V_11, [60 x i180]* @glPLSlice2_V_12, [60 x i180]* @glPLSlice2_V_13, [60 x i180]* @glPLSlice2_V_14, [60 x i180]* @glPLSlice2_V_15, [1 x i8]* @p_str10, [13 x i8]* @p_str11, [1 x i8]* @p_str10, i32 -1, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10) nounwind
  call void (...)* @_ssdm_op_SpecMemCore([60 x i180]* @glPLSlice1_V_0, [60 x i180]* @glPLSlice1_V_1, [60 x i180]* @glPLSlice1_V_2, [60 x i180]* @glPLSlice1_V_3, [60 x i180]* @glPLSlice1_V_4, [60 x i180]* @glPLSlice1_V_5, [60 x i180]* @glPLSlice1_V_6, [60 x i180]* @glPLSlice1_V_7, [60 x i180]* @glPLSlice1_V_8, [60 x i180]* @glPLSlice1_V_9, [60 x i180]* @glPLSlice1_V_10, [60 x i180]* @glPLSlice1_V_11, [60 x i180]* @glPLSlice1_V_12, [60 x i180]* @glPLSlice1_V_13, [60 x i180]* @glPLSlice1_V_14, [60 x i180]* @glPLSlice1_V_15, [1 x i8]* @p_str10, [13 x i8]* @p_str11, [1 x i8]* @p_str10, i32 -1, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10) nounwind
  call void (...)* @_ssdm_op_SpecMemCore([60 x i180]* @glPLSlice0_V_0, [60 x i180]* @glPLSlice0_V_1, [60 x i180]* @glPLSlice0_V_2, [60 x i180]* @glPLSlice0_V_3, [60 x i180]* @glPLSlice0_V_4, [60 x i180]* @glPLSlice0_V_5, [60 x i180]* @glPLSlice0_V_6, [60 x i180]* @glPLSlice0_V_7, [60 x i180]* @glPLSlice0_V_8, [60 x i180]* @glPLSlice0_V_9, [60 x i180]* @glPLSlice0_V_10, [60 x i180]* @glPLSlice0_V_11, [60 x i180]* @glPLSlice0_V_12, [60 x i180]* @glPLSlice0_V_13, [60 x i180]* @glPLSlice0_V_14, [60 x i180]* @glPLSlice0_V_15, [1 x i8]* @p_str10, [13 x i8]* @p_str11, [1 x i8]* @p_str10, i32 -1, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32* %eventSlice, [8 x i8]* @p_str12, i32 0, i32 0, [1 x i8]* @p_str10, i32 0, i32 0, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str10, [1 x i8]* @p_str10) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i64* %data, [8 x i8]* @p_str12, i32 0, i32 0, [1 x i8]* @p_str10, i32 0, i32 0, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str10, [1 x i8]* @p_str10) nounwind
  %glPLActiveSliceIdx_V_1 = load i2* @glPLActiveSliceIdx_V, align 1
  %tmp = icmp eq i2 %glPLActiveSliceIdx_V_1, 0
  br i1 %tmp, label %1, label %2

; <label>:1                                       ; preds = %0
  store i2 1, i2* @glPLActiveSliceIdx_V, align 1
  br label %7

; <label>:2                                       ; preds = %0
  %tmp_1 = icmp eq i2 %glPLActiveSliceIdx_V_1, 1
  br i1 %tmp_1, label %3, label %4

; <label>:3                                       ; preds = %2
  store i2 -2, i2* @glPLActiveSliceIdx_V, align 1
  br label %6

; <label>:4                                       ; preds = %2
  %tmp_2 = icmp eq i2 %glPLActiveSliceIdx_V_1, -2
  br i1 %tmp_2, label %5, label %._crit_edge

; <label>:5                                       ; preds = %4
  store i2 0, i2* @glPLActiveSliceIdx_V, align 1
  br label %._crit_edge

._crit_edge:                                      ; preds = %5, %4
  br label %6

; <label>:6                                       ; preds = %._crit_edge, %3
  br label %7

; <label>:7                                       ; preds = %6, %1
  %i_op_assign = alloca i16
  br label %8

; <label>:8                                       ; preds = %_ifconv, %7
  %p_019_rec = phi i31 [ 0, %7 ], [ %i, %_ifconv ]
  %i_cast = zext i31 %p_019_rec to i32
  %tmp_3 = icmp slt i32 %i_cast, %eventsArraySize_read
  %i = add i31 %p_019_rec, 1
  br i1 %tmp_3, label %_ifconv, label %9

_ifconv:                                          ; preds = %8
  %i_op_assign_load = load i16* %i_op_assign
  call void (...)* @_ssdm_op_SpecLoopName([7 x i8]* @p_str14) nounwind
  %tmp_s = call i32 (...)* @_ssdm_op_SpecRegionBegin([7 x i8]* @p_str14) nounwind
  call void (...)* @_ssdm_op_SpecPipeline(i32 -1, i32 1, i32 1, i32 0, [1 x i8]* @p_str10) nounwind
  call void (...)* @_ssdm_op_SpecLoopTripCount(i32 0, i32 10000, i32 5000, [1 x i8]* @p_str10) nounwind
  %tmp_4 = call i64 @_ssdm_op_Read.ap_fifo.volatile.i64P(i64* %data) nounwind
  %x = call i9 @_ssdm_op_PartSelect.i9.i64.i32.i32(i64 %tmp_4, i32 17, i32 25)
  %y = call i9 @_ssdm_op_PartSelect.i9.i64.i32.i32(i64 %tmp_4, i32 2, i32 10)
  %pol = call i1 @_ssdm_op_BitSelect.i1.i64.i32(i64 %tmp_4, i32 1)
  %x_cast_cast = zext i9 %x to i10
  call fastcc void @accumulateHW(i10 signext %x_cast_cast, i9 signext %y, i1 zeroext %pol)
  %tmp_5 = icmp eq i31 %p_019_rec, 0
  %tmp_9 = add i10 1, %x_cast_cast
  %arrayNo = call i4 @_ssdm_op_PartSelect.i4.i64.i32.i32(i64 %tmp_4, i32 17, i32 20)
  %newIndex = call i6 @_ssdm_op_PartSelect.i6.i10.i32.i32(i10 %tmp_9, i32 4, i32 9)
  %newIndex1 = zext i6 %newIndex to i64
  %glPLSlice0_V_1_addr = getelementptr [60 x i180]* @glPLSlice0_V_1, i64 0, i64 %newIndex1
  %glPLSlice0_V_1_load = load i180* %glPLSlice0_V_1_addr, align 8
  %glPLSlice0_V_2_addr = getelementptr [60 x i180]* @glPLSlice0_V_2, i64 0, i64 %newIndex1
  %glPLSlice0_V_2_load = load i180* %glPLSlice0_V_2_addr, align 8
  %glPLSlice0_V_3_addr = getelementptr [60 x i180]* @glPLSlice0_V_3, i64 0, i64 %newIndex1
  %glPLSlice0_V_3_load = load i180* %glPLSlice0_V_3_addr, align 8
  %glPLSlice0_V_4_addr = getelementptr [60 x i180]* @glPLSlice0_V_4, i64 0, i64 %newIndex1
  %glPLSlice0_V_4_load = load i180* %glPLSlice0_V_4_addr, align 8
  %glPLSlice0_V_5_addr = getelementptr [60 x i180]* @glPLSlice0_V_5, i64 0, i64 %newIndex1
  %glPLSlice0_V_5_load = load i180* %glPLSlice0_V_5_addr, align 8
  %glPLSlice0_V_6_addr = getelementptr [60 x i180]* @glPLSlice0_V_6, i64 0, i64 %newIndex1
  %glPLSlice0_V_6_load = load i180* %glPLSlice0_V_6_addr, align 8
  %glPLSlice0_V_7_addr = getelementptr [60 x i180]* @glPLSlice0_V_7, i64 0, i64 %newIndex1
  %glPLSlice0_V_7_load = load i180* %glPLSlice0_V_7_addr, align 8
  %glPLSlice0_V_8_addr = getelementptr [60 x i180]* @glPLSlice0_V_8, i64 0, i64 %newIndex1
  %glPLSlice0_V_8_load = load i180* %glPLSlice0_V_8_addr, align 8
  %glPLSlice0_V_9_addr = getelementptr [60 x i180]* @glPLSlice0_V_9, i64 0, i64 %newIndex1
  %glPLSlice0_V_9_load = load i180* %glPLSlice0_V_9_addr, align 8
  %glPLSlice0_V_10_addr = getelementptr [60 x i180]* @glPLSlice0_V_10, i64 0, i64 %newIndex1
  %glPLSlice0_V_10_load = load i180* %glPLSlice0_V_10_addr, align 8
  %glPLSlice0_V_11_addr = getelementptr [60 x i180]* @glPLSlice0_V_11, i64 0, i64 %newIndex1
  %glPLSlice0_V_11_load = load i180* %glPLSlice0_V_11_addr, align 8
  %glPLSlice0_V_12_addr = getelementptr [60 x i180]* @glPLSlice0_V_12, i64 0, i64 %newIndex1
  %glPLSlice0_V_12_load = load i180* %glPLSlice0_V_12_addr, align 8
  %glPLSlice0_V_13_addr = getelementptr [60 x i180]* @glPLSlice0_V_13, i64 0, i64 %newIndex1
  %glPLSlice0_V_13_load = load i180* %glPLSlice0_V_13_addr, align 8
  %glPLSlice0_V_14_addr = getelementptr [60 x i180]* @glPLSlice0_V_14, i64 0, i64 %newIndex1
  %glPLSlice0_V_14_load = load i180* %glPLSlice0_V_14_addr, align 8
  %glPLSlice0_V_15_addr = getelementptr [60 x i180]* @glPLSlice0_V_15, i64 0, i64 %newIndex1
  %glPLSlice0_V_15_load = load i180* %glPLSlice0_V_15_addr, align 8
  %glPLSlice0_V_0_addr = getelementptr [60 x i180]* @glPLSlice0_V_0, i64 0, i64 %newIndex1
  %glPLSlice0_V_0_load = load i180* %glPLSlice0_V_0_addr, align 8
  %tmp_6 = call i180 @_ssdm_op_Mux.ap_auto.16i180.i4(i180 %glPLSlice0_V_1_load, i180 %glPLSlice0_V_2_load, i180 %glPLSlice0_V_3_load, i180 %glPLSlice0_V_4_load, i180 %glPLSlice0_V_5_load, i180 %glPLSlice0_V_6_load, i180 %glPLSlice0_V_7_load, i180 %glPLSlice0_V_8_load, i180 %glPLSlice0_V_9_load, i180 %glPLSlice0_V_10_load, i180 %glPLSlice0_V_11_load, i180 %glPLSlice0_V_12_load, i180 %glPLSlice0_V_13_load, i180 %glPLSlice0_V_14_load, i180 %glPLSlice0_V_15_load, i180 %glPLSlice0_V_0_load, i4 %arrayNo) nounwind
  %tmp_10 = trunc i180 %tmp_6 to i32
  %glPLSlice1_V_1_addr = getelementptr [60 x i180]* @glPLSlice1_V_1, i64 0, i64 %newIndex1
  %glPLSlice1_V_1_load = load i180* %glPLSlice1_V_1_addr, align 8
  %glPLSlice1_V_2_addr = getelementptr [60 x i180]* @glPLSlice1_V_2, i64 0, i64 %newIndex1
  %glPLSlice1_V_2_load = load i180* %glPLSlice1_V_2_addr, align 8
  %glPLSlice1_V_3_addr = getelementptr [60 x i180]* @glPLSlice1_V_3, i64 0, i64 %newIndex1
  %glPLSlice1_V_3_load = load i180* %glPLSlice1_V_3_addr, align 8
  %glPLSlice1_V_4_addr = getelementptr [60 x i180]* @glPLSlice1_V_4, i64 0, i64 %newIndex1
  %glPLSlice1_V_4_load = load i180* %glPLSlice1_V_4_addr, align 8
  %glPLSlice1_V_5_addr = getelementptr [60 x i180]* @glPLSlice1_V_5, i64 0, i64 %newIndex1
  %glPLSlice1_V_5_load = load i180* %glPLSlice1_V_5_addr, align 8
  %glPLSlice1_V_6_addr = getelementptr [60 x i180]* @glPLSlice1_V_6, i64 0, i64 %newIndex1
  %glPLSlice1_V_6_load = load i180* %glPLSlice1_V_6_addr, align 8
  %glPLSlice1_V_7_addr = getelementptr [60 x i180]* @glPLSlice1_V_7, i64 0, i64 %newIndex1
  %glPLSlice1_V_7_load = load i180* %glPLSlice1_V_7_addr, align 8
  %glPLSlice1_V_8_addr = getelementptr [60 x i180]* @glPLSlice1_V_8, i64 0, i64 %newIndex1
  %glPLSlice1_V_8_load = load i180* %glPLSlice1_V_8_addr, align 8
  %glPLSlice1_V_9_addr = getelementptr [60 x i180]* @glPLSlice1_V_9, i64 0, i64 %newIndex1
  %glPLSlice1_V_9_load = load i180* %glPLSlice1_V_9_addr, align 8
  %glPLSlice1_V_10_addr = getelementptr [60 x i180]* @glPLSlice1_V_10, i64 0, i64 %newIndex1
  %glPLSlice1_V_10_load = load i180* %glPLSlice1_V_10_addr, align 8
  %glPLSlice1_V_11_addr = getelementptr [60 x i180]* @glPLSlice1_V_11, i64 0, i64 %newIndex1
  %glPLSlice1_V_11_load = load i180* %glPLSlice1_V_11_addr, align 8
  %glPLSlice1_V_12_addr = getelementptr [60 x i180]* @glPLSlice1_V_12, i64 0, i64 %newIndex1
  %glPLSlice1_V_12_load = load i180* %glPLSlice1_V_12_addr, align 8
  %glPLSlice1_V_13_addr = getelementptr [60 x i180]* @glPLSlice1_V_13, i64 0, i64 %newIndex1
  %glPLSlice1_V_13_load = load i180* %glPLSlice1_V_13_addr, align 8
  %glPLSlice1_V_14_addr = getelementptr [60 x i180]* @glPLSlice1_V_14, i64 0, i64 %newIndex1
  %glPLSlice1_V_14_load = load i180* %glPLSlice1_V_14_addr, align 8
  %glPLSlice1_V_15_addr = getelementptr [60 x i180]* @glPLSlice1_V_15, i64 0, i64 %newIndex1
  %glPLSlice1_V_15_load = load i180* %glPLSlice1_V_15_addr, align 8
  %glPLSlice1_V_0_addr = getelementptr [60 x i180]* @glPLSlice1_V_0, i64 0, i64 %newIndex1
  %glPLSlice1_V_0_load = load i180* %glPLSlice1_V_0_addr, align 8
  %tmp_8 = call i180 @_ssdm_op_Mux.ap_auto.16i180.i4(i180 %glPLSlice1_V_1_load, i180 %glPLSlice1_V_2_load, i180 %glPLSlice1_V_3_load, i180 %glPLSlice1_V_4_load, i180 %glPLSlice1_V_5_load, i180 %glPLSlice1_V_6_load, i180 %glPLSlice1_V_7_load, i180 %glPLSlice1_V_8_load, i180 %glPLSlice1_V_9_load, i180 %glPLSlice1_V_10_load, i180 %glPLSlice1_V_11_load, i180 %glPLSlice1_V_12_load, i180 %glPLSlice1_V_13_load, i180 %glPLSlice1_V_14_load, i180 %glPLSlice1_V_15_load, i180 %glPLSlice1_V_0_load, i4 %arrayNo) nounwind
  %tmp_12 = trunc i180 %tmp_8 to i32
  %glPLSlice2_V_1_addr = getelementptr [60 x i180]* @glPLSlice2_V_1, i64 0, i64 %newIndex1
  %glPLSlice2_V_1_load = load i180* %glPLSlice2_V_1_addr, align 8
  %glPLSlice2_V_2_addr = getelementptr [60 x i180]* @glPLSlice2_V_2, i64 0, i64 %newIndex1
  %glPLSlice2_V_2_load = load i180* %glPLSlice2_V_2_addr, align 8
  %glPLSlice2_V_3_addr = getelementptr [60 x i180]* @glPLSlice2_V_3, i64 0, i64 %newIndex1
  %glPLSlice2_V_3_load = load i180* %glPLSlice2_V_3_addr, align 8
  %glPLSlice2_V_4_addr = getelementptr [60 x i180]* @glPLSlice2_V_4, i64 0, i64 %newIndex1
  %glPLSlice2_V_4_load = load i180* %glPLSlice2_V_4_addr, align 8
  %glPLSlice2_V_5_addr = getelementptr [60 x i180]* @glPLSlice2_V_5, i64 0, i64 %newIndex1
  %glPLSlice2_V_5_load = load i180* %glPLSlice2_V_5_addr, align 8
  %glPLSlice2_V_6_addr = getelementptr [60 x i180]* @glPLSlice2_V_6, i64 0, i64 %newIndex1
  %glPLSlice2_V_6_load = load i180* %glPLSlice2_V_6_addr, align 8
  %glPLSlice2_V_7_addr = getelementptr [60 x i180]* @glPLSlice2_V_7, i64 0, i64 %newIndex1
  %glPLSlice2_V_7_load = load i180* %glPLSlice2_V_7_addr, align 8
  %glPLSlice2_V_8_addr = getelementptr [60 x i180]* @glPLSlice2_V_8, i64 0, i64 %newIndex1
  %glPLSlice2_V_8_load = load i180* %glPLSlice2_V_8_addr, align 8
  %glPLSlice2_V_9_addr = getelementptr [60 x i180]* @glPLSlice2_V_9, i64 0, i64 %newIndex1
  %glPLSlice2_V_9_load = load i180* %glPLSlice2_V_9_addr, align 8
  %glPLSlice2_V_10_addr = getelementptr [60 x i180]* @glPLSlice2_V_10, i64 0, i64 %newIndex1
  %glPLSlice2_V_10_load = load i180* %glPLSlice2_V_10_addr, align 8
  %glPLSlice2_V_11_addr = getelementptr [60 x i180]* @glPLSlice2_V_11, i64 0, i64 %newIndex1
  %glPLSlice2_V_11_load = load i180* %glPLSlice2_V_11_addr, align 8
  %glPLSlice2_V_12_addr = getelementptr [60 x i180]* @glPLSlice2_V_12, i64 0, i64 %newIndex1
  %glPLSlice2_V_12_load = load i180* %glPLSlice2_V_12_addr, align 8
  %glPLSlice2_V_13_addr = getelementptr [60 x i180]* @glPLSlice2_V_13, i64 0, i64 %newIndex1
  %glPLSlice2_V_13_load = load i180* %glPLSlice2_V_13_addr, align 8
  %glPLSlice2_V_14_addr = getelementptr [60 x i180]* @glPLSlice2_V_14, i64 0, i64 %newIndex1
  %glPLSlice2_V_14_load = load i180* %glPLSlice2_V_14_addr, align 8
  %glPLSlice2_V_15_addr = getelementptr [60 x i180]* @glPLSlice2_V_15, i64 0, i64 %newIndex1
  %glPLSlice2_V_15_load = load i180* %glPLSlice2_V_15_addr, align 8
  %glPLSlice2_V_0_addr = getelementptr [60 x i180]* @glPLSlice2_V_0, i64 0, i64 %newIndex1
  %glPLSlice2_V_0_load = load i180* %glPLSlice2_V_0_addr, align 8
  %tmp_7 = call i180 @_ssdm_op_Mux.ap_auto.16i180.i4(i180 %glPLSlice2_V_1_load, i180 %glPLSlice2_V_2_load, i180 %glPLSlice2_V_3_load, i180 %glPLSlice2_V_4_load, i180 %glPLSlice2_V_5_load, i180 %glPLSlice2_V_6_load, i180 %glPLSlice2_V_7_load, i180 %glPLSlice2_V_8_load, i180 %glPLSlice2_V_9_load, i180 %glPLSlice2_V_10_load, i180 %glPLSlice2_V_11_load, i180 %glPLSlice2_V_12_load, i180 %glPLSlice2_V_13_load, i180 %glPLSlice2_V_14_load, i180 %glPLSlice2_V_15_load, i180 %glPLSlice2_V_0_load, i4 %arrayNo) nounwind
  %tmp_13 = trunc i180 %tmp_7 to i32
  %tmp_16_cast = zext i16 %i_op_assign_load to i17
  %i_op_assign_1 = call i17 @_ssdm_op_BitConcatenate.i17.i9.i8(i9 %y, i8 0)
  %i_op_assign_1_pn = select i1 %tmp_5, i17 %tmp_16_cast, i17 %i_op_assign_1
  %i_op_assign_1_pn_cas = zext i17 %i_op_assign_1_pn to i32
  %tmp1 = add i32 %tmp_10, %i_op_assign_1_pn_cas
  %tmp2 = add i32 %tmp_12, %tmp_13
  %storemerge = add i32 %tmp2, %tmp1
  call void @_ssdm_op_Write.ap_fifo.i32P(i32* %eventSlice, i32 %storemerge) nounwind
  %localCnt = add i16 1, %i_op_assign_load
  %glCnt_load = load i16* @glCnt, align 2
  %tmp_11 = add i16 1, %glCnt_load
  store i16 %tmp_11, i16* @glCnt, align 2
  %empty = call i32 (...)* @_ssdm_op_SpecRegionEnd([7 x i8]* @p_str14, i32 %tmp_s) nounwind
  store i16 %localCnt, i16* %i_op_assign
  br label %8

; <label>:9                                       ; preds = %8
  ret void
}

declare i9 @llvm.part.select.i9(i9, i32, i32) nounwind readnone

declare i64 @llvm.part.select.i64(i64, i32, i32) nounwind readnone

declare i10 @llvm.part.select.i10(i10, i32, i32) nounwind readnone

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

define internal fastcc void @accumulateHW(i10 signext %x, i9 %y, i1 %pol) nounwind uwtable {
  %pol_read = call i1 @_ssdm_op_Read.ap_auto.i1(i1 %pol) nounwind
  %y_read = call i9 @_ssdm_op_Read.ap_auto.i9(i9 %y) nounwind
  %x_read = call i10 @_ssdm_op_Read.ap_auto.i10(i10 %x) nounwind
  %y_cast = zext i9 %y_read to i10
  call void (...)* @_ssdm_op_SpecMemCore([60 x i180]* @glPLSlice0_V_15, [1 x i8]* @p_str10, [13 x i8]* @p_str11, [1 x i8]* @p_str10, i32 -1, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10) nounwind
  call void (...)* @_ssdm_op_SpecMemCore([60 x i180]* @glPLSlice0_V_14, [1 x i8]* @p_str10, [13 x i8]* @p_str11, [1 x i8]* @p_str10, i32 -1, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10) nounwind
  call void (...)* @_ssdm_op_SpecMemCore([60 x i180]* @glPLSlice0_V_13, [1 x i8]* @p_str10, [13 x i8]* @p_str11, [1 x i8]* @p_str10, i32 -1, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10) nounwind
  call void (...)* @_ssdm_op_SpecMemCore([60 x i180]* @glPLSlice0_V_12, [1 x i8]* @p_str10, [13 x i8]* @p_str11, [1 x i8]* @p_str10, i32 -1, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10) nounwind
  call void (...)* @_ssdm_op_SpecMemCore([60 x i180]* @glPLSlice0_V_11, [1 x i8]* @p_str10, [13 x i8]* @p_str11, [1 x i8]* @p_str10, i32 -1, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10) nounwind
  call void (...)* @_ssdm_op_SpecMemCore([60 x i180]* @glPLSlice0_V_10, [1 x i8]* @p_str10, [13 x i8]* @p_str11, [1 x i8]* @p_str10, i32 -1, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10) nounwind
  call void (...)* @_ssdm_op_SpecMemCore([60 x i180]* @glPLSlice0_V_9, [1 x i8]* @p_str10, [13 x i8]* @p_str11, [1 x i8]* @p_str10, i32 -1, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10) nounwind
  call void (...)* @_ssdm_op_SpecMemCore([60 x i180]* @glPLSlice0_V_8, [1 x i8]* @p_str10, [13 x i8]* @p_str11, [1 x i8]* @p_str10, i32 -1, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10) nounwind
  call void (...)* @_ssdm_op_SpecMemCore([60 x i180]* @glPLSlice0_V_7, [1 x i8]* @p_str10, [13 x i8]* @p_str11, [1 x i8]* @p_str10, i32 -1, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10) nounwind
  call void (...)* @_ssdm_op_SpecMemCore([60 x i180]* @glPLSlice0_V_6, [1 x i8]* @p_str10, [13 x i8]* @p_str11, [1 x i8]* @p_str10, i32 -1, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10) nounwind
  call void (...)* @_ssdm_op_SpecMemCore([60 x i180]* @glPLSlice0_V_5, [1 x i8]* @p_str10, [13 x i8]* @p_str11, [1 x i8]* @p_str10, i32 -1, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10) nounwind
  call void (...)* @_ssdm_op_SpecMemCore([60 x i180]* @glPLSlice0_V_4, [1 x i8]* @p_str10, [13 x i8]* @p_str11, [1 x i8]* @p_str10, i32 -1, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10) nounwind
  call void (...)* @_ssdm_op_SpecMemCore([60 x i180]* @glPLSlice0_V_3, [1 x i8]* @p_str10, [13 x i8]* @p_str11, [1 x i8]* @p_str10, i32 -1, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10) nounwind
  call void (...)* @_ssdm_op_SpecMemCore([60 x i180]* @glPLSlice0_V_2, [1 x i8]* @p_str10, [13 x i8]* @p_str11, [1 x i8]* @p_str10, i32 -1, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10) nounwind
  call void (...)* @_ssdm_op_SpecMemCore([60 x i180]* @glPLSlice0_V_1, [1 x i8]* @p_str10, [13 x i8]* @p_str11, [1 x i8]* @p_str10, i32 -1, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10) nounwind
  call void (...)* @_ssdm_op_SpecMemCore([60 x i180]* @glPLSlice0_V_0, [1 x i8]* @p_str10, [13 x i8]* @p_str11, [1 x i8]* @p_str10, i32 -1, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10) nounwind
  call void (...)* @_ssdm_op_SpecMemCore([60 x i180]* @glPLSlice1_V_15, [1 x i8]* @p_str10, [13 x i8]* @p_str11, [1 x i8]* @p_str10, i32 -1, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10) nounwind
  call void (...)* @_ssdm_op_SpecMemCore([60 x i180]* @glPLSlice1_V_14, [1 x i8]* @p_str10, [13 x i8]* @p_str11, [1 x i8]* @p_str10, i32 -1, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10) nounwind
  call void (...)* @_ssdm_op_SpecMemCore([60 x i180]* @glPLSlice1_V_13, [1 x i8]* @p_str10, [13 x i8]* @p_str11, [1 x i8]* @p_str10, i32 -1, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10) nounwind
  call void (...)* @_ssdm_op_SpecMemCore([60 x i180]* @glPLSlice1_V_12, [1 x i8]* @p_str10, [13 x i8]* @p_str11, [1 x i8]* @p_str10, i32 -1, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10) nounwind
  call void (...)* @_ssdm_op_SpecMemCore([60 x i180]* @glPLSlice1_V_11, [1 x i8]* @p_str10, [13 x i8]* @p_str11, [1 x i8]* @p_str10, i32 -1, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10) nounwind
  call void (...)* @_ssdm_op_SpecMemCore([60 x i180]* @glPLSlice1_V_10, [1 x i8]* @p_str10, [13 x i8]* @p_str11, [1 x i8]* @p_str10, i32 -1, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10) nounwind
  call void (...)* @_ssdm_op_SpecMemCore([60 x i180]* @glPLSlice1_V_9, [1 x i8]* @p_str10, [13 x i8]* @p_str11, [1 x i8]* @p_str10, i32 -1, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10) nounwind
  call void (...)* @_ssdm_op_SpecMemCore([60 x i180]* @glPLSlice1_V_8, [1 x i8]* @p_str10, [13 x i8]* @p_str11, [1 x i8]* @p_str10, i32 -1, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10) nounwind
  call void (...)* @_ssdm_op_SpecMemCore([60 x i180]* @glPLSlice1_V_7, [1 x i8]* @p_str10, [13 x i8]* @p_str11, [1 x i8]* @p_str10, i32 -1, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10) nounwind
  call void (...)* @_ssdm_op_SpecMemCore([60 x i180]* @glPLSlice1_V_6, [1 x i8]* @p_str10, [13 x i8]* @p_str11, [1 x i8]* @p_str10, i32 -1, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10) nounwind
  call void (...)* @_ssdm_op_SpecMemCore([60 x i180]* @glPLSlice1_V_5, [1 x i8]* @p_str10, [13 x i8]* @p_str11, [1 x i8]* @p_str10, i32 -1, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10) nounwind
  call void (...)* @_ssdm_op_SpecMemCore([60 x i180]* @glPLSlice1_V_4, [1 x i8]* @p_str10, [13 x i8]* @p_str11, [1 x i8]* @p_str10, i32 -1, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10) nounwind
  call void (...)* @_ssdm_op_SpecMemCore([60 x i180]* @glPLSlice1_V_3, [1 x i8]* @p_str10, [13 x i8]* @p_str11, [1 x i8]* @p_str10, i32 -1, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10) nounwind
  call void (...)* @_ssdm_op_SpecMemCore([60 x i180]* @glPLSlice1_V_2, [1 x i8]* @p_str10, [13 x i8]* @p_str11, [1 x i8]* @p_str10, i32 -1, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10) nounwind
  call void (...)* @_ssdm_op_SpecMemCore([60 x i180]* @glPLSlice1_V_1, [1 x i8]* @p_str10, [13 x i8]* @p_str11, [1 x i8]* @p_str10, i32 -1, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10) nounwind
  call void (...)* @_ssdm_op_SpecMemCore([60 x i180]* @glPLSlice1_V_0, [1 x i8]* @p_str10, [13 x i8]* @p_str11, [1 x i8]* @p_str10, i32 -1, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10) nounwind
  call void (...)* @_ssdm_op_SpecMemCore([60 x i180]* @glPLSlice2_V_15, [1 x i8]* @p_str10, [13 x i8]* @p_str11, [1 x i8]* @p_str10, i32 -1, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10) nounwind
  call void (...)* @_ssdm_op_SpecMemCore([60 x i180]* @glPLSlice2_V_14, [1 x i8]* @p_str10, [13 x i8]* @p_str11, [1 x i8]* @p_str10, i32 -1, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10) nounwind
  call void (...)* @_ssdm_op_SpecMemCore([60 x i180]* @glPLSlice2_V_13, [1 x i8]* @p_str10, [13 x i8]* @p_str11, [1 x i8]* @p_str10, i32 -1, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10) nounwind
  call void (...)* @_ssdm_op_SpecMemCore([60 x i180]* @glPLSlice2_V_12, [1 x i8]* @p_str10, [13 x i8]* @p_str11, [1 x i8]* @p_str10, i32 -1, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10) nounwind
  call void (...)* @_ssdm_op_SpecMemCore([60 x i180]* @glPLSlice2_V_11, [1 x i8]* @p_str10, [13 x i8]* @p_str11, [1 x i8]* @p_str10, i32 -1, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10) nounwind
  call void (...)* @_ssdm_op_SpecMemCore([60 x i180]* @glPLSlice2_V_10, [1 x i8]* @p_str10, [13 x i8]* @p_str11, [1 x i8]* @p_str10, i32 -1, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10) nounwind
  call void (...)* @_ssdm_op_SpecMemCore([60 x i180]* @glPLSlice2_V_9, [1 x i8]* @p_str10, [13 x i8]* @p_str11, [1 x i8]* @p_str10, i32 -1, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10) nounwind
  call void (...)* @_ssdm_op_SpecMemCore([60 x i180]* @glPLSlice2_V_8, [1 x i8]* @p_str10, [13 x i8]* @p_str11, [1 x i8]* @p_str10, i32 -1, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10) nounwind
  call void (...)* @_ssdm_op_SpecMemCore([60 x i180]* @glPLSlice2_V_7, [1 x i8]* @p_str10, [13 x i8]* @p_str11, [1 x i8]* @p_str10, i32 -1, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10) nounwind
  call void (...)* @_ssdm_op_SpecMemCore([60 x i180]* @glPLSlice2_V_6, [1 x i8]* @p_str10, [13 x i8]* @p_str11, [1 x i8]* @p_str10, i32 -1, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10) nounwind
  call void (...)* @_ssdm_op_SpecMemCore([60 x i180]* @glPLSlice2_V_5, [1 x i8]* @p_str10, [13 x i8]* @p_str11, [1 x i8]* @p_str10, i32 -1, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10) nounwind
  call void (...)* @_ssdm_op_SpecMemCore([60 x i180]* @glPLSlice2_V_4, [1 x i8]* @p_str10, [13 x i8]* @p_str11, [1 x i8]* @p_str10, i32 -1, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10) nounwind
  call void (...)* @_ssdm_op_SpecMemCore([60 x i180]* @glPLSlice2_V_3, [1 x i8]* @p_str10, [13 x i8]* @p_str11, [1 x i8]* @p_str10, i32 -1, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10) nounwind
  call void (...)* @_ssdm_op_SpecMemCore([60 x i180]* @glPLSlice2_V_2, [1 x i8]* @p_str10, [13 x i8]* @p_str11, [1 x i8]* @p_str10, i32 -1, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10) nounwind
  call void (...)* @_ssdm_op_SpecMemCore([60 x i180]* @glPLSlice2_V_1, [1 x i8]* @p_str10, [13 x i8]* @p_str11, [1 x i8]* @p_str10, i32 -1, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10) nounwind
  call void (...)* @_ssdm_op_SpecMemCore([60 x i180]* @glPLSlice2_V_0, [1 x i8]* @p_str10, [13 x i8]* @p_str11, [1 x i8]* @p_str10, i32 -1, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10) nounwind
  %tmp = shl i10 %x_read, 2
  %tmp_s = call i7 @_ssdm_op_PartSelect.i7.i9.i32.i32(i9 %y_read, i32 2, i32 8)
  %tmp_12 = call i9 @_ssdm_op_BitConcatenate.i9.i7.i2(i7 %tmp_s, i2 0)
  %tmp_30_cast = sext i9 %tmp_12 to i10
  %p_s = add i10 %tmp, %y_cast
  %xNewIdx_V = sub i10 %p_s, %tmp_30_cast
  br i1 %pol_read, label %1, label %._crit_edge

; <label>:1                                       ; preds = %0
  %glPLActiveSliceIdx_V_2 = load i2* @glPLActiveSliceIdx_V, align 1
  %tmp_13 = icmp eq i2 %glPLActiveSliceIdx_V_2, 0
  br i1 %tmp_13, label %2, label %4

; <label>:2                                       ; preds = %1
  %tmp_14 = trunc i10 %xNewIdx_V to i4
  %newIndex2 = call i6 @_ssdm_op_PartSelect.i6.i10.i32.i32(i10 %xNewIdx_V, i32 4, i32 9)
  %newIndex3 = zext i6 %newIndex2 to i64
  %glPLSlice0_V_0_addr = getelementptr [60 x i180]* @glPLSlice0_V_0, i64 0, i64 %newIndex3
  %glPLSlice0_V_1_addr = getelementptr [60 x i180]* @glPLSlice0_V_1, i64 0, i64 %newIndex3
  %glPLSlice0_V_2_addr = getelementptr [60 x i180]* @glPLSlice0_V_2, i64 0, i64 %newIndex3
  %glPLSlice0_V_3_addr = getelementptr [60 x i180]* @glPLSlice0_V_3, i64 0, i64 %newIndex3
  %glPLSlice0_V_4_addr = getelementptr [60 x i180]* @glPLSlice0_V_4, i64 0, i64 %newIndex3
  %glPLSlice0_V_5_addr = getelementptr [60 x i180]* @glPLSlice0_V_5, i64 0, i64 %newIndex3
  %glPLSlice0_V_6_addr = getelementptr [60 x i180]* @glPLSlice0_V_6, i64 0, i64 %newIndex3
  %glPLSlice0_V_7_addr = getelementptr [60 x i180]* @glPLSlice0_V_7, i64 0, i64 %newIndex3
  %glPLSlice0_V_8_addr = getelementptr [60 x i180]* @glPLSlice0_V_8, i64 0, i64 %newIndex3
  %glPLSlice0_V_9_addr = getelementptr [60 x i180]* @glPLSlice0_V_9, i64 0, i64 %newIndex3
  %glPLSlice0_V_10_addr = getelementptr [60 x i180]* @glPLSlice0_V_10, i64 0, i64 %newIndex3
  %glPLSlice0_V_11_addr = getelementptr [60 x i180]* @glPLSlice0_V_11, i64 0, i64 %newIndex3
  %glPLSlice0_V_12_addr = getelementptr [60 x i180]* @glPLSlice0_V_12, i64 0, i64 %newIndex3
  %glPLSlice0_V_13_addr = getelementptr [60 x i180]* @glPLSlice0_V_13, i64 0, i64 %newIndex3
  %glPLSlice0_V_14_addr = getelementptr [60 x i180]* @glPLSlice0_V_14, i64 0, i64 %newIndex3
  %glPLSlice0_V_15_addr = getelementptr [60 x i180]* @glPLSlice0_V_15, i64 0, i64 %newIndex3
  %glPLSlice0_V_0_load = load i180* %glPLSlice0_V_0_addr, align 8
  %glPLSlice0_V_1_load = load i180* %glPLSlice0_V_1_addr, align 8
  %glPLSlice0_V_2_load = load i180* %glPLSlice0_V_2_addr, align 8
  %glPLSlice0_V_3_load = load i180* %glPLSlice0_V_3_addr, align 8
  %glPLSlice0_V_4_load = load i180* %glPLSlice0_V_4_addr, align 8
  %glPLSlice0_V_5_load = load i180* %glPLSlice0_V_5_addr, align 8
  %glPLSlice0_V_6_load = load i180* %glPLSlice0_V_6_addr, align 8
  %glPLSlice0_V_7_load = load i180* %glPLSlice0_V_7_addr, align 8
  %glPLSlice0_V_8_load = load i180* %glPLSlice0_V_8_addr, align 8
  %glPLSlice0_V_9_load = load i180* %glPLSlice0_V_9_addr, align 8
  %glPLSlice0_V_10_load = load i180* %glPLSlice0_V_10_addr, align 8
  %glPLSlice0_V_11_load = load i180* %glPLSlice0_V_11_addr, align 8
  %glPLSlice0_V_12_load = load i180* %glPLSlice0_V_12_addr, align 8
  %glPLSlice0_V_13_load = load i180* %glPLSlice0_V_13_addr, align 8
  %glPLSlice0_V_14_load = load i180* %glPLSlice0_V_14_addr, align 8
  %glPLSlice0_V_15_load = load i180* %glPLSlice0_V_15_addr, align 8
  %tmpData_V = call i180 @_ssdm_op_Mux.ap_auto.16i180.i4(i180 %glPLSlice0_V_0_load, i180 %glPLSlice0_V_1_load, i180 %glPLSlice0_V_2_load, i180 %glPLSlice0_V_3_load, i180 %glPLSlice0_V_4_load, i180 %glPLSlice0_V_5_load, i180 %glPLSlice0_V_6_load, i180 %glPLSlice0_V_7_load, i180 %glPLSlice0_V_8_load, i180 %glPLSlice0_V_9_load, i180 %glPLSlice0_V_10_load, i180 %glPLSlice0_V_11_load, i180 %glPLSlice0_V_12_load, i180 %glPLSlice0_V_13_load, i180 %glPLSlice0_V_14_load, i180 %glPLSlice0_V_15_load, i4 %tmp_14) nounwind
  %tmp_33_cast = sext i9 %tmp_12 to i32
  %tmp_15 = call i1 @_ssdm_op_BitSelect.i1.i180.i32(i180 %tmpData_V, i32 %tmp_33_cast)
  %index_assign_1_s = or i32 %tmp_33_cast, 1
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
  %tmp_20 = call i180 @_ssdm_op_BitSet.i180.i180.i32.i64(i180 %tmpData_V, i32 %tmp_33_cast, i64 %p_Repl2_2)
  %tmp_22 = call i1 @_ssdm_op_BitSelect.i1.i4.i32(i4 %tmpTmpData_V, i32 1)
  %p_Repl2_2_1 = zext i1 %tmp_22 to i64
  %tmp_23 = call i180 @_ssdm_op_BitSet.i180.i180.i32.i64(i180 %tmp_20, i32 %index_assign_1_s, i64 %p_Repl2_2_1)
  %tmp_24 = call i1 @_ssdm_op_BitSelect.i1.i4.i32(i4 %tmpTmpData_V, i32 2)
  %p_Repl2_2_2 = zext i1 %tmp_24 to i64
  %tmp_25 = call i180 @_ssdm_op_BitSet.i180.i180.i32.i64(i180 %tmp_23, i32 %index_assign_1_1_cas, i64 %p_Repl2_2_2)
  %tmp_27 = call i1 @_ssdm_op_BitSelect.i1.i4.i32(i4 %tmpTmpData_V, i32 3)
  %p_Repl2_2_3 = zext i1 %tmp_27 to i64
  %tmp_28 = call i180 @_ssdm_op_BitSet.i180.i180.i32.i64(i180 %tmp_25, i32 %index_assign_1_2_cas, i64 %p_Repl2_2_3)
  switch i4 %tmp_14, label %branch47 [
    i4 0, label %branch32
    i4 1, label %branch33
    i4 2, label %branch34
    i4 3, label %branch35
    i4 4, label %branch36
    i4 5, label %branch37
    i4 6, label %branch38
    i4 7, label %branch39
    i4 -8, label %branch40
    i4 -7, label %branch41
    i4 -6, label %branch42
    i4 -5, label %branch43
    i4 -4, label %branch44
    i4 -3, label %branch45
    i4 -2, label %branch46
  ]

; <label>:3                                       ; preds = %branch47, %branch46, %branch45, %branch44, %branch43, %branch42, %branch41, %branch40, %branch39, %branch38, %branch37, %branch36, %branch35, %branch34, %branch33, %branch32
  br label %11

; <label>:4                                       ; preds = %1
  %tmp_21 = icmp eq i2 %glPLActiveSliceIdx_V_2, 1
  br i1 %tmp_21, label %5, label %7

; <label>:5                                       ; preds = %4
  %tmp_29 = trunc i10 %xNewIdx_V to i4
  %newIndex4 = call i6 @_ssdm_op_PartSelect.i6.i10.i32.i32(i10 %xNewIdx_V, i32 4, i32 9)
  %newIndex5 = zext i6 %newIndex4 to i64
  %glPLSlice1_V_0_addr = getelementptr [60 x i180]* @glPLSlice1_V_0, i64 0, i64 %newIndex5
  %glPLSlice1_V_1_addr = getelementptr [60 x i180]* @glPLSlice1_V_1, i64 0, i64 %newIndex5
  %glPLSlice1_V_2_addr = getelementptr [60 x i180]* @glPLSlice1_V_2, i64 0, i64 %newIndex5
  %glPLSlice1_V_3_addr = getelementptr [60 x i180]* @glPLSlice1_V_3, i64 0, i64 %newIndex5
  %glPLSlice1_V_4_addr = getelementptr [60 x i180]* @glPLSlice1_V_4, i64 0, i64 %newIndex5
  %glPLSlice1_V_5_addr = getelementptr [60 x i180]* @glPLSlice1_V_5, i64 0, i64 %newIndex5
  %glPLSlice1_V_6_addr = getelementptr [60 x i180]* @glPLSlice1_V_6, i64 0, i64 %newIndex5
  %glPLSlice1_V_7_addr = getelementptr [60 x i180]* @glPLSlice1_V_7, i64 0, i64 %newIndex5
  %glPLSlice1_V_8_addr = getelementptr [60 x i180]* @glPLSlice1_V_8, i64 0, i64 %newIndex5
  %glPLSlice1_V_9_addr = getelementptr [60 x i180]* @glPLSlice1_V_9, i64 0, i64 %newIndex5
  %glPLSlice1_V_10_addr = getelementptr [60 x i180]* @glPLSlice1_V_10, i64 0, i64 %newIndex5
  %glPLSlice1_V_11_addr = getelementptr [60 x i180]* @glPLSlice1_V_11, i64 0, i64 %newIndex5
  %glPLSlice1_V_12_addr = getelementptr [60 x i180]* @glPLSlice1_V_12, i64 0, i64 %newIndex5
  %glPLSlice1_V_13_addr = getelementptr [60 x i180]* @glPLSlice1_V_13, i64 0, i64 %newIndex5
  %glPLSlice1_V_14_addr = getelementptr [60 x i180]* @glPLSlice1_V_14, i64 0, i64 %newIndex5
  %glPLSlice1_V_15_addr = getelementptr [60 x i180]* @glPLSlice1_V_15, i64 0, i64 %newIndex5
  %glPLSlice1_V_0_load = load i180* %glPLSlice1_V_0_addr, align 8
  %glPLSlice1_V_1_load = load i180* %glPLSlice1_V_1_addr, align 8
  %glPLSlice1_V_2_load = load i180* %glPLSlice1_V_2_addr, align 8
  %glPLSlice1_V_3_load = load i180* %glPLSlice1_V_3_addr, align 8
  %glPLSlice1_V_4_load = load i180* %glPLSlice1_V_4_addr, align 8
  %glPLSlice1_V_5_load = load i180* %glPLSlice1_V_5_addr, align 8
  %glPLSlice1_V_6_load = load i180* %glPLSlice1_V_6_addr, align 8
  %glPLSlice1_V_7_load = load i180* %glPLSlice1_V_7_addr, align 8
  %glPLSlice1_V_8_load = load i180* %glPLSlice1_V_8_addr, align 8
  %glPLSlice1_V_9_load = load i180* %glPLSlice1_V_9_addr, align 8
  %glPLSlice1_V_10_load = load i180* %glPLSlice1_V_10_addr, align 8
  %glPLSlice1_V_11_load = load i180* %glPLSlice1_V_11_addr, align 8
  %glPLSlice1_V_12_load = load i180* %glPLSlice1_V_12_addr, align 8
  %glPLSlice1_V_13_load = load i180* %glPLSlice1_V_13_addr, align 8
  %glPLSlice1_V_14_load = load i180* %glPLSlice1_V_14_addr, align 8
  %glPLSlice1_V_15_load = load i180* %glPLSlice1_V_15_addr, align 8
  %tmpData_V_1 = call i180 @_ssdm_op_Mux.ap_auto.16i180.i4(i180 %glPLSlice1_V_0_load, i180 %glPLSlice1_V_1_load, i180 %glPLSlice1_V_2_load, i180 %glPLSlice1_V_3_load, i180 %glPLSlice1_V_4_load, i180 %glPLSlice1_V_5_load, i180 %glPLSlice1_V_6_load, i180 %glPLSlice1_V_7_load, i180 %glPLSlice1_V_8_load, i180 %glPLSlice1_V_9_load, i180 %glPLSlice1_V_10_load, i180 %glPLSlice1_V_11_load, i180 %glPLSlice1_V_12_load, i180 %glPLSlice1_V_13_load, i180 %glPLSlice1_V_14_load, i180 %glPLSlice1_V_15_load, i4 %tmp_29) nounwind
  %tmp_40_cast = sext i9 %tmp_12 to i32
  %tmp_30 = call i1 @_ssdm_op_BitSelect.i1.i180.i32(i180 %tmpData_V_1, i32 %tmp_40_cast)
  %index_assign_5_s = or i32 %tmp_40_cast, 1
  %tmp_31 = call i1 @_ssdm_op_BitSelect.i1.i180.i32(i180 %tmpData_V_1, i32 %index_assign_5_s)
  %index_assign_5_1 = or i9 %tmp_12, 2
  %index_assign_5_1_cas = sext i9 %index_assign_5_1 to i32
  %tmp_32 = call i1 @_ssdm_op_BitSelect.i1.i180.i32(i180 %tmpData_V_1, i32 %index_assign_5_1_cas)
  %index_assign_5_2 = or i9 %tmp_12, 3
  %index_assign_5_2_cas = sext i9 %index_assign_5_2 to i32
  %tmp_33 = call i1 @_ssdm_op_BitSelect.i1.i180.i32(i180 %tmpData_V_1, i32 %index_assign_5_2_cas)
  %p_Result_14_3 = call i4 @_ssdm_op_BitConcatenate.i4.i1.i1.i1.i1(i1 %tmp_33, i1 %tmp_32, i1 %tmp_31, i1 %tmp_30)
  %tmpTmpData_V_1 = add i4 1, %p_Result_14_3
  %tmp_34 = trunc i4 %tmpTmpData_V_1 to i1
  %p_Repl2_4 = zext i1 %tmp_34 to i64
  %tmp_35 = call i180 @_ssdm_op_BitSet.i180.i180.i32.i64(i180 %tmpData_V_1, i32 %tmp_40_cast, i64 %p_Repl2_4)
  %tmp_36 = call i1 @_ssdm_op_BitSelect.i1.i4.i32(i4 %tmpTmpData_V_1, i32 1)
  %p_Repl2_4_1 = zext i1 %tmp_36 to i64
  %tmp_37 = call i180 @_ssdm_op_BitSet.i180.i180.i32.i64(i180 %tmp_35, i32 %index_assign_5_s, i64 %p_Repl2_4_1)
  %tmp_38 = call i1 @_ssdm_op_BitSelect.i1.i4.i32(i4 %tmpTmpData_V_1, i32 2)
  %p_Repl2_4_2 = zext i1 %tmp_38 to i64
  %tmp_39 = call i180 @_ssdm_op_BitSet.i180.i180.i32.i64(i180 %tmp_37, i32 %index_assign_5_1_cas, i64 %p_Repl2_4_2)
  %tmp_40 = call i1 @_ssdm_op_BitSelect.i1.i4.i32(i4 %tmpTmpData_V_1, i32 3)
  %p_Repl2_4_3 = zext i1 %tmp_40 to i64
  %tmp_41 = call i180 @_ssdm_op_BitSet.i180.i180.i32.i64(i180 %tmp_39, i32 %index_assign_5_2_cas, i64 %p_Repl2_4_3)
  switch i4 %tmp_29, label %branch31 [
    i4 0, label %branch16
    i4 1, label %branch17
    i4 2, label %branch18
    i4 3, label %branch19
    i4 4, label %branch20
    i4 5, label %branch21
    i4 6, label %branch22
    i4 7, label %branch23
    i4 -8, label %branch24
    i4 -7, label %branch25
    i4 -6, label %branch26
    i4 -5, label %branch27
    i4 -4, label %branch28
    i4 -3, label %branch29
    i4 -2, label %branch30
  ]

; <label>:6                                       ; preds = %branch31, %branch30, %branch29, %branch28, %branch27, %branch26, %branch25, %branch24, %branch23, %branch22, %branch21, %branch20, %branch19, %branch18, %branch17, %branch16
  br label %10

; <label>:7                                       ; preds = %4
  %tmp_26 = icmp eq i2 %glPLActiveSliceIdx_V_2, -2
  br i1 %tmp_26, label %8, label %._crit_edge1

; <label>:8                                       ; preds = %7
  %tmp_42 = trunc i10 %xNewIdx_V to i4
  %newIndex = call i6 @_ssdm_op_PartSelect.i6.i10.i32.i32(i10 %xNewIdx_V, i32 4, i32 9)
  %newIndex6 = zext i6 %newIndex to i64
  %glPLSlice2_V_0_addr = getelementptr [60 x i180]* @glPLSlice2_V_0, i64 0, i64 %newIndex6
  %glPLSlice2_V_1_addr = getelementptr [60 x i180]* @glPLSlice2_V_1, i64 0, i64 %newIndex6
  %glPLSlice2_V_2_addr = getelementptr [60 x i180]* @glPLSlice2_V_2, i64 0, i64 %newIndex6
  %glPLSlice2_V_3_addr = getelementptr [60 x i180]* @glPLSlice2_V_3, i64 0, i64 %newIndex6
  %glPLSlice2_V_4_addr = getelementptr [60 x i180]* @glPLSlice2_V_4, i64 0, i64 %newIndex6
  %glPLSlice2_V_5_addr = getelementptr [60 x i180]* @glPLSlice2_V_5, i64 0, i64 %newIndex6
  %glPLSlice2_V_6_addr = getelementptr [60 x i180]* @glPLSlice2_V_6, i64 0, i64 %newIndex6
  %glPLSlice2_V_7_addr = getelementptr [60 x i180]* @glPLSlice2_V_7, i64 0, i64 %newIndex6
  %glPLSlice2_V_8_addr = getelementptr [60 x i180]* @glPLSlice2_V_8, i64 0, i64 %newIndex6
  %glPLSlice2_V_9_addr = getelementptr [60 x i180]* @glPLSlice2_V_9, i64 0, i64 %newIndex6
  %glPLSlice2_V_10_addr = getelementptr [60 x i180]* @glPLSlice2_V_10, i64 0, i64 %newIndex6
  %glPLSlice2_V_11_addr = getelementptr [60 x i180]* @glPLSlice2_V_11, i64 0, i64 %newIndex6
  %glPLSlice2_V_12_addr = getelementptr [60 x i180]* @glPLSlice2_V_12, i64 0, i64 %newIndex6
  %glPLSlice2_V_13_addr = getelementptr [60 x i180]* @glPLSlice2_V_13, i64 0, i64 %newIndex6
  %glPLSlice2_V_14_addr = getelementptr [60 x i180]* @glPLSlice2_V_14, i64 0, i64 %newIndex6
  %glPLSlice2_V_15_addr = getelementptr [60 x i180]* @glPLSlice2_V_15, i64 0, i64 %newIndex6
  %glPLSlice2_V_0_load = load i180* %glPLSlice2_V_0_addr, align 8
  %glPLSlice2_V_1_load = load i180* %glPLSlice2_V_1_addr, align 8
  %glPLSlice2_V_2_load = load i180* %glPLSlice2_V_2_addr, align 8
  %glPLSlice2_V_3_load = load i180* %glPLSlice2_V_3_addr, align 8
  %glPLSlice2_V_4_load = load i180* %glPLSlice2_V_4_addr, align 8
  %glPLSlice2_V_5_load = load i180* %glPLSlice2_V_5_addr, align 8
  %glPLSlice2_V_6_load = load i180* %glPLSlice2_V_6_addr, align 8
  %glPLSlice2_V_7_load = load i180* %glPLSlice2_V_7_addr, align 8
  %glPLSlice2_V_8_load = load i180* %glPLSlice2_V_8_addr, align 8
  %glPLSlice2_V_9_load = load i180* %glPLSlice2_V_9_addr, align 8
  %glPLSlice2_V_10_load = load i180* %glPLSlice2_V_10_addr, align 8
  %glPLSlice2_V_11_load = load i180* %glPLSlice2_V_11_addr, align 8
  %glPLSlice2_V_12_load = load i180* %glPLSlice2_V_12_addr, align 8
  %glPLSlice2_V_13_load = load i180* %glPLSlice2_V_13_addr, align 8
  %glPLSlice2_V_14_load = load i180* %glPLSlice2_V_14_addr, align 8
  %glPLSlice2_V_15_load = load i180* %glPLSlice2_V_15_addr, align 8
  %tmpData_V_2 = call i180 @_ssdm_op_Mux.ap_auto.16i180.i4(i180 %glPLSlice2_V_0_load, i180 %glPLSlice2_V_1_load, i180 %glPLSlice2_V_2_load, i180 %glPLSlice2_V_3_load, i180 %glPLSlice2_V_4_load, i180 %glPLSlice2_V_5_load, i180 %glPLSlice2_V_6_load, i180 %glPLSlice2_V_7_load, i180 %glPLSlice2_V_8_load, i180 %glPLSlice2_V_9_load, i180 %glPLSlice2_V_10_load, i180 %glPLSlice2_V_11_load, i180 %glPLSlice2_V_12_load, i180 %glPLSlice2_V_13_load, i180 %glPLSlice2_V_14_load, i180 %glPLSlice2_V_15_load, i4 %tmp_42) nounwind
  %tmp_47_cast = sext i9 %tmp_12 to i32
  %tmp_43 = call i1 @_ssdm_op_BitSelect.i1.i180.i32(i180 %tmpData_V_2, i32 %tmp_47_cast)
  %index_assign_9_s = or i32 %tmp_47_cast, 1
  %tmp_44 = call i1 @_ssdm_op_BitSelect.i1.i180.i32(i180 %tmpData_V_2, i32 %index_assign_9_s)
  %index_assign_9_1 = or i9 %tmp_12, 2
  %index_assign_9_1_cas = sext i9 %index_assign_9_1 to i32
  %tmp_45 = call i1 @_ssdm_op_BitSelect.i1.i180.i32(i180 %tmpData_V_2, i32 %index_assign_9_1_cas)
  %index_assign_9_2 = or i9 %tmp_12, 3
  %index_assign_9_2_cas = sext i9 %index_assign_9_2 to i32
  %tmp_46 = call i1 @_ssdm_op_BitSelect.i1.i180.i32(i180 %tmpData_V_2, i32 %index_assign_9_2_cas)
  %p_Result_16_3 = call i4 @_ssdm_op_BitConcatenate.i4.i1.i1.i1.i1(i1 %tmp_46, i1 %tmp_45, i1 %tmp_44, i1 %tmp_43)
  %tmpTmpData_V_2 = add i4 1, %p_Result_16_3
  %tmp_47 = trunc i4 %tmpTmpData_V_2 to i1
  %p_Repl2_5 = zext i1 %tmp_47 to i64
  %tmp_48 = call i180 @_ssdm_op_BitSet.i180.i180.i32.i64(i180 %tmpData_V_2, i32 %tmp_47_cast, i64 %p_Repl2_5)
  %tmp_49 = call i1 @_ssdm_op_BitSelect.i1.i4.i32(i4 %tmpTmpData_V_2, i32 1)
  %p_Repl2_5_1 = zext i1 %tmp_49 to i64
  %tmp_50 = call i180 @_ssdm_op_BitSet.i180.i180.i32.i64(i180 %tmp_48, i32 %index_assign_9_s, i64 %p_Repl2_5_1)
  %tmp_51 = call i1 @_ssdm_op_BitSelect.i1.i4.i32(i4 %tmpTmpData_V_2, i32 2)
  %p_Repl2_5_2 = zext i1 %tmp_51 to i64
  %tmp_52 = call i180 @_ssdm_op_BitSet.i180.i180.i32.i64(i180 %tmp_50, i32 %index_assign_9_1_cas, i64 %p_Repl2_5_2)
  %tmp_53 = call i1 @_ssdm_op_BitSelect.i1.i4.i32(i4 %tmpTmpData_V_2, i32 3)
  %p_Repl2_5_3 = zext i1 %tmp_53 to i64
  %tmp_54 = call i180 @_ssdm_op_BitSet.i180.i180.i32.i64(i180 %tmp_52, i32 %index_assign_9_2_cas, i64 %p_Repl2_5_3)
  switch i4 %tmp_42, label %branch15 [
    i4 0, label %branch0
    i4 1, label %branch1
    i4 2, label %branch2
    i4 3, label %branch3
    i4 4, label %branch4
    i4 5, label %branch5
    i4 6, label %branch6
    i4 7, label %branch7
    i4 -8, label %branch8
    i4 -7, label %branch9
    i4 -6, label %branch10
    i4 -5, label %branch11
    i4 -4, label %branch12
    i4 -3, label %branch13
    i4 -2, label %branch14
  ]

; <label>:9                                       ; preds = %branch15, %branch14, %branch13, %branch12, %branch11, %branch10, %branch9, %branch8, %branch7, %branch6, %branch5, %branch4, %branch3, %branch2, %branch1, %branch0
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %9, %7
  br label %10

; <label>:10                                      ; preds = %._crit_edge1, %6
  br label %11

; <label>:11                                      ; preds = %10, %3
  br label %._crit_edge

._crit_edge:                                      ; preds = %11, %0
  ret void

branch0:                                          ; preds = %8
  store i180 %tmp_54, i180* %glPLSlice2_V_0_addr, align 8
  br label %9

branch1:                                          ; preds = %8
  store i180 %tmp_54, i180* %glPLSlice2_V_1_addr, align 8
  br label %9

branch2:                                          ; preds = %8
  store i180 %tmp_54, i180* %glPLSlice2_V_2_addr, align 8
  br label %9

branch3:                                          ; preds = %8
  store i180 %tmp_54, i180* %glPLSlice2_V_3_addr, align 8
  br label %9

branch4:                                          ; preds = %8
  store i180 %tmp_54, i180* %glPLSlice2_V_4_addr, align 8
  br label %9

branch5:                                          ; preds = %8
  store i180 %tmp_54, i180* %glPLSlice2_V_5_addr, align 8
  br label %9

branch6:                                          ; preds = %8
  store i180 %tmp_54, i180* %glPLSlice2_V_6_addr, align 8
  br label %9

branch7:                                          ; preds = %8
  store i180 %tmp_54, i180* %glPLSlice2_V_7_addr, align 8
  br label %9

branch8:                                          ; preds = %8
  store i180 %tmp_54, i180* %glPLSlice2_V_8_addr, align 8
  br label %9

branch9:                                          ; preds = %8
  store i180 %tmp_54, i180* %glPLSlice2_V_9_addr, align 8
  br label %9

branch10:                                         ; preds = %8
  store i180 %tmp_54, i180* %glPLSlice2_V_10_addr, align 8
  br label %9

branch11:                                         ; preds = %8
  store i180 %tmp_54, i180* %glPLSlice2_V_11_addr, align 8
  br label %9

branch12:                                         ; preds = %8
  store i180 %tmp_54, i180* %glPLSlice2_V_12_addr, align 8
  br label %9

branch13:                                         ; preds = %8
  store i180 %tmp_54, i180* %glPLSlice2_V_13_addr, align 8
  br label %9

branch14:                                         ; preds = %8
  store i180 %tmp_54, i180* %glPLSlice2_V_14_addr, align 8
  br label %9

branch15:                                         ; preds = %8
  store i180 %tmp_54, i180* %glPLSlice2_V_15_addr, align 8
  br label %9

branch16:                                         ; preds = %5
  store i180 %tmp_41, i180* %glPLSlice1_V_0_addr, align 8
  br label %6

branch17:                                         ; preds = %5
  store i180 %tmp_41, i180* %glPLSlice1_V_1_addr, align 8
  br label %6

branch18:                                         ; preds = %5
  store i180 %tmp_41, i180* %glPLSlice1_V_2_addr, align 8
  br label %6

branch19:                                         ; preds = %5
  store i180 %tmp_41, i180* %glPLSlice1_V_3_addr, align 8
  br label %6

branch20:                                         ; preds = %5
  store i180 %tmp_41, i180* %glPLSlice1_V_4_addr, align 8
  br label %6

branch21:                                         ; preds = %5
  store i180 %tmp_41, i180* %glPLSlice1_V_5_addr, align 8
  br label %6

branch22:                                         ; preds = %5
  store i180 %tmp_41, i180* %glPLSlice1_V_6_addr, align 8
  br label %6

branch23:                                         ; preds = %5
  store i180 %tmp_41, i180* %glPLSlice1_V_7_addr, align 8
  br label %6

branch24:                                         ; preds = %5
  store i180 %tmp_41, i180* %glPLSlice1_V_8_addr, align 8
  br label %6

branch25:                                         ; preds = %5
  store i180 %tmp_41, i180* %glPLSlice1_V_9_addr, align 8
  br label %6

branch26:                                         ; preds = %5
  store i180 %tmp_41, i180* %glPLSlice1_V_10_addr, align 8
  br label %6

branch27:                                         ; preds = %5
  store i180 %tmp_41, i180* %glPLSlice1_V_11_addr, align 8
  br label %6

branch28:                                         ; preds = %5
  store i180 %tmp_41, i180* %glPLSlice1_V_12_addr, align 8
  br label %6

branch29:                                         ; preds = %5
  store i180 %tmp_41, i180* %glPLSlice1_V_13_addr, align 8
  br label %6

branch30:                                         ; preds = %5
  store i180 %tmp_41, i180* %glPLSlice1_V_14_addr, align 8
  br label %6

branch31:                                         ; preds = %5
  store i180 %tmp_41, i180* %glPLSlice1_V_15_addr, align 8
  br label %6

branch32:                                         ; preds = %2
  store i180 %tmp_28, i180* %glPLSlice0_V_0_addr, align 8
  br label %3

branch33:                                         ; preds = %2
  store i180 %tmp_28, i180* %glPLSlice0_V_1_addr, align 8
  br label %3

branch34:                                         ; preds = %2
  store i180 %tmp_28, i180* %glPLSlice0_V_2_addr, align 8
  br label %3

branch35:                                         ; preds = %2
  store i180 %tmp_28, i180* %glPLSlice0_V_3_addr, align 8
  br label %3

branch36:                                         ; preds = %2
  store i180 %tmp_28, i180* %glPLSlice0_V_4_addr, align 8
  br label %3

branch37:                                         ; preds = %2
  store i180 %tmp_28, i180* %glPLSlice0_V_5_addr, align 8
  br label %3

branch38:                                         ; preds = %2
  store i180 %tmp_28, i180* %glPLSlice0_V_6_addr, align 8
  br label %3

branch39:                                         ; preds = %2
  store i180 %tmp_28, i180* %glPLSlice0_V_7_addr, align 8
  br label %3

branch40:                                         ; preds = %2
  store i180 %tmp_28, i180* %glPLSlice0_V_8_addr, align 8
  br label %3

branch41:                                         ; preds = %2
  store i180 %tmp_28, i180* %glPLSlice0_V_9_addr, align 8
  br label %3

branch42:                                         ; preds = %2
  store i180 %tmp_28, i180* %glPLSlice0_V_10_addr, align 8
  br label %3

branch43:                                         ; preds = %2
  store i180 %tmp_28, i180* %glPLSlice0_V_11_addr, align 8
  br label %3

branch44:                                         ; preds = %2
  store i180 %tmp_28, i180* %glPLSlice0_V_12_addr, align 8
  br label %3

branch45:                                         ; preds = %2
  store i180 %tmp_28, i180* %glPLSlice0_V_13_addr, align 8
  br label %3

branch46:                                         ; preds = %2
  store i180 %tmp_28, i180* %glPLSlice0_V_14_addr, align 8
  br label %3

branch47:                                         ; preds = %2
  store i180 %tmp_28, i180* %glPLSlice0_V_15_addr, align 8
  br label %3
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

define weak i9 @_ssdm_op_Read.ap_auto.i9(i9) {
entry:
  ret i9 %0
}

define weak i32 @_ssdm_op_Read.ap_auto.i32(i32) {
entry:
  ret i32 %0
}

define weak i10 @_ssdm_op_Read.ap_auto.i10(i10) {
entry:
  ret i10 %0
}

define weak i1 @_ssdm_op_Read.ap_auto.i1(i1) {
entry:
  ret i1 %0
}

define weak i9 @_ssdm_op_PartSelect.i9.i64.i32.i32(i64, i32, i32) nounwind readnone {
entry:
  %empty = call i64 @llvm.part.select.i64(i64 %0, i32 %1, i32 %2)
  %empty_10 = trunc i64 %empty to i9
  ret i9 %empty_10
}

declare i8 @_ssdm_op_PartSelect.i8.i10.i32.i32(i10, i32, i32) nounwind readnone

define weak i7 @_ssdm_op_PartSelect.i7.i9.i32.i32(i9, i32, i32) nounwind readnone {
entry:
  %empty = call i9 @llvm.part.select.i9(i9 %0, i32 %1, i32 %2)
  %empty_11 = trunc i9 %empty to i7
  ret i7 %empty_11
}

define weak i6 @_ssdm_op_PartSelect.i6.i10.i32.i32(i10, i32, i32) nounwind readnone {
entry:
  %empty = call i10 @llvm.part.select.i10(i10 %0, i32 %1, i32 %2)
  %empty_12 = trunc i10 %empty to i6
  ret i6 %empty_12
}

define weak i4 @_ssdm_op_PartSelect.i4.i64.i32.i32(i64, i32, i32) nounwind readnone {
entry:
  %empty = call i64 @llvm.part.select.i64(i64 %0, i32 %1, i32 %2)
  %empty_13 = trunc i64 %empty to i4
  ret i4 %empty_13
}

declare i4 @_ssdm_op_PartSelect.i4.i10.i32.i32(i10, i32, i32) nounwind readnone

declare i32 @_ssdm_op_PartSelect.i32.i180.i32.i32(i180, i32, i32) nounwind readnone

declare i1 @_ssdm_op_PartSelect.i1.i4.i32.i32(i4, i32, i32) nounwind readnone

define weak i180 @_ssdm_op_Mux.ap_auto.16i180.i4(i180, i180, i180, i180, i180, i180, i180, i180, i180, i180, i180, i180, i180, i180, i180, i180, i4) {
entry:
  switch i4 %16, label %case15 [
    i4 0, label %case0
    i4 1, label %case1
    i4 2, label %case2
    i4 3, label %case3
    i4 4, label %case4
    i4 5, label %case5
    i4 6, label %case6
    i4 7, label %case7
    i4 -8, label %case8
    i4 -7, label %case9
    i4 -6, label %case10
    i4 -5, label %case11
    i4 -4, label %case12
    i4 -3, label %case13
    i4 -2, label %case14
  ]

case0:                                            ; preds = %case15, %case14, %case13, %case12, %case11, %case10, %case9, %case8, %case7, %case6, %case5, %case4, %case3, %case2, %case1, %entry
  %merge = phi i180 [ %0, %entry ], [ %1, %case1 ], [ %2, %case2 ], [ %3, %case3 ], [ %4, %case4 ], [ %5, %case5 ], [ %6, %case6 ], [ %7, %case7 ], [ %8, %case8 ], [ %9, %case9 ], [ %10, %case10 ], [ %11, %case11 ], [ %12, %case12 ], [ %13, %case13 ], [ %14, %case14 ], [ %15, %case15 ]
  ret i180 %merge

case1:                                            ; preds = %entry
  br label %case0

case2:                                            ; preds = %entry
  br label %case0

case3:                                            ; preds = %entry
  br label %case0

case4:                                            ; preds = %entry
  br label %case0

case5:                                            ; preds = %entry
  br label %case0

case6:                                            ; preds = %entry
  br label %case0

case7:                                            ; preds = %entry
  br label %case0

case8:                                            ; preds = %entry
  br label %case0

case9:                                            ; preds = %entry
  br label %case0

case10:                                           ; preds = %entry
  br label %case0

case11:                                           ; preds = %entry
  br label %case0

case12:                                           ; preds = %entry
  br label %case0

case13:                                           ; preds = %entry
  br label %case0

case14:                                           ; preds = %entry
  br label %case0

case15:                                           ; preds = %entry
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

declare i10 @_ssdm_op_BitConcatenate.i10.i8.i2(i8, i2) nounwind readnone

declare i32 @_autotb_FifoWrite_i32(i32*, i32)

declare i64 @_autotb_FifoRead_i64(i64*)

declare void @_GLOBAL__I_a() nounwind

!opencl.kernels = !{!0, !7, !13, !19, !22, !22, !28, !34, !28, !28, !28, !37, !37, !39, !39, !28, !41, !28, !28, !28, !43, !43, !45, !45, !47, !28, !28, !28, !43, !43, !49, !49, !51, !53, !53, !28, !55, !57, !57, !59, !28, !28, !28, !61, !61, !63, !63, !65, !28, !28, !28, !61, !61, !67, !67, !28, !28, !69, !72, !28, !74, !76, !76, !28, !78, !28, !28, !28, !80, !80, !82, !82, !84, !28, !86, !88, !90, !91, !28, !86, !93, !28, !96, !96, !100, !102, !28, !28, !28, !80, !80, !104, !104, !106, !107, !107, !109, !28, !111, !90, !113, !113, !28, !28, !114, !117, !37, !37, !119, !121, !28, !28, !28, !123, !123, !37, !37, !67, !67, !28, !28, !28, !28, !28, !28, !28, !28, !28, !28, !28, !28}
!hls.encrypted.func = !{}
!llvm.map.gv = !{!125, !132, !137}

!0 = metadata !{null, metadata !1, metadata !2, metadata !3, metadata !4, metadata !5, metadata !6}
!1 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0, i32 0, i32 0}
!2 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none", metadata !"none"}
!3 = metadata !{metadata !"kernel_arg_type", metadata !"int16_t", metadata !"int16_t", metadata !"_Bool", metadata !"int64_t"}
!4 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !"", metadata !""}
!5 = metadata !{metadata !"kernel_arg_name", metadata !"x", metadata !"y", metadata !"pol", metadata !"ts"}
!6 = metadata !{metadata !"reqd_work_group_size", i32 1, i32 1, i32 1}
!7 = metadata !{null, metadata !8, metadata !9, metadata !10, metadata !11, metadata !12, metadata !6}
!8 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0}
!9 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none"}
!10 = metadata !{metadata !"kernel_arg_type", metadata !"int16_t", metadata !"int16_t"}
!11 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !""}
!12 = metadata !{metadata !"kernel_arg_name", metadata !"x", metadata !"y"}
!13 = metadata !{void (i64*, i32, i32*)* @parseEvents, metadata !14, metadata !15, metadata !16, metadata !17, metadata !18, metadata !6}
!14 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 0, i32 1}
!15 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none"}
!16 = metadata !{metadata !"kernel_arg_type", metadata !"uint64_t*", metadata !"int32_t", metadata !"int32_t*"}
!17 = metadata !{metadata !"kernel_arg_type_qual", metadata !"const", metadata !"", metadata !""}
!18 = metadata !{metadata !"kernel_arg_name", metadata !"data", metadata !"eventsArraySize", metadata !"eventSlice"}
!19 = metadata !{null, metadata !8, metadata !9, metadata !20, metadata !11, metadata !21, metadata !6}
!20 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<182, true> &", metadata !"int"}
!21 = metadata !{metadata !"kernel_arg_name", metadata !"op", metadata !"i_op"}
!22 = metadata !{null, metadata !23, metadata !24, metadata !25, metadata !26, metadata !27, metadata !6}
!23 = metadata !{metadata !"kernel_arg_addr_space", i32 0}
!24 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none"}
!25 = metadata !{metadata !"kernel_arg_type", metadata !"int"}
!26 = metadata !{metadata !"kernel_arg_type_qual", metadata !""}
!27 = metadata !{metadata !"kernel_arg_name", metadata !"op"}
!28 = metadata !{null, metadata !29, metadata !30, metadata !31, metadata !32, metadata !33, metadata !6}
!29 = metadata !{metadata !"kernel_arg_addr_space"}
!30 = metadata !{metadata !"kernel_arg_access_qual"}
!31 = metadata !{metadata !"kernel_arg_type"}
!32 = metadata !{metadata !"kernel_arg_type_qual"}
!33 = metadata !{metadata !"kernel_arg_name"}
!34 = metadata !{null, metadata !8, metadata !9, metadata !35, metadata !11, metadata !36, metadata !6}
!35 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<182, true> &", metadata !"const ap_int_base<32, true> &"}
!36 = metadata !{metadata !"kernel_arg_name", metadata !"op", metadata !"op2"}
!37 = metadata !{null, metadata !23, metadata !24, metadata !38, metadata !26, metadata !27, metadata !6}
!38 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<32, true> &"}
!39 = metadata !{null, metadata !23, metadata !24, metadata !40, metadata !26, metadata !27, metadata !6}
!40 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<182, true> &"}
!41 = metadata !{null, metadata !8, metadata !9, metadata !42, metadata !11, metadata !36, metadata !6}
!42 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<184, true> &", metadata !"const ap_int_base<4, true> &"}
!43 = metadata !{null, metadata !23, metadata !24, metadata !44, metadata !26, metadata !27, metadata !6}
!44 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<4, true> &"}
!45 = metadata !{null, metadata !23, metadata !24, metadata !46, metadata !26, metadata !27, metadata !6}
!46 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<184, true> &"}
!47 = metadata !{null, metadata !8, metadata !9, metadata !48, metadata !11, metadata !36, metadata !6}
!48 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<183, true> &", metadata !"const ap_int_base<4, true> &"}
!49 = metadata !{null, metadata !23, metadata !24, metadata !50, metadata !26, metadata !27, metadata !6}
!50 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<183, true> &"}
!51 = metadata !{null, metadata !8, metadata !9, metadata !52, metadata !11, metadata !21, metadata !6}
!52 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<182, true> &", metadata !"ushort"}
!53 = metadata !{null, metadata !23, metadata !24, metadata !54, metadata !26, metadata !27, metadata !6}
!54 = metadata !{metadata !"kernel_arg_type", metadata !"ushort"}
!55 = metadata !{null, metadata !8, metadata !9, metadata !56, metadata !11, metadata !36, metadata !6}
!56 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<182, true> &", metadata !"const ap_int_base<16, false> &"}
!57 = metadata !{null, metadata !23, metadata !24, metadata !58, metadata !26, metadata !27, metadata !6}
!58 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<16, false> &"}
!59 = metadata !{null, metadata !8, metadata !9, metadata !60, metadata !11, metadata !36, metadata !6}
!60 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<181, true> &", metadata !"const ap_int_base<180, true> &"}
!61 = metadata !{null, metadata !23, metadata !24, metadata !62, metadata !26, metadata !27, metadata !6}
!62 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<180, true> &"}
!63 = metadata !{null, metadata !23, metadata !24, metadata !64, metadata !26, metadata !27, metadata !6}
!64 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<181, true> &"}
!65 = metadata !{null, metadata !8, metadata !9, metadata !66, metadata !11, metadata !36, metadata !6}
!66 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<180, true> &", metadata !"const ap_int_base<180, true> &"}
!67 = metadata !{null, metadata !23, metadata !24, metadata !25, metadata !26, metadata !68, metadata !6}
!68 = metadata !{metadata !"kernel_arg_name", metadata !"val"}
!69 = metadata !{null, metadata !23, metadata !24, metadata !70, metadata !26, metadata !71, metadata !6}
!70 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<2> &"}
!71 = metadata !{metadata !"kernel_arg_name", metadata !"op2"}
!72 = metadata !{null, metadata !23, metadata !24, metadata !73, metadata !26, metadata !71, metadata !6}
!73 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int<4> &"}
!74 = metadata !{null, metadata !8, metadata !9, metadata !75, metadata !11, metadata !21, metadata !6}
!75 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<10, true> &", metadata !"signed char"}
!76 = metadata !{null, metadata !23, metadata !24, metadata !77, metadata !26, metadata !27, metadata !6}
!77 = metadata !{metadata !"kernel_arg_type", metadata !"signed char"}
!78 = metadata !{null, metadata !8, metadata !9, metadata !79, metadata !11, metadata !36, metadata !6}
!79 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<10, true> &", metadata !"const ap_int_base<8, true> &"}
!80 = metadata !{null, metadata !23, metadata !24, metadata !81, metadata !26, metadata !27, metadata !6}
!81 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<8, true> &"}
!82 = metadata !{null, metadata !23, metadata !24, metadata !83, metadata !26, metadata !27, metadata !6}
!83 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<10, true> &"}
!84 = metadata !{null, metadata !23, metadata !24, metadata !85, metadata !26, metadata !68, metadata !6}
!85 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_bit_ref<4, true> &"}
!86 = metadata !{null, metadata !23, metadata !24, metadata !87, metadata !26, metadata !68, metadata !6}
!87 = metadata !{metadata !"kernel_arg_type", metadata !"ulong long"}
!88 = metadata !{null, metadata !8, metadata !9, metadata !89, metadata !11, metadata !36, metadata !6}
!89 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<4, true> &", metadata !"int"}
!90 = metadata !{null, metadata !23, metadata !24, metadata !38, metadata !26, metadata !71, metadata !6}
!91 = metadata !{null, metadata !23, metadata !24, metadata !92, metadata !26, metadata !68, metadata !6}
!92 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_bit_ref<180, true> &"}
!93 = metadata !{null, metadata !23, metadata !24, metadata !94, metadata !26, metadata !95, metadata !6}
!94 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<40, true> &"}
!95 = metadata !{metadata !"kernel_arg_name", metadata !"index"}
!96 = metadata !{null, metadata !97, metadata !9, metadata !98, metadata !11, metadata !99, metadata !6}
!97 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 0}
!98 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<180, true>*", metadata !"int"}
!99 = metadata !{metadata !"kernel_arg_name", metadata !"bv", metadata !"index"}
!100 = metadata !{null, metadata !8, metadata !9, metadata !101, metadata !11, metadata !21, metadata !6}
!101 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<39, true> &", metadata !"signed char"}
!102 = metadata !{null, metadata !8, metadata !9, metadata !103, metadata !11, metadata !36, metadata !6}
!103 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<39, true> &", metadata !"const ap_int_base<8, true> &"}
!104 = metadata !{null, metadata !23, metadata !24, metadata !105, metadata !26, metadata !27, metadata !6}
!105 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<39, true> &"}
!106 = metadata !{null, metadata !23, metadata !24, metadata !25, metadata !26, metadata !95, metadata !6}
!107 = metadata !{null, metadata !97, metadata !9, metadata !108, metadata !11, metadata !99, metadata !6}
!108 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<4, true>*", metadata !"int"}
!109 = metadata !{null, metadata !23, metadata !24, metadata !110, metadata !26, metadata !71, metadata !6}
!110 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int<180> &"}
!111 = metadata !{null, metadata !8, metadata !9, metadata !112, metadata !11, metadata !36, metadata !6}
!112 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<2, false> &", metadata !"int"}
!113 = metadata !{null, metadata !23, metadata !24, metadata !94, metadata !26, metadata !27, metadata !6}
!114 = metadata !{null, metadata !8, metadata !9, metadata !115, metadata !11, metadata !116, metadata !6}
!115 = metadata !{metadata !"kernel_arg_type", metadata !"int", metadata !"const ap_int_base<39, true> &"}
!116 = metadata !{metadata !"kernel_arg_name", metadata !"i_op", metadata !"op"}
!117 = metadata !{null, metadata !8, metadata !9, metadata !118, metadata !11, metadata !36, metadata !6}
!118 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<32, true> &", metadata !"const ap_int_base<39, true> &"}
!119 = metadata !{null, metadata !8, metadata !9, metadata !120, metadata !11, metadata !116, metadata !6}
!120 = metadata !{metadata !"kernel_arg_type", metadata !"int", metadata !"const ap_int_base<7, true> &"}
!121 = metadata !{null, metadata !8, metadata !9, metadata !122, metadata !11, metadata !36, metadata !6}
!122 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<32, true> &", metadata !"const ap_int_base<7, true> &"}
!123 = metadata !{null, metadata !23, metadata !24, metadata !124, metadata !26, metadata !27, metadata !6}
!124 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<7, true> &"}
!125 = metadata !{metadata !126, i16* @sum}
!126 = metadata !{metadata !127}
!127 = metadata !{i32 0, i32 15, metadata !128}
!128 = metadata !{metadata !129}
!129 = metadata !{metadata !"sum", metadata !130, metadata !"short", i32 0, i32 15}
!130 = metadata !{metadata !131}
!131 = metadata !{i32 0, i32 0, i32 1}
!132 = metadata !{metadata !133, i32* @partFactor}
!133 = metadata !{metadata !134}
!134 = metadata !{i32 0, i32 31, metadata !135}
!135 = metadata !{metadata !136}
!136 = metadata !{metadata !"partFactor", metadata !130, metadata !"int", i32 0, i32 31}
!137 = metadata !{metadata !138, [1 x i32]* @llvm_global_ctors_0}
!138 = metadata !{metadata !139}
!139 = metadata !{i32 0, i32 31, metadata !140}
!140 = metadata !{metadata !141}
!141 = metadata !{metadata !"llvm.global_ctors.0", metadata !130, metadata !"", i32 0, i32 31}
!142 = metadata !{metadata !143}
!143 = metadata !{i32 0, i32 63, metadata !144}
!144 = metadata !{metadata !145}
!145 = metadata !{metadata !"data", metadata !130, metadata !"long long unsigned int", i32 0, i32 63}
!146 = metadata !{metadata !147}
!147 = metadata !{i32 0, i32 31, metadata !148}
!148 = metadata !{metadata !149}
!149 = metadata !{metadata !"eventsArraySize", metadata !150, metadata !"int", i32 0, i32 31}
!150 = metadata !{metadata !151}
!151 = metadata !{i32 0, i32 0, i32 0}
!152 = metadata !{metadata !153}
!153 = metadata !{i32 0, i32 31, metadata !154}
!154 = metadata !{metadata !155}
!155 = metadata !{metadata !"eventSlice", metadata !130, metadata !"int", i32 0, i32 31}
