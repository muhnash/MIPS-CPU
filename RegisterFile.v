module RegisterFile
   (read_data1,
    read_data2,
   	RegWrite, // control signal 
	read_reg1,
	read_reg2,
	write_reg,
	write_data,
	clock);
	
	input read_reg1[4:0], read_reg2[4:0], write_reg[4:0], RegWrite, write_data[31:0], clock;
	output read_data1[31:0], read_data2[31:0];
	
	reg [31:0]RegFile[0:31]; // 32 Registers >>  32 bits wide (5 bits for addressing)
	reg [31:0]read_data1;
	reg [31:0]read_data2;
					   
	always@(posedge clock)
		begin
			if(RegWrite==0'b1)
				begin
					#1 RegFile[write_reg]<=write_data; 
				end
			else
				begin
					// check for $S0 
						if(read_reg1==5'b00000) read_data1<=32'b0;
						else  #1 read_data1<=RegFile[read_reg1];
						
							
						if(read_reg1==5'b00000) read_data2<=32'b0;
						else  #1 read_data2<=RegFile[read_reg2];
				end			
		end 
						
	
endmodule
