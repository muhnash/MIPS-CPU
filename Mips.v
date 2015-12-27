module MIPS();
/*
[CSE311 Final Project]
[Main Module]
	
#1 ) Single cycle Implementation: (Lecture 1 > slide #20)
=========================================================
	Instruction Set Supported:
	==========================
		• Arithmetic: add, addi	  
		• Load/Store: lw, sw
		• Logic: sll, and, andi, nor
		• Control flow: beq, jal, jr
		• Comparison: slt

*/	   
// wires declarations
wire clock;	 
wire [31:0]inst_address;  // for program counter 
wire [31:0]instruction;   // for instruction memory														  

wire [5:0]opcode; // instruction decoder
wire [4:0]Rs;
wire [4:0]Rt;
wire [4:0]Rd;
wire [4:0]shmt;
wire [5:0]func;
wire [15:0]immediate;
wire [25:0]target;

wire [31:0]read_data1; // Register file
wire [31:0]read_data2;
wire RegWrite;


wire [1:0]RegDst; // control unit
wire Jump;
wire Branch;
wire MemRead;
wire [1:0]MemrtoReg;
wire [1:0]ALUop;
wire MemWrite;
wire ALUsrc; 

wire [3:0]ALU_operation; //ALU
wire [31:0]ALU_out;
wire ZERO; 

wire [31:0]data_out; // output of data memory

wire [4:0]mux1_out;  //mux's
wire [31:0]mux2_out;
wire [31:0]mux3_out;
wire [31:0]mux4_out;
wire [31:0]mux5_out;

wire [4:0]reg_31=5'b11111;
wire [31:0]imm_32;
wire [31:0]address_plus4;
wire [31:0]adder2_result;
wire [31:0]shift2_out;
wire branch_control= ZERO && Branch; //logical AND
wire [25:0]shift1_out;
wire [31:0]jump_address = {address_plus4[31:28],shift1_out,2'b00}; // bits concatenation

/*
	CLOCK MODELING GOES HERE
*/	
	

// Modules instantiation 
ProgramCounter PC (inst_address,mux5_out, clock);

InstructionMemory inst_memory(instruction,inst_address,clock);

InstructionDecoder inst_decoder (opcode, Rs, Rt, Rd ,shmt, func, immediate, target, instruction);

RegisterFile  reg_file (read_data1,read_data2,RegWrite, Rs , Rt, mux1_out, mux3_out , clock);

ControlUnit cont_unit(RegDst, Jump , Branch, MemRead, MemrtoReg, ALUop, MemWrite, ALUsrc, RegWrite, opcode);

ALUcontrol ALUCont (ALU_operation, func , ALUop);

ALU main_alu(ALU_out,ZERO,read_data1,mux2_out,ALU_operation,shmt);

DataMemory data_memory(data_out,ALU_out,read_data2,MemRead,MemWrite,clock);

Sign_Extend sign_ext(immediate,imm_32);  // input 16 bit immediate , output imm_32 32 bits

MUX_3x1_5bits mux1(mux1_out,Rt,Rd,reg_31,RegDst);

MUX_2x1 mux2(mux2_out,read_data2,imm_32,ALUsrc);

MUX_3x1 mux3(mux3_out,ALU_out,data_out,address_plus4,MemrtoReg);

MUX_2x1 mux4(mux4_out,address_plus4,adder2_result,branch_control);

MUX_2x1 mux5(mux5_out,mux4_out,jump_address,Jump);

ShiftLeft2_26bits sh_unit1(shift1_out, target);  // shift_out is 26 bits wide

ShiftLeft2 sh_unit2 (shift2_out , imm_32);

Adder adder2(adder2_result, address_plus4 , shift2_out);  

Adder_4  adder1(address_plus4, inst_address);

// jump_address is (4 higher bits from address+4 )+(26bit shifted left) + (2 lower bits "00")
endmodule 