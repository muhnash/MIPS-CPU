module InstructionMemory(instruction, inst_address , clock);
	// byte addressable memory , 256 bytes , 64 instructions >>8 bits for adressing
	input [31:0]inst_address; // accepting 32 bit address for now [FIXING SIMULATION ISSUE]
	input clock;  
	output [31:0]instruction;
	
	reg [31:0]instruction;
	reg [7:0]inst_memory[0:255]; //instruction memory of size 256 byte, 64 instruction
					
	initial 
		begin
			$readmemb("instruction_memory.list",inst_memory);
		end 
	always @(posedge clock or inst_address)
		begin
			#5 instruction<={inst_memory[inst_address],
						inst_memory[inst_address+1],
						inst_memory[inst_address+2],
						inst_memory[inst_address+3]};
		end
endmodule 						  
