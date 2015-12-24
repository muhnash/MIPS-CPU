module MUX_3x1(sel,value1,value2,value3,out);
	
	//#############################
	// sel:2-bit input choose signal
	// value1: first value
	// value2: second value
	// value3: third value
	// out:output
	
	
	
	
	input sel[1:0],value1,value2,value3;
	output out;
	reg out;
	
	always @(sel) begin
		if(sel==2'b00)begin
			out=value1;
		end
		if(sel==2'b01)begin
			out=value2;
		end
		if(sel==2'b10)begin
			out=value3;
		end
		
		
	end
	
	
endmodule
