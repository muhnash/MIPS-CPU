module Alu_Control(in1,in2,out);
	
	//in1: 6-bit OP-CODE  
	//in2: 6-bit FUNCTION
	//out: 4-bit OUTPUT
	
	input in1[5:0],in2[5:0];
	output out[3:0];
	reg [3:0] out;
	
	
	always @(in1 or in2)begin
	
		
	//********************	
	//I and J INSTRUCTIONS
	//********************
	 if(in1==6'b001000) begin out=4'b0000;	 end       //addi
	 if(in1==6'b100011) begin out=4'b0010;	 end	   //lw
	 if(in1==6'b101011) begin out=4'b0011;	 end	   //sw
	 if(in1==6'b001100) begin out=4'b0110;	 end	   //andi
	 if(in1==6'b000100) begin out=4'b1000;	 end	   //beq
	 if(in1==6'b000011) begin out=4'b1001;	 end	   //jal
	 
	
		 
	 //*****************
	 //	R INSTRUCTIONS 
	 //*****************
	 if(in1==6'b000000 || in2==6'b100000) begin out=4'b0000;  end	      //add
	 if(in1==6'b000000 || in2==6'b000000) begin out=4'b0100;  end	      //sll
	 if(in1==6'b000000 || in2==6'b100100) begin out=4'b0101;  end	 	  //and
	 if(in1==6'b000000 || in2==6'b100111) begin out=4'b0111;  end		  //nor
	 if(in1==6'b000000 || in2==6'b001000) begin out=4'b1010;  end		  //jr
     if(in1==6'b000000 || in2==6'b101010) begin out=4'b1011;  end		  //slt
	 end
	
	
	
endmodule
