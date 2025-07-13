`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2025 21:22:35
// Design Name: 
// Module Name: D_FF_POS
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


module D_FF_POS(out,in,rst,clk);
input in,rst,clk;
output reg out;
always @(posedge clk or posedge rst)
begin
if(rst==1'b1)
out<=1'b0;
else
out<=in;
end
endmodule
