`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.07.2025 17:30:10
// Design Name: 
// Module Name: COMPARATOR_2BIT_ZERO
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


module COMPARATOR_2BIT_ZERO(out,in);
output out;
input[1:0] in;
assign out=~|in;
endmodule
