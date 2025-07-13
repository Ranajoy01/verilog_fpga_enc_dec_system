`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.07.2025 21:22:06
// Design Name: 
// Module Name: BUFFER_3
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


module BUFFER_3(out,in,en);
output[2:0] out;
input[2:0] in;
input en;
assign out=(en==1'b1)?in:3'bz;
endmodule
