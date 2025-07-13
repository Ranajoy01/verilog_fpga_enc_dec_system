`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.07.2025 22:12:09
// Design Name: 
// Module Name: datapath_tx
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


module datapath_tx(
//output----------------------------
serial_out,
//clock_signal----------------------
clk,
//reset signal----------------------
rst,
//---------------Encryptor----------------------------

//status_signal----------------------
SYM_5_ENC,
SYM_1_ENC,
//command_signal----------------------
LD_ENC,
XR_INC_ENC,
MM_INC_ENC,
//data_input-------------------------
data_in,
//---------------RAM-----------------------------------

//status_signal----------------------

//command_signal----------------------
MEM_EN,
RD_WRB,
//---------------Serializer----------------------------

//status_signal----------------------
SYM_1_TX,
SYM_5_TX,
//command_signal----------------------
EN_SER,
SER_OUT_EN,
SR_INC_BC,//bit counter
SR_INC_SC,//symbol counter
S_LB_SR//shift/load bar PISO 
);
//-----------------INPUT_OUTPUT_PORT_DECLARATION-----------------------------------------------------
//output----------------------------
output serial_out;
//clock_signal----------------------
input clk;
//reset signal----------------------
input rst;
//---------------Encryptor----------------------------

//status_signal----------------------
output SYM_5_ENC,
SYM_1_ENC;
//command_signal----------------------
input LD_ENC,
XR_INC_ENC,
MM_INC_ENC;
//data_input-------------------------
input[3:0] data_in;
//---------------RAM-----------------------------------

//status_signal----------------------

//command_signal----------------------
input MEM_EN,
RD_WRB;
//---------------Serializer----------------------------

//status_signal----------------------
output SYM_1_TX,
SYM_5_TX;
//command_signal----------------------
input EN_SER,
SER_OUT_EN,
SR_INC_BC,//bit counter
SR_INC_SC,//symbol counter
S_LB_SR;//shift/load bar PISO 

//-----------------WIRE DECLARATION------------------------------------------------------------
wire[2:0] mem_addr;
wire[15:0] mem_in;
//---------------------DATAPATH------------------------------------------------------------------------------

//--ENCRYPTOR-----------------------------------------------------------------------------------------
wire rst_ENC;
assign rst_ENC=rst | (~LD_ENC);
PIPELINED_ENCRYPTOR ENCRYPTOR(
//output----------------------------
mem_in,
mem_addr,
//clock_signal----------------------
clk,
//reset signal----------------------
rst_ENC,
//---------------Encryptor----------------------------

//status_signal----------------------
SYM_5_ENC,
SYM_1_ENC,
//command_signal----------------------
LD_ENC,
XR_INC_ENC,
MM_INC_ENC,
//data_input-------------------------
data_in,
//---------------RAM-----------------------------------

//status_signal----------------------

//command_signal----------------------
MEM_EN
);

//------------------------------RAM------------------------------------------------------

RAM_5X16 RAM_MEM(mem_in,mem_addr,RD_WRB,MEM_EN,rst,clk);

//---------------------------SERIALIZER---------------------------------------------------
wire rst_SER;
assign rst_SER=rst | (~EN_SER);
SERIALIZER SERIALIZER(
//output-------------
serial_out,
mem_addr,
//status signal----------
SYM_1_TX,
SYM_5_TX,
//clock_signal------------
clk,
//reset_signal-----------
rst_SER,
//data_input------------
mem_in,
//command_signal---------
SR_INC_BC,//bit counter
SR_INC_SC,//symbol counter
S_LB_SR,//shift/load bar PISO 
EN_SER,
SER_OUT_EN,
MEM_EN
);
endmodule
