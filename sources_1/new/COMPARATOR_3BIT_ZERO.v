`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.07.2025 17:29:01
// Design Name: 
// Module Name: COMPARATOR_3BIT_ZERO
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


module COMPARATOR_3BIT_ZERO(out,in);
output out;
input[2:0] in;
assign out=~|in;
endmodule
