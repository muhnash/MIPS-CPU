module Mux(out,value1,value2,sel);

input sel ,value1[31:0],value2[31:0];
output out; 
reg [31:0]out;
	
always @(sel) begin
	if(sel==0) begin
		  out=value1;			   
	end
	else if(sel==1) begin
		out=value2;
	end
end

endmodule


module Mux_5bits(out,value1,value2,sel);

input sel ,value1[4:0],value2[4:0];
output out; 
reg [4:0]out;
	
always @(sel) begin
	if(sel==0) begin
		  out=value1;			   
	end
	else if(sel==1) begin
		out=value2;
	end
end

endmodule


	