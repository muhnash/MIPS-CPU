module Adder (out, instruction_address);
	input [31:0] instruction_address;
	output [31:0] out;
	reg [31:0] out;
	always @ (instruction_address)
		begin		  
			assign {out} = instruction_address + 32'b00000000000000000000000000000100;
		end
endmodule