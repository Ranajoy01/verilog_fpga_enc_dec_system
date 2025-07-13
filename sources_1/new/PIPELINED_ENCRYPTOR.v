`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2025 11:06:25
// Design Name: 
// Module Name: PIPELINED_ENCRYPTOR
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


module PIPELINED_ENCRYPTOR(
//output----------------------------
mem_in,
mem_addr,
//clock_signal----------------------
clk,
//reset signal----------------------
rst,
//---------------Encryptor----------------------------

//status_signal----------------------
SYM_5_ENC,
SYM_1_ENC,
//command_signal----------------------
LD_ENC,
XR_INC_ENC,
MM_INC_ENC,
//data_input-------------------------
data_in,
//---------------RAM-----------------------------------

//status_signal----------------------

//command_signal----------------------
MEM_EN
);
//Input_output_port_declaration-------------------------------------------------------------
//output----------------------------
output[15:0] mem_in;
output[2:0] mem_addr;
//clock_signal----------------------
input clk;
//reset signal----------------------
input rst;
//---------------Encryptor----------------------------

//status_signal----------------------
output SYM_5_ENC,
SYM_1_ENC;
//command_signal----------------------
input LD_ENC,
XR_INC_ENC,
MM_INC_ENC;
//data_input-------------------------
input[3:0] data_in;
//---------------RAM-----------------------------------

//status_signal----------------------

//command_signal----------------------
input MEM_EN;
//Wire declaration-------------------------------------------------------------------
wire[3:0] IN_out,
IN_XR_out,
XR_out,
XR_SB_out,
SB_out,
SB_MM_out;
//component instantiation------------------------------------------------------------------
//IN------------------------------------------------------
IN_STAGE IN(IN_out,data_in,LD_ENC,rst,clk);
//IN_XR---------------------------------------------------
PIPO_4bit IN_XR(IN_XR_out,IN_out,LD_ENC,rst,clk);
//XR-------------------------------------------------------
XR_STAGE XR(SYM_1_ENC,XR_out,IN_XR_out,XR_INC_ENC,rst,clk);
//XR_SB---------------
PIPO_4bit XR_SB(XR_SB_out,XR_out,LD_ENC,rst,clk);
//SB--------------------------------------------------------
SB_STAGE SB(SB_out,XR_SB_out);
//SB_MM-----------------------------------------------------
PIPO_4bit SB_MM(SB_MM_out,SB_out,LD_ENC,rst,clk);
//MM--------------------------------------------------------
MM_STAGE MM(
//output-----------------
SYM_5_ENC,
mem_in,
mem_addr,
//input-------------------
SB_MM_out,
MM_INC_ENC,
LD_ENC,
MEM_EN,
rst,
clk);

endmodule
