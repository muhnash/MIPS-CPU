module Mux(in1,value1,value2,out);
// in1:first input signal
// in2:second input signal
// value1:first value to select
// value2:second value to selsect
//out:MUX output
	
	
wire in1,value1,value2 ;
input in1,value1,value2;
output out; 
reg out;
	
always @(in1) begin
	if(in1==0) begin
		  out=value1;			   
	end
	else if(in1==1) begin
		out=value2;
	end
end

endmodule



	
	
	
	


	