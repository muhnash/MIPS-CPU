module ControlUnit(RegDst, Jump , Branch, MemRead, MemrtoReg, ALUop, MemWrite, ALUsrc, RegWrite, op_code);
	
	input  op_code[5:0]; 
	output RegDst, Jump, Branch, MemRead, MemrtoReg, ALUop, MemWrite, ALUsrc,RegWrite;
		   
	reg RegDst, Jump, Branch, MemRead, MemrtoReg,MemWrite, ALUsrc,RegWrite;   
	reg [1:0]ALUop;
	
	always @ (op_code)
		begin	
			case (op_code)
				6'b000000 : begin
						RegDst<=1'b1;	  // R-Format instructions [add , and , nor, jr,slt,sll]
		   				Jump<=1'b0;
		   				Branch<=1'b0;
		   				MemRead<=1'b0;
		   				MemrtoReg<=1'b0;
	       				ALUop<=2'b100;
   						MemWrite<=1'b0;
		   				ALUsrc<=1'b0;
		   				RegWrite<=1'b1;
					    end
					 
				6'b001000 : begin
						RegDst<=1'b0;	  // Addi (I format)
		   				Jump<=1'b0;
						Branch<=1'b0;
	  					MemRead<=1'b0;
		   				MemrtoReg<=1'b0;
	       				ALUop<=2'b00;
		   				MemWrite<=1'b0;
		   				ALUsrc<=1'b0;
		   				RegWrite<=1'b0;
		       			    end
				
				6'b100011 : begin
						RegDst<=1'b0;	  // lw (I format)
		   				Jump<=1'b0;
		   				Branch<=1'b0;
		   				MemRead<=1'b1;
		   				MemrtoReg<=1'b1;
	       				ALUop<=2'b00;
		   				MemWrite<=1'b0;
		   				ALUsrc<=1'b1;
		   				RegWrite<=1'b1;
					    end
					
			   	6'b101011 : begin	
				   		RegDst<=;	  // sw (I format)
		   				Jump<=;
		   				Branch<=;
		   				MemRead<=;
		   				MemrtoReg<=;
	       				ALUop<=;
		   				MemWrite<=;
						ALUsrc<=;
		   				RegWrite<=;
		   			    end
				   
				6'b001100 : begin	
						RegDst<=;	  // andi (I format)
		   				Jump<=;
		   				Branch<=;
		   				MemRead<=;
		   				MemrtoReg<=;
	       				ALUop<=;
		   				MemWrite<=;
		   				ALUsrc<=;
		   				RegWrite<=;
				  	    end
				
				6'b000100 : begin
						RegDst<=;	  // beq (I format)
		   				Jump<=;
		   				Branch<=;
		   				MemRead<=;
		   				MemrtoReg<=;
	       					ALUop<=;
		   				MemWrite<=;
		   				ALUsrc<=;
		   				RegWrite<=;
				    	    end
				
				6'b000011 : begin
						RegDst<=;	  // jal (J format)
		   				Jump<=;
		   				Branch<=;
		   				MemRead<=;
		   				MemrtoReg<=;
	       					ALUop<=;
		   				MemWrite<=;
		   				ALUsrc<=;
		   				RegWrite<=;
					    end 
			endcase
			
		end
endmodule

/* 	References
	==========
	# For Control signals or more datapath details ---> Textbook : Computer organization and design 5th ed 
	
	# For instructions OPCODE/FUNC/FORMAT
		WIKIPERIA ---> https://www.wikiwand.com/en/MIPS_instruction_set
	-----------------------------------------------------------------
	add , and , nor , jr , slt , sll  [R-Format] i.e OPCODE=0
	[opcodes in base 16] 
	addi   	8	
	lw 	 	 23
	sw	  2B
	andi  B
	beq	   4
	jal		3
	
*/	
		
