module Sign_Extend(in,out);
	input [15:0]in ;
	output [31:0]out;
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
	  