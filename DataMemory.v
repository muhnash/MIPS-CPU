module DataMemory(read_data ,address ,write_data ,MemRead ,clock);
input address[10:0],write_data[31:0] ,MemRead ,clock;
output read_data;

reg [7:0]data_memory[0:2047]; // 2K=2048 bytes of  data memory 	  , 11 bits for addressing
reg [31:0]read_data; 

initial 
	begin
		$readmemb("data_memory.list",data_memory);
	end 

always@(posedge clock)
	begin	  
		// MemRead=1 for reading , MemRead=0 for writing 
		if(MemRead==1)
		begin 
			read_data[31:24]=data_memory[address];
			read_data[23:16]=data_memory[address+11'b00000000001];
			read_data[15:8]=data_memory[address+11'b00000000010];
			read_data[7:0]=data_memory[address+11'b00000000011];	
		end 
		else if(MemRead==0)
		begin
			data_memory[address]=write_data[31:24];
			data_memory[address+11'b00000000001]=write_data[23:16];
			data_memory[address+11'b00000000010]=write_data[15:8];
			data_memory[address+11'b00000000011]=write_data[7:0];
		end 
		
	end 

endmodule