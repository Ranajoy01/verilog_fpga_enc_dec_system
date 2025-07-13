`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2025 13:09:25
// Design Name: 
// Module Name: PISO_16
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


module PISO_16(out,in,s_lB,rst,clk);
output out;
input[15:0] in;
input s_lB,
rst,
clk;
reg[15:0] data;
assign out=data[0];
always @(posedge clk or posedge rst)
begin
if(rst==1'b1)
begin
data<=16'b0;
end
else if(s_lB==1'b0)
begin
data<=in;
end
else if(s_lB==1'b1)
begin
data<=data>>1;
end
end
endmodule
