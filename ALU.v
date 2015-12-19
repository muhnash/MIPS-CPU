module adde(in1,in2,control_in,out);
	input in1[31:0],in2[31:0],control_in[3:0];
	output out[31:0];
	reg [31:0]out;
	wire w1;
	
	always @(in1 or in2 or control_in)
		begin 
	
			if(control_in==4'b0000)begin   // ADD OPERATION
			 out=in1+in2;
			end	
			
			if(control_in==4'b0001)begin  // ADDI OPERATION
			   
			   out=in1+in2;
			end
			
			if(control_in==4'b0010)begin  // LW OPERATION
				out=in1+in2;
			end
			
			if(control_in==4'b0011)begin  // SW OPERATION
				out=in1+in2;
			end
			
			if(control_in==4'b0100)begin  // S11 OPERATION
						 out=in1*2*in2;
			end
			
			if(control_in==4'b0101)begin  // AND OPERATION
				
				out=in1 & in2;
			end
			
			if(control_in==4'b0110)begin  // ANDI OPERATION
				
			    out=in1 & in2;
			end
			
			if(control_in==4'b0111)begin // NOR OPERATION
				
				out=~(in1 | in2);
			end
	
	
	
		end

endmodule 












