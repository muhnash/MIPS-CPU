module ALU(in1,in2,control_in,out,ZERO);
	//in1: Rs input
	//in2: Rt input
	//control_in: 5-bit to choose between the ALU operations
	//out: Rd or Rt output
	//ZERO: is equal one when it's true
	
	//******************************************************
	//ALL ALU operations are buit-in it EXCEPT Sign_Extender
	//******************************************************
	
	
	
	input in1[31:0],in2[31:0],control_in[3:0];
	output out[31:0],ZERO;
	reg [31:0]out,ZERO;
	
	
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
			
			if(control_in==4'b1000)begin //  beq  OPERATION
				if(in1-in2==0) ZERO=1;
				else ZERO=0;			  
			end
			
			if(control_in==4'b1001)begin //   jal  OPERATION
				
					//DO NOTHING
			end
			if(control_in==4'b1010)begin //   jr   OPERATION
					//DO NOTHING
				
			end
			if(control_in==4'b1011)begin //   slt  OPERATION
				if(in1<in2) out=1;
				else out=0;
			end
	
	
		end

endmodule 











