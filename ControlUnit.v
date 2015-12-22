module ControlUnit(RegDst,
				   Jump,
				   Branch,
				   MemRead,
				   MemrtoReg,
				   ALUop,
				   MemWrite,
				   ALUsrc,
				   RegWrite,
				   op_code);
	
	input  op_code[5:0];
	output RegDst,
		   Jump,
		   Branch,
		   MemRead,
		   MemrtoReg,
	       [1:0]ALUop,
		   MemWrite,
		   ALUsrc,
		   RegWrite;
		   
	reg    RegDst,
		   Jump,  
		   Branch,
		   MemRead,
		   MemrtoReg,
	       ALUop,
		   MemWrite,
		   ALUsrc,
		   RegWrite;
	
	always @ (op_code)
		begin		  
			case (op_code)
				6'b000_000 : assign {out} = 9'b100_100_010; // R-type instructions
				6'b100_011 : assign {out} = 9'b011_110_000; // lw instruction
				6'b101_011 : assign {out} = 9'bx1x_001_000; // sw instruction
			endcase
		end
endmodule