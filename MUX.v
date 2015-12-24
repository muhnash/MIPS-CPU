module Mux(out,value1,value2,sel);

input sel ,value1,value2;
output out; 
reg out;
	
always @(sel) begin
	if(sel==0) begin
		  out=value1;			   
	end
	else if(sel==1) begin
		out=value2;
	end
end

endmodule



	
	
	
	


	