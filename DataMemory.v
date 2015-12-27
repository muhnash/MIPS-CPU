module DataMemory(read_data ,address_in ,write_data ,MemRead,MemWrite,clock);
input [31:0]address_in;
input [31:0]write_data;
input MemRead, MemWrite ,clock;
output [31:0]read_data;

reg [7:0]data_memory[0:2047]; // 2K=2048 bytes of  data memory 	  , 11 bits for addressing 

wire [10:0]address=address_in[10:0]; // For solving address wide issue

initial 
	begin
		$readmemb("data_memory.list",data_memory);
	end 

assign read_data=(MemRead)?{data_memory[address],data_memory[address+1],data_memory[address+2],data_memory[address+3]}:32'b0;

always@(posedge clock)
	begin	  
		if(MemWrite==1)
		begin
			data_memory[address]=write_data[31:24];
			data_memory[address+1]=write_data[23:16];
			data_memory[address+2]=write_data[15:8];
			data_memory[address+3]=write_data[7:0];
		end 
		
	end 

endmodule