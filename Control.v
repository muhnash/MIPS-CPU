module Control (out, op_code);
	input [5:0] op_code;
	output [9:0] out;	
	reg [9:0] out;
	always @ (op_code)
		begin		  
			case (op_code)
				6'b000_000 : assign {out} = 9'b100_100_010; // R-type instructions
				6'b100_011 : assign {out} = 9'b011_110_000; // lw instruction
				6'b101_011 : assign {out} = 9'bx1x_001_000; // sw instruction
			endcase
		end
endmodule