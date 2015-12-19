module ProgramCounter(address,forced_instruction, clock); 
	// for insttruction memory of size 64 , 8 bit address
	input clock, forced_instruction[7:0];
	output address[7:0];	
	reg [7:0]next_instruction,address;
	
	
	initial
		begin
			next_instruction<=6'b000000;
		end 
	
	always@(posedge clock)
		begin
			address <=next_instruction;
			next_instruction<= next_instruction +6'b000100;
		end		 
		
	always@(forced_instruction)
		begin
			// +++ check for instruction validity : must be devisible by 4 !! HW or it's an assembler job ?
			next_instruction<= forced_instruction;
		end 
endmodule