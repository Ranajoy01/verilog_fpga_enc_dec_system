`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.07.2025 17:30:10
// Design Name: 
// Module Name: MM_STAGE
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


module MM_STAGE(
//output-----------------
sym_5_enc,
mem_in,
mem_addr,
//input-------------------
in,
inc_cnt1,
en,
mem_EN,
rst,
clk);
//status signal--------------------------------
output sym_5_enc;
//----------------------------------------------
output[15:0] mem_in;
output[2:0] mem_addr;
input[3:0] in;
input mem_EN,en,rst,inc_cnt1,clk;
//----mem_addr_count and 5 symbol encryption check------------------------------
wire[15:0] mem_in_out;
wire[2:0] cnt1_out;
MOD_5_COUNTER CNT1(cnt1_out,inc_cnt1,rst,clk);
COMPARATOR_3BIT_ZERO EQZ1(sym_5_enc,cnt1_out);
//------------------------------------------------------------------------------
//----temporary symbol store----------------------------------------------------
wire[3:0] D_wait_out,
D_3_out,
D_2_out,
D_1_out,
D_0_out;
//PIPO_4bit D_wait(D_wait_out,in,en,rst,clk);
PIPO_4bit D_3(D_3_out,in,en,rst,clk);
PIPO_4bit D_2(D_2_out,D_3_out,en,rst,clk);
PIPO_4bit D_1(D_1_out,D_2_out,en,rst,clk);
PIPO_4bit D_0(D_0_out,D_1_out,en,rst,clk);
//-------------------------------------------------------------------------------
//memmory input data------------------------------------------------------------
wire buff_en=en & mem_EN;
assign mem_in_out={D_3_out,D_2_out,D_1_out,D_0_out};
BUFFER_16 BUFF1(mem_in,mem_in_out,buff_en);
//memory address----------------------------------------------------------------
BUFFER_3 BUFF2(mem_addr,cnt1_out,buff_en);
endmodule
