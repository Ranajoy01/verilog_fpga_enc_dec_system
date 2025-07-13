`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.07.2025 17:13:01
// Design Name: 
// Module Name: SB_STAGE
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


module SB_STAGE(out,in);
input[3:0] in;
output[3:0] out;
S_BOX_SUBSTITUTION S_BOX(out,in);
endmodule
