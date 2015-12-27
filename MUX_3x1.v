module MUX_3x1(out,value1,value2,value3,sel);
	input [1:0]sel;
	input [31:0]value1;
	input [31:0]value2;
	input [31:0]value3;
	output [31:0]out; 
	
	reg [31:0]out;
	
	always @(sel or value1 or value2) 
		begin
		if(sel==2'b00)begin					  
			out=value1;
		end
		else if(sel==2'b01)begin
			out=value2;
		end
		else if(sel==2'b10)begin
			out=value3;
		end
	end
	
	
endmodule

module MUX_3x1_5bits(out,value1,value2,value3,sel);
	input [1:0]sel;
	input [4:0]value1;
	input [4:0]value2;
	input [4:0]value3;
	output [4:0]out;
	reg [4:0]out;
	
	always @(sel or value1 or value2) begin
		if(sel==2'b00)begin
			out=value1;
		end
		else if(sel==2'b01)begin
			out=value2;
		end
		else if(sel==2'b10)begin
			out=value3;
		end
	end
	
	
endmodule
