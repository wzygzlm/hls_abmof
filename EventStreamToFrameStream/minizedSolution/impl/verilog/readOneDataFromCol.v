// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.1
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module readOneDataFromCol (
        ap_ready,
        colData_V,
        idx_V,
        ap_return
);


output   ap_ready;
input  [255:0] colData_V;
input  [4:0] idx_V;
output  [7:0] ap_return;

wire   [7:0] tmp_8_fu_42_p3;
wire   [31:0] index_assign_2_fu_50_p1;
wire   [7:0] tmp_9_fu_62_p3;
wire   [31:0] index_assign_2_1_fu_70_p1;
wire   [7:0] tmp_s_fu_82_p3;
wire   [31:0] index_assign_2_2_fu_90_p1;
wire   [7:0] tmp_1_fu_102_p3;
wire   [31:0] index_assign_2_3_fu_110_p1;
wire   [7:0] tmp_2_fu_122_p3;
wire   [31:0] index_assign_2_4_fu_130_p1;
wire   [7:0] tmp_3_fu_142_p3;
wire   [31:0] index_assign_2_5_fu_150_p1;
wire   [7:0] tmp_4_fu_162_p3;
wire   [31:0] index_assign_2_6_fu_170_p1;
wire   [7:0] tmp_5_fu_182_p3;
wire   [31:0] index_assign_2_7_fu_190_p1;
wire   [0:0] tmp_30_fu_194_p3;
wire   [0:0] tmp_29_fu_174_p3;
wire   [0:0] tmp_28_fu_154_p3;
wire   [0:0] tmp_27_fu_134_p3;
wire   [0:0] tmp_26_fu_114_p3;
wire   [0:0] tmp_25_fu_94_p3;
wire   [0:0] tmp_24_fu_74_p3;
wire   [0:0] tmp_fu_54_p3;

assign ap_ready = 1'b1;

assign ap_return = {{{{{{{{tmp_30_fu_194_p3}, {tmp_29_fu_174_p3}}, {tmp_28_fu_154_p3}}, {tmp_27_fu_134_p3}}, {tmp_26_fu_114_p3}}, {tmp_25_fu_94_p3}}, {tmp_24_fu_74_p3}}, {tmp_fu_54_p3}};

assign index_assign_2_1_fu_70_p1 = tmp_9_fu_62_p3;

assign index_assign_2_2_fu_90_p1 = tmp_s_fu_82_p3;

assign index_assign_2_3_fu_110_p1 = tmp_1_fu_102_p3;

assign index_assign_2_4_fu_130_p1 = tmp_2_fu_122_p3;

assign index_assign_2_5_fu_150_p1 = tmp_3_fu_142_p3;

assign index_assign_2_6_fu_170_p1 = tmp_4_fu_162_p3;

assign index_assign_2_7_fu_190_p1 = tmp_5_fu_182_p3;

assign index_assign_2_fu_50_p1 = tmp_8_fu_42_p3;

assign tmp_1_fu_102_p3 = {{idx_V}, {3'd3}};

assign tmp_24_fu_74_p3 = colData_V[index_assign_2_1_fu_70_p1];

assign tmp_25_fu_94_p3 = colData_V[index_assign_2_2_fu_90_p1];

assign tmp_26_fu_114_p3 = colData_V[index_assign_2_3_fu_110_p1];

assign tmp_27_fu_134_p3 = colData_V[index_assign_2_4_fu_130_p1];

assign tmp_28_fu_154_p3 = colData_V[index_assign_2_5_fu_150_p1];

assign tmp_29_fu_174_p3 = colData_V[index_assign_2_6_fu_170_p1];

assign tmp_2_fu_122_p3 = {{idx_V}, {3'd4}};

assign tmp_30_fu_194_p3 = colData_V[index_assign_2_7_fu_190_p1];

assign tmp_3_fu_142_p3 = {{idx_V}, {3'd5}};

assign tmp_4_fu_162_p3 = {{idx_V}, {3'd6}};

assign tmp_5_fu_182_p3 = {{idx_V}, {3'd7}};

assign tmp_8_fu_42_p3 = {{idx_V}, {3'd0}};

assign tmp_9_fu_62_p3 = {{idx_V}, {3'd1}};

assign tmp_fu_54_p3 = colData_V[index_assign_2_fu_50_p1];

assign tmp_s_fu_82_p3 = {{idx_V}, {3'd2}};

endmodule //readOneDataFromCol
