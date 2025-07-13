`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.07.2025 22:16:43
// Design Name: 
// Module Name: IN_STAGE
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


module IN_STAGE(out,in,en,rst,clk);

input rst,
en,
clk;
//data------------

input[3:0] in;
output[3:0] out;
//----------------
PIPO_4bit input_reg(out,in,en,rst,clk);
endmodule
