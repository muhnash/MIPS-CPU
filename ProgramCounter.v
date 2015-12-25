module ProgramCounter(inst_address,next_inst_address, clock); 
	// for insttruction memory of size 64 , 8 bit address
	input next_inst_address[7:0], clock;
	output  inst_address;
	reg [7:0]inst_address;

	initial 
	begin
		inst_address=8'b00000000;
	end

	always @(posedge clock) 
	begin
		inst_address=next_inst_address;
	end
endmodule


