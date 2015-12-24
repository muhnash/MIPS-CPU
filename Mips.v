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
wire address[31:0],forced_instruction[31:0];  // for program counter 
wire instruction[31:0];   // for instruction memory														  
wire opcode[5:0], Rs[4:0], Rt[4:0], Rd[4:0] ,shmt[4:0], func[5:0], immediate[15:0], target[25:0];// instruction decoder
wire read_data1[31:0],read_data2[31:0], RegWrite,read_reg1[4:0], read_reg2[4:0], write_reg[4:0], write_data[31:0]; // for register file
wire RegDst, Jump , Branch, MemRead, MemrtoReg, ALUop[1:0], MemWrite, ALUsrc; // control unit
wire in1[31:0],in2[31:0],ALU_operation[3:0],ALU_out[31:0],ZERO; // ALU 
wire data_out[31:0]; // output of data memory

/*
	CLOCK MODELING GOES HERE
*/	
	
// Modules instantiation 
ProgramCounter PC (address,forced_instruction, clock);

InstructionMemory inst_memory(instruction,address,clock);

InstructionDecoder inst_decoder (opcode, Rs, Rt, Rd ,shmt, func, immediate, target, instruction);

wire mux1_out;
wire mux2_out;
wire mux3_out;
wire mux4_out;
wire mux5_out;

Mux mux1(mux1_out,Rt,Rd,RegDst);
RegisterFile(read_data1,read_data2,RegWrite, Rs , Rt, mux1_out, mux3_out , clock);

ControlUnit cont_unit(RegDst, Jump , Branch, MemRead, MemrtoReg, ALUop, MemWrite, ALUsrc, RegWrite, opcode);

Sign_Extend(immediate,imm_32);  // input 16 bit immediate , output imm_32 32 bits
Mux mux2(mux2_out,read_data2,imm_32,ALUsrc);

 
Alu_Control (ALU_operation, func , ALUop);
ALU main_alu(read_data1,mux2_out,ALU_operation,ALU_out,ZERO);

DataMemory data_memory(data_out ,ALU_out,read_data2 ,MemRead,MemWrite,clock);

Mux mux3(mux3_out,data_out,ALU_out,MemrtoReg);




endmodule