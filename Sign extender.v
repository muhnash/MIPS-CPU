module Sign_Extend(in,out);
   	
 	//in : 16-bit input 
	//out: 32-bit output
	input in [15:0];
	output out[31:0];
	reg [31:0]out;
	always @(in) begin
		if(in[15]==0)begin
			out=16'b0000_0000_0000_0000 + in;
		end	
	else begin
		    out[31:16]=16'b1111_1111_1111_1111;
			out[15:0]=in;
	    end	
		
	
	
	 
	end
	
	
endmodule
	  