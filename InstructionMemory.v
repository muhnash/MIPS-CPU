module InstructionMemory(instruction,address,clock);
	input address[5:0],clock;
	output instruction[31:0];
	
	reg [31:0]instruction;
	reg [31:0]inst_memory[0:63]; //instruction memory of size 64 instruction , 32 bit each 
								// 6 bits for addressing
	initial 
		begin
			$readmemb("instruction_memory.list",inst_memory);
		end 
	always @(posedge clock)
		begin
			instruction=inst_memory[address];
		end
endmodule 						  
