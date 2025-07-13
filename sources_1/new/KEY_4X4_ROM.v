`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.07.2025 12:22:37
// Design Name: 
// Module Name: KEY_4X4_ROM
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


module KEY_4X4_ROM(out,in);
input[1:0] in;
output reg[3:0] out;
always @(*)
begin
case(in)
2'b00:out=4'b1011;
2'b01:out=4'b1100;
2'b10:out=4'b0101;
2'b11:out=4'b1011;
endcase
end
endmodule
