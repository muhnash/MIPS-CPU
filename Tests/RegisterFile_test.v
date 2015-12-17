module regFile_tb();
	reg read_reg1[4:0],read_reg2[4:0],write_reg[4:0],write_data[31:0],RegWrite,clock;
	wire read_data1[31:0],read_data2[31:0];

	RegisterFile reg_file(read_data1,
    read_data2,
   	RegWrite, // control signal 
	read_reg1,
	read_reg2,
	write_reg,
	write_data,
	clock);
	
	initial
		begin
			
		end 
	
	
endmodule 