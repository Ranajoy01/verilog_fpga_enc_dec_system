`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2025 13:09:25
// Design Name: 
// Module Name: MOD_16_COUNTER
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


module MOD_16_COUNTER(out,inc,rst,clk);
input inc,rst,clk;
output reg[3:0] out;

always @(posedge clk or posedge rst)
begin
if(rst==1'b1)
out<=4'b0;
else if(inc==1'b1)
out<=out+1;
end
endmodule
