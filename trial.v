module InstructionMemory(instruction , address, clock);
	input address[31:0],clock;
	output instruction[31:0];
	
	reg [31:0]instruction;
	reg [31:0]inst_memory[0:63]; // 64 instruction memory
	always @(posedge clock)
		begin
			instruction=inst_memory[address];
		end
endmodule 