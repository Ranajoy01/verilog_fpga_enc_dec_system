`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.07.2025 12:48:13
// Design Name: 
// Module Name: controller_tx
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


module controller_tx(
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

//----INPUT_OUTPUT_PORT_DECLARATION----------------------------------------------------------------------

//output----------------------------
output reg done;
//clock_signal----------------------
input clk;
//reset signal----------------------
input rst;
//GO signal-------------------------
input go;
//---------------Encryptor----------------------------

//status_signal----------------------
input SYM_5_ENC,
SYM_1_ENC;
//command_signal----------------------
output reg LD_ENC,
XR_INC_ENC,
MM_INC_ENC;
//---------------RAM-----------------------------------

//status_signal----------------------

//command_signal----------------------
output reg MEM_EN,
RD_WRB;
//---------------Serializer----------------------------

//status_signal----------------------
input SYM_1_TX,
SYM_5_TX;
//command_signal----------------------
output reg EN_SER,
SER_OUT_EN,
SR_INC_BC,//bit counter
SR_INC_SC,//symbol counter
S_LB_SR;//shift/load bar PISO 

//---------------STATE----------------------------------------------------------------------------------
parameter 
S0=4'b0000,S1=4'b0001,S2=4'b0010,S3=4'b0011,
S4=4'b0100,S5=4'b0101,S6=4'b0110,S7=4'b0111,
S8=4'b1000,S9=4'b1001,S10=4'b1010,S11=4'b1011,
S12=4'b1100,S13=4'b1101,S14=4'b1110,S15=4'b1111;

reg[3:0] state,ns=S0;
//----------STATE_TRANSITION_SEQUENTIAL----------------------------------------------------------------

always @(posedge clk)
begin
if(rst==1'b1)
state<=S0;
else
state<=ns;
end

//----------------Next state logic combinational--------------------------------------------------------

always @(state or go or SYM_5_ENC or SYM_1_ENC or SYM_1_TX or SYM_5_TX)
begin
case(state)
//state-0--------------------------------------------
S0:
begin
if(go==1'b1)
ns=S1;
else
ns=S0;
end
//---------------------------------------------------

//state-1--------------------------------------------
S1:
begin
ns=S2;
end
//---------------------------------------------------

//state-2--------------------------------------------
S2:
begin
ns=S3;
end
//---------------------------------------------------

//state-3--------------------------------------------
S3:
begin
ns=S4;
end
//---------------------------------------------------
//state-4--------------------------------------------
S4:
begin
if(SYM_1_ENC==1'b1)
ns=S5;
else
ns=S4;
end
//---------------------------------------------------
//state-5--------------------------------------------
S5:
begin
ns=S6;
end
//---------------------------------------------------
//state-6--------------------------------------------
S6:
begin
ns=S7;
end
//---------------------------------------------------
//state-7--------------------------------------------
S7:
begin
if(SYM_5_ENC==1'b1)
ns=S8;
else
ns=S4;
end
//---------------------------------------------------
//state-8--------------------------------------------
S8:
begin
ns=S9;
end
//---------------------------------------------------
//state-9--------------------------------------------
S9:
begin
ns=S10;
end
//---------------------------------------------------
//state-10--------------------------------------------
S10:
begin
if(SYM_1_TX==1'b1)
ns=S11;
else 
ns=S10;

end
//---------------------------------------------------
//state-11--------------------------------------------
S11:
begin
if(SYM_5_TX==1'b1)
ns=S0;
else 
ns=S10;
end
//---------------------------------------------------
//state-12--------------------------------------------
S12:
begin
ns=S12;
end
//---------------------------------------------------
default:
ns=S0;
endcase
end

//--------------------------State signal genereate-------------------------------------------------------

always @(state)
begin
case(state)
//state-0--------------------------------------------
S0:
begin
//output----------------------------

done=0;
//---------------Encryptor----------------------------

//command_signal----------------------
LD_ENC=0;
XR_INC_ENC=0;
MM_INC_ENC=0;
//---------------RAM-----------------------------------

//command_signal----------------------
MEM_EN=0;
RD_WRB=1;
//---------------Serializer----------------------------

//command_signal----------------------
EN_SER=0;
SER_OUT_EN=0;
SR_INC_BC=0;//bit counter
SR_INC_SC=0;//symbol counter
S_LB_SR=0;//shift/load bar PISO 

end
//---------------------------------------------------

//state-1--------------------------------------------
S1:
begin
//output----------------------------

done=0;
//---------------Encryptor----------------------------

//status_signal----------------------

//command_signal----------------------
LD_ENC=1;
XR_INC_ENC=0;
MM_INC_ENC=0;
//---------------RAM-----------------------------------

//status_signal----------------------

//command_signal----------------------
MEM_EN=0;
RD_WRB=0;
//---------------Serializer----------------------------

//command_signal----------------------
SR_INC_BC=0;//bit counter
SR_INC_SC=0;//symbol counter
S_LB_SR=0;//shift/load bar PISO 


end
//---------------------------------------------------

//state-2--------------------------------------------
S2:
begin
//output----------------------------

done=0;
//---------------Encryptor----------------------------

//status_signal----------------------

//command_signal----------------------
LD_ENC=1;
XR_INC_ENC=0;
MM_INC_ENC=0;
//---------------RAM-----------------------------------

//status_signal----------------------

//command_signal----------------------
MEM_EN=0;
RD_WRB=0;
//---------------Serializer----------------------------

//command_signal----------------------
SR_INC_BC=0;//bit counter
SR_INC_SC=0;//symbol counter
S_LB_SR=0;//shift/load bar PISO 

end
//---------------------------------------------------

//state-3--------------------------------------------
S3:
begin
//output----------------------------

done=0;
//---------------Encryptor----------------------------

//status_signal----------------------

//command_signal----------------------
LD_ENC=1;
XR_INC_ENC=1;
MM_INC_ENC=0;
//---------------RAM-----------------------------------

//status_signal----------------------

//command_signal----------------------
MEM_EN=0;
RD_WRB=0;
//---------------Serializer----------------------------

//command_signal----------------------
SR_INC_BC=0;//bit counter
SR_INC_SC=0;//symbol counter
S_LB_SR=0;//shift/load bar PISO 

end
//---------------------------------------------------
//state-4-------------------------------------------
S4:
begin
//output----------------------------

done=0;
//---------------Encryptor----------------------------

//status_signal----------------------

//command_signal----------------------
LD_ENC=1;
XR_INC_ENC=1;
MM_INC_ENC=0;
//---------------RAM-----------------------------------

//status_signal----------------------

//command_signal----------------------
MEM_EN=0;
RD_WRB=0;
//---------------Serializer----------------------------

//command_signal----------------------
SR_INC_BC=0;//bit counter
SR_INC_SC=0;//symbol counter
S_LB_SR=0;//shift/load bar PISO 

end
//---------------------------------------------------

//state-5--------------------------------------------
S5:
begin
//output----------------------------

done=0;
//---------------Encryptor----------------------------

//status_signal----------------------

//command_signal----------------------
LD_ENC=1;
XR_INC_ENC=1;
MM_INC_ENC=0;
//---------------RAM-----------------------------------

//status_signal----------------------

//command_signal----------------------
MEM_EN=0;
RD_WRB=0;
//---------------Serializer----------------------------

//command_signal----------------------
SR_INC_BC=0;//bit counter
SR_INC_SC=0;//symbol counter
S_LB_SR=0;//shift/load bar PISO 

end
//---------------------------------------------------
//state-6--------------------------------------------
S6:
begin
//output----------------------------

done=0;
//---------------Encryptor----------------------------

//status_signal----------------------

//command_signal----------------------
LD_ENC=1;
XR_INC_ENC=1;
MM_INC_ENC=1;
//---------------RAM-----------------------------------

//status_signal----------------------

//command_signal----------------------
MEM_EN=1;
RD_WRB=0;
//---------------Serializer----------------------------

//command_signal----------------------
SR_INC_BC=0;//bit counter
SR_INC_SC=0;//symbol counter
S_LB_SR=0;//shift/load bar PISO 
end
//---------------------------------------------------
//state-7--------------------------------------------
S7:
begin
//output----------------------------

done=0;
//---------------Encryptor----------------------------

//status_signal----------------------

//command_signal----------------------
LD_ENC=1;
XR_INC_ENC=1;
MM_INC_ENC=0;
//---------------RAM-----------------------------------

//status_signal----------------------

//command_signal----------------------
MEM_EN=0;
RD_WRB=0;
//---------------Serializer----------------------------

//command_signal----------------------
SR_INC_BC=0;//bit counter
SR_INC_SC=0;//symbol counter
S_LB_SR=0;//shift/load bar PISO 

end
//---------------------------------------------------
//state-8--------------------------------------------
S8:
begin
//output---------------------------------------------
done=1;
//---------------Encryptor----------------------------

//status_signal----------------------

//command_signal----------------------
LD_ENC=0;
XR_INC_ENC=0;
MM_INC_ENC=0;
//---------------RAM-----------------------------------

//status_signal----------------------

//command_signal----------------------
MEM_EN=0;
RD_WRB=1;
//---------------Serializer----------------------------

//command_signal----------------------
EN_SER=1;
SR_INC_BC=1;//bit counter
SR_INC_SC=0;//symbol counter
S_LB_SR=0;//shift/load bar PISO 
end
//---------------------------------------------------
//state-9--------------------------------------------
S9:
begin
//output----------------------------

done=0;
//---------------Encryptor----------------------------

//status_signal----------------------

//command_signal----------------------
LD_ENC=0;
XR_INC_ENC=0;
MM_INC_ENC=0;
//---------------RAM-----------------------------------

//status_signal----------------------

//command_signal----------------------
MEM_EN=1;
RD_WRB=1;
//---------------Serializer----------------------------

//command_signal----------------------
EN_SER=1;

SR_INC_BC=1;//bit counter
SR_INC_SC=1;//symbol counter
S_LB_SR=0;//shift/load bar PISO 

end
//---------------------------------------------------
//state-10--------------------------------------------
S10:
begin
//output----------------------------

done=0;
//---------------Encryptor----------------------------

//status_signal----------------------

//command_signal----------------------
LD_ENC=0;
XR_INC_ENC=0;
MM_INC_ENC=0;
//---------------RAM-----------------------------------

//status_signal----------------------

//command_signal----------------------
MEM_EN=0;
RD_WRB=1;
//---------------Serializer----------------------------

//command_signal----------------------
EN_SER=1;
SER_OUT_EN=1;
SR_INC_BC=1;//bit counter
SR_INC_SC=0;//symbol counter
S_LB_SR=1;//shift/load bar PISO 

end
//---------------------------------------------------
//state-11--------------------------------------------
S11:
begin
//output----------------------------

done=0;
//---------------Encryptor----------------------------

//status_signal----------------------

//command_signal----------------------
LD_ENC=0;
XR_INC_ENC=0;
MM_INC_ENC=0;
//---------------RAM-----------------------------------

//status_signal----------------------

//command_signal----------------------
MEM_EN=1;
RD_WRB=1;
//---------------Serializer----------------------------

//command_signal----------------------
EN_SER=1;
SR_INC_BC=1;//bit counter
SR_INC_SC=1;//symbol counter
S_LB_SR=0;//shift/load bar PISO 

end
//---------------------------------------------------

endcase
end
endmodule
