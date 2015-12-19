module MUX(in1,value1,value2,out);
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


module mux(a,b,c,d,sel,y);
	input a,b,c,d;
	input[1:0] sel;
	output y;
	reg y;
	always @(a or b or c or d or sel)
		case(sel)
			0:y=a;
			1:y=b;
			2:y=c;
			3:y=d;
			default: $display("ERROE IN SEL");
		endcase
	endmodule
	
	
	
	


	