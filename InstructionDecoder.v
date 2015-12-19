//for decoding the instruction coming out of the instruction memory
// output is then fed to control unit & register file

//  * R format ;  [opcode [31:26]\ Rs [25:21]\ Rt [20:16]\ Rd [15:11]\ shmt [10:6]\ func[5:0]]
//------------------------------------------------------------------------
//	* I format ;  [opcode [31:26]\ Rs [25:21]\ Rt [20:16]\ immediate [15:0]] 
//------------------------------------------------------------------------
//  * J format ;  [opcode [31:26]\ target [25:0] ]
//------------------------------------------------------------------------

module InstructionDecoder(opcode, Rs, Rt, Rd ,shmt, func, immediate, target, instruction);
	input instruction[31:0];
	output opcode[5:0], Rs[4:0], Rt[4:0], Rd[4:0] ,shmt[4:0], func[5:0], immediate[15:0], target[25:0];
	
	assign #1 	  opcode = instruction[31:26],
			      Rs = instruction[25:21],
				  Rt = instruction[20:16],
				  Rd = instruction[15:11],
				  shmt = instruction[10:6],
				  func = instruction[5:0],
				  immediate = instruction[15:0],
				  target = instruction[25:0];
endmodule