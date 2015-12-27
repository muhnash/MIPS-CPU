module test_PC();
	wire clock;
	wire [31:0]inst_address; //output of PC
	wire [31:0]mux5_out; // input of PC
	wire [31:0]mux4_out;
	wire BranchControl,Jump;
	wire [31:0]jump_address;
	wire [31:0]address_plus4;
	wire [31:0] adder2_result;
	
	ProgramCounter PC(inst_address , mux5_out ,clock);

	Adder_4 Adder2(address_plus4 , inst_address );
	
	MUX_2x1 mux4 (mux4_out ,address_plus4 , adder2_result, BranchControl); 
	
	MUX_2x1	mux5 (mux5_out ,mux4_out ,jump_address ,Jump);
endmodule 
		