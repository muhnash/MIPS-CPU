module sign_extend(in,out);
	input in [15:0];
	output out[31:0];
	reg [31:0]out;
	always @(in) begin
	 out=0'b0000_0000_0000_0000 + in;
	end
	
	
endmodule
	  