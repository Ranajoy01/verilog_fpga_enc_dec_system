`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.07.2025 17:29:01
// Design Name: 
// Module Name: MOD_5_COUNTER
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


module MOD_5_COUNTER(out,inc,rst,clk);
output reg[2:0] out;
input inc,rst,clk;
parameter S0=3'b000,S1=3'b001,S2=3'b010,S3=3'b011,S4=3'b100;
reg[2:0] ns=S0;
always @(posedge clk or posedge rst)
begin
if(rst==1'b1)
out<=S0;
else
out<=ns;
end

always @(inc)
begin
if(inc==1'b1)
begin
case(out)
S0:
ns=S1;
S1:
ns=S2;
S2:
ns=S3;
S3:
ns=S4;
S4:
ns=S0;
default
ns=S0;
endcase
end
end
endmodule