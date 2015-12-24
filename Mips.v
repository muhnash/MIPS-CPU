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
wire address,forced_instruction;  // for program counter 
wire instruction;   // for instruction memory														  
wire opcode, Rs, Rt, Rd ,shmt, func, immediate, target;// instruction decoder
wire read_data1,read_data2, RegWrite,read_reg1, read_reg2, write_reg, write_data; // for register file
wire RegDst, Jump , Branch, MemRead, MemrtoReg, ALUop, MemWrite, ALUsrc; // control unit
wire in1,in2,control_in,out,ZERO; // ALU 
 
	
// Modules instantiation 
ProgramCounter(address,forced_instruction, clock);

InstructionMemory(instruction,address,clock);

InstructionDecoder(opcode, Rs, Rt, Rd ,shmt, func, immediate, target, instruction);

RegisterFile(read_data1,read_data2, RegWrite,read_reg1, read_reg2, write_reg, write_data, clock);

ControlUnit(RegDst, Jump , Branch, MemRead, MemrtoReg, ALUop, MemWrite, ALUsrc, RegWrite, op_code);

ALU(in1,in2,control_in,out,ZERO); 



endmodule