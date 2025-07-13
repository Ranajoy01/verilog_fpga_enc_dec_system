`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2025 12:32:26
// Design Name: 
// Module Name: SERIALIZER
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


module SERIALIZER(
//output-------------
serial_out,
mem_addr,
//status signal----------
sym_1_tx,
sym_5_tx,
//clock_signal------------
clk,
//reset_signal-----------
rst,
//data_input------------
in,
//command_signal---------
inc_bc,//bit counter
inc_sc,//symbol counter
s_lB,//shift/load bar PISO 
en,
serial_out_en,
mem_en
);
//-----------INPUT OUTPUT PORT DECLARATION----------------------------------------

//output-------------
output serial_out;
output[2:0] mem_addr;
//status signal----------
output sym_1_tx,
sym_5_tx;
//clock_signal------------
input clk;
//reset_signal-----------
input rst;
//data_input------------
input[15:0] in;
//command_signal---------
input inc_bc,//bit counter
inc_sc,//symbol counter
s_lB,//shift/load bar PISO 
en,
serial_out_en,
mem_en;

//shift register and bit counter---------------------------------------------------

wire[15:0] ps_16_in;
wire[3:0] cnt1_out;
wire ps_16_out,buff_1_3_en,buff_2_en,serial_out_ff1,serial_out_ff2; 
assign buff_1_3_en=mem_en & en & (~rst);
assign buff_2_en=en & (~rst) & serial_out_en;
BUFFER_16 BUFF3(ps_16_in,in,buff_1_3_en);
PISO_16 PS_16(ps_16_out,ps_16_in,s_lB,rst,clk);

BUFFER_1 BUFF2(serial_out,ps_16_out,buff_2_en);
MOD_16_COUNTER CNT1_bc(cnt1_out,inc_bc,rst,clk);
COMPARATOR_4BIT_ZERO EQZ1(sym_1_tx,cnt1_out);
//5 symbol check and memory address-----------------------------------------------

wire[2:0] cnt2_out;
MOD_5_COUNTER CNT2_sc(cnt2_out,inc_sc,rst,clk);
BUFFER_3 BUFF1(mem_addr,cnt2_out,buff_1_3_en);
COMPARATOR_3BIT_ZERO EQZ2(sym_5_tx,cnt2_out);
endmodule
