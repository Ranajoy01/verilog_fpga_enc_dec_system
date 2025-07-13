`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.07.2025 22:16:43
// Design Name: 
// Module Name: XR_STAGE
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module XR_STAGE(sym_1_enc,out,in,inc_cnt,rst,clk);
//status_signal----------------------------
output sym_1_enc;
//-----------------------------------------
input rst,
inc_cnt,
clk;
//data------------

input[3:0] in;
output[3:0] out;
//----------------
wire[1:0] cnt1_out;
wire[3:0] key_out;
//----------------
MOD_4_COUNTER CNT_1(cnt1_out,inc_cnt,rst,clk);
KEY_4X4_ROM KR_1(key_out,cnt1_out);
XOR_16 XOR_1(out,in,key_out);
COMPARATOR_2BIT_ZERO EQZ1(sym_1_enc,cnt1_out);
endmodule
