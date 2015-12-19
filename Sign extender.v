module Sign_Extend(in,out);
   	
 	//in : 16-bit input 
	//out: 32-bit output
	input in [15:0];
	output out[31:0];
	reg [31:0]out;
	always @(in) begin
	 out=0'b0000_0000_0000_0000 + in;
	end
	
	
endmodule
	  