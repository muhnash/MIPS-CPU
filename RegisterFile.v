module RegisterFile(read_data1, read_data2, RegWrite, read_reg1, read_reg2, write_reg, write_data,clock);
	input [4:0]read_reg1;
	input [4:0]read_reg2;
	input [4:0]write_reg;
	input RegWrite, clock;
	input [31:0]write_data;
	
	output [31:0]read_data1;
	output [31:0]read_data2;
	
	reg [31:0]RegFile[0:31]; // 32 Registers >>  32 bits wide (5 bits for addressing)
	

	initial	   
		begin 	   
		   RegFile[0]=0;		
		   // for testing purposes 
		   RegFile[20]=16;  
		   RegFile[21]=32;
		   RegFile[9]=64;
		   
		end 
		
		
	assign #5 read_data1=RegFile[read_reg1];
	assign #5 read_data2=RegFile[read_reg2];
	
	always@(posedge clock)
		begin 
			if(RegWrite==0'b1 && write_reg!=5'b00000)
			 	#5 RegFile[write_reg]<=write_data; 			
		end 
		
	
	
endmodule	
