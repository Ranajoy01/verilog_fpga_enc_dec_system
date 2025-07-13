`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2025 11:54:39
// Design Name: 
// Module Name: RAM_5X16
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


module RAM_5X16(data,addr,rd_wrB,En,clr,clk);
inout[15:0] data;
input[2:0] addr;
input rd_wrB,En,clk,clr;
reg[15:0] mem[0:4];
assign data=(En==1'b1)?((rd_wrB==1'b1)? mem[addr]:16'bz):16'bz;
always @(negedge clk)
begin
if(clr==1'b1)
begin
mem[0]<=16'b0;
mem[1]<=16'b0;
mem[2]<=16'b0;
mem[3]<=16'b0;
mem[4]<=16'b0;
//mem[8]<=16'b0;
//mem[9]<=16'b0;
//mem[10]<=16'b0;
//mem[11]<=16'b0;
//mem[12]<=16'b0;
//mem[13]<=16'b0;
//mem[14]<=16'b0;
//mem[15]<=16'b0;
end
else 
if(En==1'b1)
begin
if(rd_wrB==1'b0)
mem[addr]<=data;
end
end
endmodule
