`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.07.2025 22:16:43
// Design Name: 
// Module Name: MOD_4_COUNTER
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


module MOD_4_COUNTER(out,inc,rst,clk);
input inc,rst,clk;
output reg[1:0] out;

always @(posedge clk or posedge rst)
begin
if(rst==1'b1)
out<=2'b00;
else if(inc==1'b1)
out<=out+1;
end
endmodule
