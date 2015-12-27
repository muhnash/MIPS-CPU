ProgramCounter(inst_address, next_inst_address, clock); 

InstructionMemory(instruction, inst_address , clock);

InstructionDecoder(opcode, Rs, Rt, Rd ,shmt, func, immediate, target, instruction);

RegisterFile(read_data1, read_data2, RegWrite, read_reg1, read_reg2, write_reg, write_data,clock);

ControlUnit(RegDst, Jump , Branch, MemRead, MemrtoReg, ALUop, MemWrite, ALUsrc, RegWrite, op_code);

ALUcontrol(alu_operation , func , ALUop);

ALU(out,ZERO,in1,in2,alu_operation);

DataMemory(read_data ,address_in ,write_data ,MemRead,MemWrite,clock);

Sign_Extend(in,out);

MUX_3x1(out,value1,value2,value3,sel);

MUX_3x1_5bits(out,value1,value2,value3,sel);

MUX_2x1(out,value1,value2,sel);

ShiftLeft2(out, in);

ShiftLeft2_26bits(out, in);

Adder_4 (out, instruction_address);

Adder(out , in1 , in2);
