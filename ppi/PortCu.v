


module portcu(PCu,PD,control,controlword);
	inout [7:0]PD;
	inout[3:0]PCu;
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
	wire [3:0]PCuin;
	reg [3:0]PCuout;
	assign selectedport={controlword[3:1]};
	assign PCu=(controlword==8'b0xxx_xxxx)?PCuout  :4'hz;
	assign  PCu=(control==6'b010010&&controlword==8'b100x0xxx)?PCuout:4'hz;
	assign  PCuin=PCu;
	assign PD=(control==6'b001010&&controlword==8'b100x1xxx)?{(4'hz),PCuin}:8'hzz;
	
always@(PD)
begin 		
PCuout<={PD[7:4]};
if (controlword==8'b0xxx_xxxx&&control==6'bxxx0xx)
begin
if(selectedport>4)
 PCuout[selectedport-4] =controlword[0]; //set or no the selected pin


end
end
	

endmodule 