module RegisterFile(read_data1, read_data2, RegWrite, read_reg1, read_reg2, write_reg, write_data,clock);
	input [4:0]read_reg1;
	input [4:0]read_reg2;
	input [4:0]write_reg;
	input RegWrite, clock;
	input [31:0]write_data;
	
	output [31:0]read_data1;
	output [31:0]read_data2;
	
	reg [31:0]RegFile[0:31]; // 32 Registers >>  32 bits wide (5 bits for addressing)
	//reg [31:0]read_data1;
	//reg [31:0]read_data2;
	
	
	assign read_data1=RegFile[read_reg1];
	assign read_data2=RegFile[read_reg2];
	
	always@(posedge clock)
		begin 
			if(RegWrite==0'b1 && write_reg!=5'b00000)
			 	RegFile[write_reg]<=write_data; 			
		end 
		
	
	initial	   // for testing purposes 
		begin 
		   RegFile[5'b10101]=32'b000000000000000000000000010001;  // register 21 = 17
		   RegFile[5'b10110]=32'b000000000000000000000000011101;  // register 22 = 29
		   
		   // inst 000000  10101  10110 00001 00000 100000
		   //  ADD  $reg1 $reg22 $reg21; 
		   
		end 
endmodule	
