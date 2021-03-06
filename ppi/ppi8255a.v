`include "includes.v"

module PPI8255A(PortA,PortB,PortD,PortCl,PortCu,nCs,nRe,nWr,Reset,A);
inout [7:0] PortA,PortB,PortD;
inout[3:0] PortCl,PortCu;
input nCs,nRe,nWr,Reset;
input [1:0]A;


//bettween input and control
wire [5:0]control; 
controllogic T(nCs,nRe,nWr,Reset,A,control);
//////////////////////////////////////////
// bettween portd and conterol word and internaldatabus
wire [7:0]controlword;
databusbuffer l(PortD,control,controlword);


/////////////////////////////
porta k(PortA,PortD,control,controlword);
portb m(PortB,PortD,control,controlword);
portcl n(PortCl,PortD,control,controlword);
portcu o(PortCu,PortD,control,controlword);





endmodule 
