module ControlUnit(RegDst, Jump , Branch, MemRead, MemrtoReg, ALUop, MemWrite, ALUsrc, RegWrite, op_code);
	//JR & Jal are NOT SUPPORTED				
	input  [5:0]op_code; 
	
	output [1:0]RegDst;
	output Jump, Branch, MemRead, MemWrite, ALUsrc,RegWrite;
	output [1:0]MemrtoReg;
	output [1:0]ALUop;

	reg [1:0]RegDst;
	reg Jump;   
	reg [1:0]MemrtoReg;
	reg [1:0]ALUop;
	reg Branch,MemRead,MemWrite,ALUsrc,RegWrite;
	
	always @ (op_code)
		begin	
			case (op_code)  
				6'b000000 : begin #5   // R-Format instructions [add , and , nor, jr,slt,sll]
						RegDst<=2'b01;	  
		   				Jump<=1'b0;
		   				Branch<=1'b0;
		   				MemRead<=1'b0;
		   				MemrtoReg<=2'b00;
	       				ALUop<=2'b10;
   						MemWrite<=1'b0;
		   				ALUsrc<=1'b0;
		   				RegWrite<=1'b1;
					    end
					 
				6'b001000 : begin #5
						RegDst<=2'b00;	  // Addi (I format)
		   				Jump<=2'b00;
						Branch<=1'b0;
	  					MemRead<=1'b0;
		   				MemrtoReg<=2'b00;
	       				ALUop<=2'b00;
		   				MemWrite<=1'b0;
		   				ALUsrc<=1'b1;
		   				RegWrite<=1'b1;
		       			    end
				
				6'b100011 : begin  #5
						RegDst<=2'b00;	  // lw (I format)
		   				Jump<=2'b00;
		   				Branch<=1'b0;
		   				MemRead<=1'b1;
		   				MemrtoReg<=2'b01;
	       				ALUop<=2'b00;
		   				MemWrite<=1'b0;
		   				ALUsrc<=1'b1;
		   				RegWrite<=1'b1;
					    end
					
	 		   	6'b101011 : begin	#5
				   		RegDst<=2'bxx;	  // sw (I format)
		   				Jump<=2'b00;
		   				Branch<=1'b0;
		   				MemRead<=1'b0;
		   				MemrtoReg<=2'bxx;
	       				ALUop<=2'b00;
		   				MemWrite<=1'b1;
		   				ALUsrc<=1'b1;
		   				RegWrite<=1'b0;
		   			    end
				   
				6'b001100 : begin	 #5
						RegDst<=2'b00;	  // andi (I format)
		   				Jump<=2'b00;
		   				Branch<=1'b0;
		   				MemRead<=1'b0;
		   				MemrtoReg<=2'b00;
	       				ALUop<=2'b10;
		   				MemWrite<=1'b0;
		   				ALUsrc<=1'b1;
		   				RegWrite<=1'b1;
				  	    end
				
				6'b000100 : begin	   #5
						RegDst<=2'bxx;	  // beq (I format)
		   				Jump<=2'b00;
		   				Branch<=1'b1;
		   				MemRead<=1'b0;
		   				MemrtoReg<=2'bxx;
	       				ALUop<=2'b01;
		   				MemWrite<=1'b0;
		   				ALUsrc<=1'b0;
		   				RegWrite<=1'b0;
				    	    end
				
				6'b000011 : begin		#5
						RegDst<=2'b10;	  // jal (J format)
		   				Jump<=2'b01;
		   				Branch<=1'bx;
		   				MemRead<=1'b0;
		   				MemrtoReg<=2'b10;
	       				ALUop<=2'bxx;
		   				MemWrite<=1'b0;
		   				ALUsrc<=1'bx;
		   				RegWrite<=1'b1;
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
		
