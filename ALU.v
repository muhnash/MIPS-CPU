module ALU(out,ZERO,in1,in2,alu_operation,shmt);

	input [31:0]in1;
	input [31:0]in2;
	input [3:0]alu_operation;
	input [4:0]shmt;
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
		begin  #5 //delay 
	
			if(alu_operation==4'b0010) 	out=in1+in2; 	//ADD
			
			else if (alu_operation==4'b0110) //subtract 
				begin 
					out=in1-in2; 
					if (out==0) ZERO=1;
				end 	

			else if (alu_operation==4'b0000) out=in1 & in2; // Bitwise AND
			
			else if (alu_operation==4'b0001) out=in1 |in2; // Bitwise OR
			
			else if (alu_operation==4'b1100) out=!(in1|in2); //NOR
			
			else if (alu_operation==4'b0111) // set on less than
				if (in1<in2) out=1;
				else out=0;
			
			else if (alu_operation==4'b0011) out=in2<<shmt; // shiftleft
		end

endmodule 












