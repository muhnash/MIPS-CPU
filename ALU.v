module ALU(out,ZERO,in1,in2,alu_operation);

	input [31:0]in1;
	input [31:0]in2;
	input [3:0]alu_operation;
	output [31:0]out;
	output ZERO;

	reg [31:0]out;
	reg ZERO = 0;
	/*
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
	always @(in1 or in2 or alu_operation)
		begin 
	
			if(alu_operation==4'b0010) 	out=in1+in2; 	//ADD
			
			else if (alu_operation==4'b0110) //subtract 
				begin 
					out=in1-in2; 
					if (out==0) ZERO=1;
				end 	

			else if (alu_operation==4'b0000) out=in1 && in2; // AND
			
			else if (alu_operation==4'b0001) out=in1||in2; // OR
			
			else if (alu_operation==4'b1100) out=!(in1||in2); //NOR
			
			//---------------------- THE FOLLOWING INS"T COMPLETE --------------------------
			else if (alu_operation==4'b0111) out=in1+in2; // set on less than
			
			else if (alu_operation==4'b0100) out=in1+in2; // shiftleft
		end

endmodule 












