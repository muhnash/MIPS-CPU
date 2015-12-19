module Control (out, op_code);
	input [5:0] op_code;
	output [9:0] out;	
	reg [9:0] out;
	always @ (op_code)
		begin		  
			case (op_code)
				6'b000000 : assign {out} = 9'b100100010;
			endcase
		end
endmodule