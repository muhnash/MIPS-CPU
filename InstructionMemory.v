module InstructionMemory(instruction,address,clock);
	// byte addressable memory , 256 bytes , 64 instructions
	input address[7:0],clock;  // 8 bits for adressing
	output instruction[31:0];
	
	reg [31:0]instruction;
	reg [7:0]inst_memory[0:255]; //instruction memory of size 256 byte, 64 instruction
	initial 
		begin
			$readmemb("instruction_memory.list",inst_memory);
		end 
	always @(posedge clock)
		begin
			instruction[31:24]=inst_memory[address];
			instruction[23:16]=inst_memory[address+2'b01];
			instruction[15:8]=inst_memory[address+2'b10];
			instruction[7:0]=inst_memory[address+2'b11];
		end
endmodule 						  
