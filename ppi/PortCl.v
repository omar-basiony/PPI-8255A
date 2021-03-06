


module portcl(PCl,PD,control,controlword);
	inout [7:0]PD;
	inout[3:0]PCl;
	input[7:0] controlword;
	input [5:0]control;
	
	/*
	wire nCs,nRe,nWr,Reset;
	wire [1:0]A;
	assign nCs=control[5];
	assign nRe=control[4];
	assign nWr=control[3];
	assign Reset=control[2];
	assign A={control[1:0]};*/

	///////////////////
	wire [3:0]PClin;
	reg [3:0]PClout;
	assign selectedport={controlword[3:1]};
	assign PCl=(controlword==8'b0xxx_xxxx)?PClout  :4'hz;
	assign  PCl=(control==6'b010010&&controlword==8'b1xxxx0x0)?PClout:4'hz;
	assign  PClin=PCl;
	assign PD=(control==6'b001010&&controlword==8'b1xxxx0x1)?{(4'hz),PClin}:8'hzz;
	
always@(PD)
begin 		
PClout<={PD[3:0]};
if (controlword==8'b0xxx_xxxx&&control==6'bxxx0xx)
begin
if(selectedport<4)
 PClout[selectedport] =controlword[0]; //set or no the selected pin


end
end
	

endmodule 