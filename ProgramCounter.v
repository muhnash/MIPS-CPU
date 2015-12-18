module ProgramCounter(address,next_instruction, clock);
	// for insttruction memory of size 64 , 8 bit address
	input clock, next_instruction[7:0];
	output address[7:0];	
	reg [7:0]current_instruction,address;
	
	
	initial
		begin
			current_instruction<=6'b000000;
		end 
	
	always@(posedge clock)
		begin
			address <=current_instruction;
			current_instruction<= current_instruction +6'b000100;
		end		 
		
	always@(next_instruction)
		begin
			// +++ check for instruction validity : must be devisuble by 4
			current_instruction<= next_instruction;
		end 
endmodule