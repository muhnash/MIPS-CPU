module ProgramCounter(inst_address,next_inst_address, clock); 
	// for instruction memory of size 64 , 8 bit address
	// UPDATE : although the instruction mem size is just 64 bytes
	// i'm addressing it with 32 bit address to be consisitent with the datapath shown in the Ref. P271
	// also for avoiding more modifications at least for now , till it's up and running 
	input [31:0]next_inst_address;
	input clock;
	output  [31:0]inst_address;
	reg [31:0]inst_address;

	initial 
	begin
		inst_address=32'b00000000000000000000000000000000;  // initialy point to the 1st instruction i'e address 0
	end

	always @(posedge clock) 
	begin
		inst_address=next_inst_address;  // updating the PC
	end
endmodule


