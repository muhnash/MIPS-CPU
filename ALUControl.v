module ALUcontrol(alu_operation , func , ALUop);
	input [5:0]func;
	input [1:0]ALUop; 
	output [3:0]alu_operation;
	
	reg [3:0]alu_operation;
	/*
	ALUop:
	======
	00 : Addition needed (regardless the func field)
	01 : subtraction needed (regardless the func field)
	11 : AND needed (regardless the func field)
	10 : LOOK for the func field to determine the operation needed.


	ALU OPERATIONS :
	================
	AND     0000
	OR 		0001
	Add     0010
	Subtract	0110
	Set on less than	0111
	NOR		1100
	Shift left 0011
	*/
	always @(func or ALUop)
	begin
	 	if (ALUop==2'b00) alu_operation <= 4'b0010;  // add operation [for lw and sw]
	 	else if(ALUop==2'b01) alu_operation <= 4'b0110; // sub operation [for beq]
	 	else if(ALUop==2'b11) alu_operation <= 4'b0010; // and operation [for andi]
	 	else if(ALUop==2'b10) // for R instructions , alu operation depends on the func field
	 		begin
	 			case(func)
	 				6'b100000: alu_operation <= 4'b0010; //ADD ==> OP :ADD 
	 				6'b100100: alu_operation <= 4'b0000; //AND ==> OP :AND
	 				6'b100111: alu_operation <= 4'b1100; //NOR ==> OP :NOR
	 				6'b001000: alu_operation <= 4'b0010; //Jr  ==> OP :ADD ?
	 				6'b101010: alu_operation <= 4'b0111; //Slt ==> OP :set on less than 
	 				6'b000000: alu_operation <= 4'b0011; //Sll ==> OP :shift left 
	 			endcase
	 		end
	 end 
	
endmodule 




