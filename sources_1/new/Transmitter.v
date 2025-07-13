`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.07.2025 13:41:03
// Design Name: 
// Module Name: Transmitter
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


module Transmitter(
//output---------------------------------
serial_out,
done,
//data_input-------------------------------
data_in,
//clock_signal-----------------------------
clk,
//reset signal-----------------------------
rst,
//Go signal--------------------------------
go
);

//----------------INPUT_OUTPUT_PORT_DECLARATION---------------------------------------------
//output---------------------------------
output serial_out,
done;
//data_input-------------------------------
input[3:0] data_in;
//clock_signal-----------------------------
input clk;
//reset signal-----------------------------
input rst;
//Go signal--------------------------------
input go;

//------------WIRE_DECLARATION--------------------------------------------------------------
//---------------Encryptor----------------------------

//status_signal----------------------
wire SYM_5_ENC,
SYM_1_ENC;
//command_signal----------------------
wire LD_ENC,
XR_INC_ENC,
MM_INC_ENC;

//---------------RAM-----------------------------------

//status_signal----------------------

//command_signal----------------------
wire MEM_EN,
RD_WRB;
//---------------Serializer----------------------------

//status_signal----------------------
wire SYM_1_TX,
SYM_5_TX;
//command_signal----------------------
wire EN_SER,
SER_OUT_EN,
SR_INC_BC,//bit counter
SR_INC_SC,//symbol counter
S_LB_SR;//shift/load bar PISO 


//----------Datapath------------------------------------------------------------------------
datapath_tx DP(
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
//----------------Controller------------------------------------------------------------------------
controller_tx CON(
//output----------------------------
done,
//clock_signal----------------------
clk,
//reset signal----------------------
rst,
//GO signal-------------------------
go,
//---------------Encryptor----------------------------

//status_signal----------------------
SYM_5_ENC,
SYM_1_ENC,
//command_signal----------------------
LD_ENC,
XR_INC_ENC,
MM_INC_ENC,
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


endmodule
