`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.07.2025 17:29:01
// Design Name: 
// Module Name: BUFFER_16
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


module BUFFER_16(out,in,en);
input en;
input[15:0] in;
output[15:0] out;
assign out=(en==1'b1)?in:16'bz;
endmodule
