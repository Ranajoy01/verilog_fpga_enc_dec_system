`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.07.2025 22:16:43
// Design Name: 
// Module Name: PIPO_4bit
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


module PIPO_4bit(out,in,ld,rst,clk);
//control---------

input rst,
ld,
clk;
//data------------

input[3:0] in;
output reg[3:0] out;
//----------------

always @(posedge clk or posedge rst)
begin
if(rst==1'b1)
out<=4'b0;
else if(ld==1'b1)
out<=in;
end
endmodule
