// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.1
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="EventStreamToFrameStreamMinized,hls_ip_2018_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=1,HLS_INPUT_PART=xc7z007sclg225-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=8.707000,HLS_SYN_LAT=80002,HLS_SYN_TPT=none,HLS_SYN_MEM=33,HLS_SYN_DSP=0,HLS_SYN_FF=284,HLS_SYN_LUT=626}" *)

module EventStreamToFrameStreamMinized (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        reg_dvsWidth,
        reg_dvsHeight,
        reg_sliceDuration,
        reg_displayMode,
        reg_status_V_i,
        reg_status_V_o,
        reg_status_V_o_ap_vld,
        reg_frameCnt,
        reg_frameCnt_ap_vld,
        xStream_V_V_dout,
        xStream_V_V_empty_n,
        xStream_V_V_read,
        yStream_V_V_dout,
        yStream_V_V_empty_n,
        yStream_V_V_read,
        polStream_V_V_dout,
        polStream_V_V_empty_n,
        polStream_V_V_read,
        tsStream_V_V_dout,
        tsStream_V_V_empty_n,
        tsStream_V_V_read,
        frameStream_V_V_din,
        frameStream_V_V_full_n,
        frameStream_V_V_write
);

parameter    ap_ST_fsm_state1 = 5'd1;
parameter    ap_ST_fsm_pp0_stage0 = 5'd2;
parameter    ap_ST_fsm_state5 = 5'd4;
parameter    ap_ST_fsm_state6 = 5'd8;
parameter    ap_ST_fsm_state7 = 5'd16;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [31:0] reg_dvsWidth;
input  [31:0] reg_dvsHeight;
input  [31:0] reg_sliceDuration;
input  [31:0] reg_displayMode;
input  [31:0] reg_status_V_i;
output  [31:0] reg_status_V_o;
output   reg_status_V_o_ap_vld;
output  [31:0] reg_frameCnt;
output   reg_frameCnt_ap_vld;
input  [15:0] xStream_V_V_dout;
input   xStream_V_V_empty_n;
output   xStream_V_V_read;
input  [15:0] yStream_V_V_dout;
input   yStream_V_V_empty_n;
output   yStream_V_V_read;
input  [15:0] polStream_V_V_dout;
input   polStream_V_V_empty_n;
output   polStream_V_V_read;
input  [31:0] tsStream_V_V_dout;
input   tsStream_V_V_empty_n;
output   tsStream_V_V_read;
output  [31:0] frameStream_V_V_din;
input   frameStream_V_V_full_n;
output   frameStream_V_V_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[31:0] reg_status_V_o;
reg reg_status_V_o_ap_vld;
reg reg_frameCnt_ap_vld;
reg xStream_V_V_read;
reg yStream_V_V_read;
reg polStream_V_V_read;
reg tsStream_V_V_read;
reg frameStream_V_V_write;

(* fsm_encoding = "none" *) reg   [4:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [31:0] lastTs;
reg   [31:0] frameCnt_V;
reg   [10:0] glDVSSlice_V_address0;
reg    glDVSSlice_V_ce0;
reg    glDVSSlice_V_we0;
wire   [255:0] glDVSSlice_V_q0;
reg   [15:0] rotationBit_V_address0;
reg    rotationBit_V_ce0;
reg    rotationBit_V_we0;
reg   [0:0] rotationBit_V_d0;
wire   [0:0] rotationBit_V_q0;
reg    xStream_V_V_blk_n;
wire   [0:0] tmp_fu_313_p2;
wire   [0:0] tmp_s_fu_319_p2;
reg    yStream_V_V_blk_n;
reg    polStream_V_V_blk_n;
reg    tsStream_V_V_blk_n;
reg    frameStream_V_V_blk_n;
reg    ap_enable_reg_pp0_iter2;
wire    ap_block_pp0_stage0;
reg   [0:0] exitcond_flatten_reg_634;
reg   [0:0] exitcond_flatten_reg_634_pp0_iter1_reg;
reg   [18:0] indvar_flatten_reg_233;
reg   [9:0] i_reg_244;
reg   [9:0] j_reg_255;
reg   [0:0] tmp_reg_599;
reg    ap_predicate_op32_read_state1;
reg    ap_block_state1;
reg   [0:0] tmp_s_reg_603;
reg   [15:0] tmp_V_reg_607;
reg   [15:0] tmp_V_1_reg_613;
wire   [0:0] tmp_5_fu_347_p2;
reg   [0:0] tmp_5_reg_620;
wire   [31:0] tmp_6_fu_357_p2;
reg   [31:0] tmp_6_reg_629;
wire   [0:0] exitcond_flatten_fu_397_p2;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_block_state2_pp0_stage0_iter0;
wire    ap_block_state3_pp0_stage0_iter1;
reg    ap_block_state4_pp0_stage0_iter2;
reg    ap_block_pp0_stage0_11001;
wire   [18:0] indvar_flatten_next_fu_403_p2;
reg    ap_enable_reg_pp0_iter0;
wire   [9:0] tmp_8_mid2_v_fu_429_p3;
reg   [9:0] tmp_8_mid2_v_reg_643;
wire   [0:0] icmp_fu_465_p2;
reg   [0:0] icmp_reg_648;
wire   [4:0] tmp_38_fu_504_p1;
reg   [4:0] tmp_38_reg_657;
wire   [9:0] j_1_fu_523_p2;
wire   [7:0] grp_readOneDataFromCol_fu_306_ap_return;
reg    ap_enable_reg_pp0_iter1;
reg   [10:0] glDVSSlice_V_addr_reg_672;
wire    ap_CS_fsm_state5;
wire   [4:0] tmp_36_fu_568_p1;
reg   [4:0] tmp_36_reg_677;
reg   [15:0] rotationBit_V_addr_reg_683;
wire   [7:0] tmpPixVal_V_1_fu_593_p2;
wire    ap_CS_fsm_state6;
reg    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_exit_iter0_state2;
wire    tmpData_V_writeOneDataToCol_fu_298_ap_ready;
wire   [255:0] tmpData_V_writeOneDataToCol_fu_298_ap_return;
wire    grp_readOneDataFromCol_fu_306_ap_ready;
reg   [4:0] grp_readOneDataFromCol_fu_306_idx_V;
reg   [9:0] ap_phi_mux_i_phi_fu_248_p4;
wire   [7:0] ap_phi_reg_pp0_iter0_p_s_reg_266;
reg   [7:0] ap_phi_reg_pp0_iter1_p_s_reg_266;
reg   [7:0] ap_phi_reg_pp0_iter2_p_s_reg_266;
reg   [31:0] frameCnt_V_loc_reg_277;
reg   [7:0] tmpPixVal_V_2_reg_287;
wire    ap_CS_fsm_state7;
wire   [63:0] tmp_19_cast_fu_499_p1;
wire   [63:0] tmp_20_cast_fu_518_p1;
wire   [63:0] tmp_10_cast4_fu_563_p1;
wire   [63:0] tmp_13_cast_fu_588_p1;
reg    ap_block_pp0_stage0_01001;
reg   [31:0] p_Result_1_fu_375_p4;
reg   [31:0] p_Result_s_fu_386_p4;
wire   [32:0] lastTs_load_cast_fu_329_p1;
wire   [32:0] tmp_3_cast_fu_333_p1;
wire   [32:0] tmp_4_cast_fu_343_p1;
wire   [32:0] op2_assign_fu_337_p2;
wire   [0:0] exitcond3_fu_415_p2;
wire   [9:0] i_1_fu_409_p2;
wire   [9:0] j_mid2_fu_421_p3;
wire   [9:0] tmp_7_fu_449_p2;
wire   [1:0] tmp_33_fu_455_p4;
wire   [2:0] tmp_10_fu_471_p4;
wire   [10:0] tmp_11_fu_481_p3;
wire   [11:0] tmp_8_mid2_cast_fu_437_p1;
wire   [11:0] tmp_18_cast_fu_489_p1;
wire   [11:0] tmp_12_fu_493_p2;
wire   [17:0] tmp_7_cast_fu_508_p1;
wire   [17:0] tmp_1_fu_441_p3;
wire   [17:0] tmp_13_fu_512_p2;
wire   [4:0] tmp_35_fu_540_p4;
wire   [12:0] tmp_34_fu_537_p1;
wire   [12:0] tmp_8_cast_fu_549_p3;
wire   [12:0] tmp_8_fu_557_p2;
wire   [9:0] tmp_37_fu_571_p1;
wire   [17:0] tmp_9_cast5_fu_534_p1;
wire   [17:0] tmp_12_cast_fu_574_p3;
wire   [17:0] tmp_9_fu_582_p2;
reg   [4:0] ap_NS_fsm;
reg    ap_idle_pp0;
wire    ap_enable_pp0;
reg    ap_condition_165;
reg    ap_condition_190;
reg    ap_condition_126;

// power-on initialization
initial begin
#0 ap_CS_fsm = 5'd1;
#0 lastTs = 32'd0;
#0 frameCnt_V = 32'd0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
end

EventStreamToFrambkb #(
    .DataWidth( 256 ),
    .AddressRange( 2048 ),
    .AddressWidth( 11 ))
glDVSSlice_V_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(glDVSSlice_V_address0),
    .ce0(glDVSSlice_V_ce0),
    .we0(glDVSSlice_V_we0),
    .d0(tmpData_V_writeOneDataToCol_fu_298_ap_return),
    .q0(glDVSSlice_V_q0)
);

EventStreamToFramcud #(
    .DataWidth( 1 ),
    .AddressRange( 65536 ),
    .AddressWidth( 16 ))
rotationBit_V_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(rotationBit_V_address0),
    .ce0(rotationBit_V_ce0),
    .we0(rotationBit_V_we0),
    .d0(rotationBit_V_d0),
    .q0(rotationBit_V_q0)
);

writeOneDataToCol tmpData_V_writeOneDataToCol_fu_298(
    .ap_ready(tmpData_V_writeOneDataToCol_fu_298_ap_ready),
    .idx_V(tmp_36_reg_677),
    .toWriteData_V(tmpPixVal_V_2_reg_287),
    .ap_return(tmpData_V_writeOneDataToCol_fu_298_ap_return)
);

readOneDataFromCol grp_readOneDataFromCol_fu_306(
    .ap_ready(grp_readOneDataFromCol_fu_306_ap_ready),
    .colData_V(glDVSSlice_V_q0),
    .idx_V(grp_readOneDataFromCol_fu_306_idx_V),
    .ap_return(grp_readOneDataFromCol_fu_306_ap_return)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_condition_pp0_exit_iter0_state2) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter0 <= 1'b0;
        end else if ((~((ap_start == 1'b0) | ((tsStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1)) | ((polStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1)) | ((yStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1)) | ((xStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1))) & (tmp_s_fu_319_p2 == 1'd0) & (tmp_5_fu_347_p2 == 1'd0) & (tmp_fu_313_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            if ((1'b1 == ap_condition_pp0_exit_iter0_state2)) begin
                ap_enable_reg_pp0_iter1 <= (1'b1 ^ ap_condition_pp0_exit_iter0_state2);
            end else if ((1'b1 == 1'b1)) begin
                ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end else if ((~((ap_start == 1'b0) | ((tsStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1)) | ((polStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1)) | ((yStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1)) | ((xStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1))) & (tmp_s_fu_319_p2 == 1'd0) & (tmp_5_fu_347_p2 == 1'd0) & (tmp_fu_313_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter2 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_165)) begin
        if (((icmp_fu_465_p2 == 1'd0) & (exitcond_flatten_fu_397_p2 == 1'd0))) begin
            ap_phi_reg_pp0_iter1_p_s_reg_266 <= 8'd0;
        end else if ((1'b1 == 1'b1)) begin
            ap_phi_reg_pp0_iter1_p_s_reg_266 <= ap_phi_reg_pp0_iter0_p_s_reg_266;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_190)) begin
        if (((exitcond_flatten_reg_634 == 1'd0) & (icmp_reg_648 == 1'd1))) begin
            ap_phi_reg_pp0_iter2_p_s_reg_266 <= grp_readOneDataFromCol_fu_306_ap_return;
        end else if ((1'b1 == 1'b1)) begin
            ap_phi_reg_pp0_iter2_p_s_reg_266 <= ap_phi_reg_pp0_iter1_p_s_reg_266;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_5_reg_620 == 1'd0) & (1'b1 == ap_CS_fsm_state5))) begin
        frameCnt_V_loc_reg_277 <= tmp_6_reg_629;
    end else if ((~((ap_start == 1'b0) | ((tsStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1)) | ((polStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1)) | ((yStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1)) | ((xStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1))) & (tmp_s_fu_319_p2 == 1'd0) & (tmp_fu_313_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (tmp_5_fu_347_p2 == 1'd1))) begin
        frameCnt_V_loc_reg_277 <= frameCnt_V;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_flatten_reg_634 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        i_reg_244 <= tmp_8_mid2_v_reg_643;
    end else if ((~((ap_start == 1'b0) | ((tsStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1)) | ((polStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1)) | ((yStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1)) | ((xStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1))) & (tmp_s_fu_319_p2 == 1'd0) & (tmp_5_fu_347_p2 == 1'd0) & (tmp_fu_313_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        i_reg_244 <= 10'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_flatten_fu_397_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        indvar_flatten_reg_233 <= indvar_flatten_next_fu_403_p2;
    end else if ((~((ap_start == 1'b0) | ((tsStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1)) | ((polStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1)) | ((yStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1)) | ((xStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1))) & (tmp_s_fu_319_p2 == 1'd0) & (tmp_5_fu_347_p2 == 1'd0) & (tmp_fu_313_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        indvar_flatten_reg_233 <= 19'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_flatten_fu_397_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        j_reg_255 <= j_1_fu_523_p2;
    end else if ((~((ap_start == 1'b0) | ((tsStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1)) | ((polStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1)) | ((yStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1)) | ((xStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1))) & (tmp_s_fu_319_p2 == 1'd0) & (tmp_5_fu_347_p2 == 1'd0) & (tmp_fu_313_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        j_reg_255 <= 10'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        if ((rotationBit_V_q0 == 1'd1)) begin
            tmpPixVal_V_2_reg_287 <= 8'd1;
        end else if ((rotationBit_V_q0 == 1'd0)) begin
            tmpPixVal_V_2_reg_287 <= tmpPixVal_V_1_fu_593_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        exitcond_flatten_reg_634 <= exitcond_flatten_fu_397_p2;
        exitcond_flatten_reg_634_pp0_iter1_reg <= exitcond_flatten_reg_634;
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_start == 1'b0) | ((tsStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1)) | ((polStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1)) | ((yStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1)) | ((xStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1))) & (tmp_s_fu_319_p2 == 1'd0) & (tmp_5_fu_347_p2 == 1'd0) & (tmp_fu_313_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        frameCnt_V <= tmp_6_fu_357_p2;
        lastTs <= tsStream_V_V_dout;
        tmp_6_reg_629 <= tmp_6_fu_357_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        glDVSSlice_V_addr_reg_672 <= tmp_10_cast4_fu_563_p1;
        rotationBit_V_addr_reg_683 <= tmp_13_cast_fu_588_p1;
        tmp_36_reg_677 <= tmp_36_fu_568_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_flatten_fu_397_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        icmp_reg_648 <= icmp_fu_465_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_flatten_fu_397_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_fu_465_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_38_reg_657 <= tmp_38_fu_504_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_start == 1'b0) | ((tsStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1)) | ((polStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1)) | ((yStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1)) | ((xStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1))) & (ap_predicate_op32_read_state1 == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        tmp_5_reg_620 <= tmp_5_fu_347_p2;
        tmp_V_1_reg_613 <= yStream_V_V_dout;
        tmp_V_reg_607 <= xStream_V_V_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_flatten_fu_397_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_8_mid2_v_reg_643 <= tmp_8_mid2_v_fu_429_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_start == 1'b0) | ((tsStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1)) | ((polStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1)) | ((yStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1)) | ((xStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1))) & (1'b1 == ap_CS_fsm_state1))) begin
        tmp_reg_599 <= tmp_fu_313_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_start == 1'b0) | ((tsStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1)) | ((polStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1)) | ((yStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1)) | ((xStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1))) & (tmp_fu_313_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        tmp_s_reg_603 <= tmp_s_fu_319_p2;
    end
end

always @ (*) begin
    if ((exitcond_flatten_fu_397_p2 == 1'd1)) begin
        ap_condition_pp0_exit_iter0_state2 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state2 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (exitcond_flatten_reg_634 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_phi_mux_i_phi_fu_248_p4 = tmp_8_mid2_v_reg_643;
    end else begin
        ap_phi_mux_i_phi_fu_248_p4 = i_reg_244;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (exitcond_flatten_reg_634_pp0_iter1_reg == 1'd0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        frameStream_V_V_blk_n = frameStream_V_V_full_n;
    end else begin
        frameStream_V_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((exitcond_flatten_reg_634_pp0_iter1_reg == 1'd0) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        frameStream_V_V_write = 1'b1;
    end else begin
        frameStream_V_V_write = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        glDVSSlice_V_address0 = glDVSSlice_V_addr_reg_672;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        glDVSSlice_V_address0 = tmp_10_cast4_fu_563_p1;
    end else if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        glDVSSlice_V_address0 = tmp_19_cast_fu_499_p1;
    end else begin
        glDVSSlice_V_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state7) | (1'b1 == ap_CS_fsm_state5) | ((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        glDVSSlice_V_ce0 = 1'b1;
    end else begin
        glDVSSlice_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_s_reg_603 == 1'd0) & (tmp_reg_599 == 1'd0) & (1'b1 == ap_CS_fsm_state7))) begin
        glDVSSlice_V_we0 = 1'b1;
    end else begin
        glDVSSlice_V_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        grp_readOneDataFromCol_fu_306_idx_V = tmp_36_reg_677;
    end else if (((1'b0 == ap_block_pp0_stage0) & (exitcond_flatten_reg_634 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_reg_648 == 1'd1))) begin
        grp_readOneDataFromCol_fu_306_idx_V = tmp_38_reg_657;
    end else begin
        grp_readOneDataFromCol_fu_306_idx_V = 'bx;
    end
end

always @ (*) begin
    if (((tmp_s_fu_319_p2 == 1'd0) & (tmp_fu_313_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        polStream_V_V_blk_n = polStream_V_V_empty_n;
    end else begin
        polStream_V_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | ((tsStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1)) | ((polStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1)) | ((yStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1)) | ((xStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1))) & (ap_predicate_op32_read_state1 == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        polStream_V_V_read = 1'b1;
    end else begin
        polStream_V_V_read = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        reg_frameCnt_ap_vld = 1'b1;
    end else begin
        reg_frameCnt_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_condition_126)) begin
        if ((tmp_fu_313_p2 == 1'd1)) begin
            reg_status_V_o = p_Result_s_fu_386_p4;
        end else if (((tmp_s_fu_319_p2 == 1'd1) & (tmp_fu_313_p2 == 1'd0))) begin
            reg_status_V_o = p_Result_1_fu_375_p4;
        end else begin
            reg_status_V_o = reg_status_V_i;
        end
    end else begin
        reg_status_V_o = reg_status_V_i;
    end
end

always @ (*) begin
    if (((~((ap_start == 1'b0) | ((tsStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1)) | ((polStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1)) | ((yStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1)) | ((xStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1))) & (tmp_s_fu_319_p2 == 1'd1) & (tmp_fu_313_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1)) | (~((ap_start == 1'b0) | ((tsStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1)) | ((polStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1)) | ((yStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1)) | ((xStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1))) & (tmp_fu_313_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1)))) begin
        reg_status_V_o_ap_vld = 1'b1;
    end else begin
        reg_status_V_o_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        rotationBit_V_address0 = rotationBit_V_addr_reg_683;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        rotationBit_V_address0 = tmp_13_cast_fu_588_p1;
    end else if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        rotationBit_V_address0 = tmp_20_cast_fu_518_p1;
    end else begin
        rotationBit_V_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state6) | (1'b1 == ap_CS_fsm_state5) | ((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        rotationBit_V_ce0 = 1'b1;
    end else begin
        rotationBit_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        rotationBit_V_d0 = 1'd0;
    end else if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        rotationBit_V_d0 = 1'd1;
    end else begin
        rotationBit_V_d0 = 'bx;
    end
end

always @ (*) begin
    if ((((rotationBit_V_q0 == 1'd1) & (1'b1 == ap_CS_fsm_state6)) | ((exitcond_flatten_fu_397_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_fu_465_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        rotationBit_V_we0 = 1'b1;
    end else begin
        rotationBit_V_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_s_fu_319_p2 == 1'd0) & (tmp_fu_313_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        tsStream_V_V_blk_n = tsStream_V_V_empty_n;
    end else begin
        tsStream_V_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | ((tsStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1)) | ((polStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1)) | ((yStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1)) | ((xStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1))) & (ap_predicate_op32_read_state1 == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        tsStream_V_V_read = 1'b1;
    end else begin
        tsStream_V_V_read = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_s_fu_319_p2 == 1'd0) & (tmp_fu_313_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        xStream_V_V_blk_n = xStream_V_V_empty_n;
    end else begin
        xStream_V_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | ((tsStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1)) | ((polStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1)) | ((yStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1)) | ((xStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1))) & (ap_predicate_op32_read_state1 == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        xStream_V_V_read = 1'b1;
    end else begin
        xStream_V_V_read = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_s_fu_319_p2 == 1'd0) & (tmp_fu_313_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        yStream_V_V_blk_n = yStream_V_V_empty_n;
    end else begin
        yStream_V_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | ((tsStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1)) | ((polStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1)) | ((yStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1)) | ((xStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1))) & (ap_predicate_op32_read_state1 == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        yStream_V_V_read = 1'b1;
    end else begin
        yStream_V_V_read = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_start == 1'b0) | ((tsStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1)) | ((polStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1)) | ((yStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1)) | ((xStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1))) & (1'b1 == ap_CS_fsm_state1) & ((tmp_s_fu_319_p2 == 1'd1) | (tmp_fu_313_p2 == 1'd1)))) begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end else if ((~((ap_start == 1'b0) | ((tsStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1)) | ((polStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1)) | ((yStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1)) | ((xStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1))) & (tmp_s_fu_319_p2 == 1'd0) & (tmp_5_fu_347_p2 == 1'd0) & (tmp_fu_313_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((~((ap_start == 1'b0) | ((tsStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1)) | ((polStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1)) | ((yStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1)) | ((xStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1))) & (tmp_s_fu_319_p2 == 1'd0) & (tmp_fu_313_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (tmp_5_fu_347_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_pp0_stage0 : begin
            if ((~((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b0) & (exitcond_flatten_fu_397_p2 == 1'd1)) & ~((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b0)))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b0)) | ((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b0) & (exitcond_flatten_fu_397_p2 == 1'd1)))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state6;
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state7;
        end
        ap_ST_fsm_state7 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd4];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = ((exitcond_flatten_reg_634_pp0_iter1_reg == 1'd0) & (frameStream_V_V_full_n == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((exitcond_flatten_reg_634_pp0_iter1_reg == 1'd0) & (frameStream_V_V_full_n == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((exitcond_flatten_reg_634_pp0_iter1_reg == 1'd0) & (frameStream_V_V_full_n == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1));
end

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | ((tsStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1)) | ((polStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1)) | ((yStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1)) | ((xStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1)));
end

assign ap_block_state2_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state4_pp0_stage0_iter2 = ((exitcond_flatten_reg_634_pp0_iter1_reg == 1'd0) & (frameStream_V_V_full_n == 1'b0));
end

always @ (*) begin
    ap_condition_126 = (~((ap_start == 1'b0) | ((tsStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1)) | ((polStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1)) | ((yStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1)) | ((xStream_V_V_empty_n == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1))) & (1'b1 == ap_CS_fsm_state1));
end

always @ (*) begin
    ap_condition_165 = ((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001));
end

always @ (*) begin
    ap_condition_190 = ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_phi_reg_pp0_iter0_p_s_reg_266 = 'bx;

always @ (*) begin
    ap_predicate_op32_read_state1 = ((tmp_s_fu_319_p2 == 1'd0) & (tmp_fu_313_p2 == 1'd0));
end

assign exitcond3_fu_415_p2 = ((j_reg_255 == 10'd600) ? 1'b1 : 1'b0);

assign exitcond_flatten_fu_397_p2 = ((indvar_flatten_reg_233 == 19'd480000) ? 1'b1 : 1'b0);

assign frameStream_V_V_din = ap_phi_reg_pp0_iter2_p_s_reg_266;

assign i_1_fu_409_p2 = (ap_phi_mux_i_phi_fu_248_p4 + 10'd1);

assign icmp_fu_465_p2 = ((tmp_33_fu_455_p4 == 2'd0) ? 1'b1 : 1'b0);

assign indvar_flatten_next_fu_403_p2 = (indvar_flatten_reg_233 + 19'd1);

assign j_1_fu_523_p2 = (j_mid2_fu_421_p3 + 10'd1);

assign j_mid2_fu_421_p3 = ((exitcond3_fu_415_p2[0:0] === 1'b1) ? 10'd0 : j_reg_255);

assign lastTs_load_cast_fu_329_p1 = lastTs;

assign op2_assign_fu_337_p2 = (lastTs_load_cast_fu_329_p1 + tmp_3_cast_fu_333_p1);

always @ (*) begin
    p_Result_1_fu_375_p4 = reg_status_V_i;
    p_Result_1_fu_375_p4[32'd1] = |(1'd1);
end

always @ (*) begin
    p_Result_s_fu_386_p4 = reg_status_V_i;
    p_Result_s_fu_386_p4[32'd0] = |(1'd1);
end

assign reg_frameCnt = frameCnt_V_loc_reg_277;

assign tmpPixVal_V_1_fu_593_p2 = (grp_readOneDataFromCol_fu_306_ap_return + 8'd1);

assign tmp_10_cast4_fu_563_p1 = tmp_8_fu_557_p2;

assign tmp_10_fu_471_p4 = {{j_mid2_fu_421_p3[7:5]}};

assign tmp_11_fu_481_p3 = {{tmp_10_fu_471_p4}, {8'd0}};

assign tmp_12_cast_fu_574_p3 = {{tmp_37_fu_571_p1}, {8'd0}};

assign tmp_12_fu_493_p2 = (tmp_8_mid2_cast_fu_437_p1 + tmp_18_cast_fu_489_p1);

assign tmp_13_cast_fu_588_p1 = tmp_9_fu_582_p2;

assign tmp_13_fu_512_p2 = (tmp_7_cast_fu_508_p1 + tmp_1_fu_441_p3);

assign tmp_18_cast_fu_489_p1 = tmp_11_fu_481_p3;

assign tmp_19_cast_fu_499_p1 = tmp_12_fu_493_p2;

assign tmp_1_fu_441_p3 = {{tmp_8_mid2_v_fu_429_p3}, {8'd0}};

assign tmp_20_cast_fu_518_p1 = tmp_13_fu_512_p2;

assign tmp_33_fu_455_p4 = {{tmp_7_fu_449_p2[9:8]}};

assign tmp_34_fu_537_p1 = tmp_V_reg_607[12:0];

assign tmp_35_fu_540_p4 = {{tmp_V_1_reg_613[9:5]}};

assign tmp_36_fu_568_p1 = tmp_V_1_reg_613[4:0];

assign tmp_37_fu_571_p1 = tmp_V_1_reg_613[9:0];

assign tmp_38_fu_504_p1 = j_mid2_fu_421_p3[4:0];

assign tmp_3_cast_fu_333_p1 = reg_sliceDuration;

assign tmp_4_cast_fu_343_p1 = tsStream_V_V_dout;

assign tmp_5_fu_347_p2 = ((tmp_4_cast_fu_343_p1 < op2_assign_fu_337_p2) ? 1'b1 : 1'b0);

assign tmp_6_fu_357_p2 = (frameCnt_V + 32'd1);

assign tmp_7_cast_fu_508_p1 = j_mid2_fu_421_p3;

assign tmp_7_fu_449_p2 = (tmp_8_mid2_v_fu_429_p3 | j_mid2_fu_421_p3);

assign tmp_8_cast_fu_549_p3 = {{tmp_35_fu_540_p4}, {8'd0}};

assign tmp_8_fu_557_p2 = (tmp_34_fu_537_p1 + tmp_8_cast_fu_549_p3);

assign tmp_8_mid2_cast_fu_437_p1 = tmp_8_mid2_v_fu_429_p3;

assign tmp_8_mid2_v_fu_429_p3 = ((exitcond3_fu_415_p2[0:0] === 1'b1) ? i_1_fu_409_p2 : ap_phi_mux_i_phi_fu_248_p4);

assign tmp_9_cast5_fu_534_p1 = tmp_V_reg_607;

assign tmp_9_fu_582_p2 = (tmp_9_cast5_fu_534_p1 + tmp_12_cast_fu_574_p3);

assign tmp_fu_313_p2 = ((reg_dvsWidth > 32'd256) ? 1'b1 : 1'b0);

assign tmp_s_fu_319_p2 = ((reg_dvsHeight > 32'd256) ? 1'b1 : 1'b0);

endmodule //EventStreamToFrameStreamMinized
