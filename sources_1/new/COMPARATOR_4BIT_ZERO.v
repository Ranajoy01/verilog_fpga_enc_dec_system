`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2025 14:07:23
// Design Name: 
// Module Name: COMPARATOR_4BIT_ZERO
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


module COMPARATOR_4BIT_ZERO(out,in);
output out;
input[3:0] in;
assign out=~|in;
endmodule
