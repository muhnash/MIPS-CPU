//for decoding the instruction coming out of the instruction memory
// output is then fed to control unit & register file

//  * R format ;  [opcode [31:26]\ Rs [25:21]\ Rt [20:16]\ Rd [15:11]\ shmt [10:6]\ func[5:0]]
//------------------------------------------------------------------------
//	* I format ;  [opcode [31:26]\ Rs [25:21]\ Rt [20:16]\ immediate [15:0]] 
//------------------------------------------------------------------------
//  * J format ;  [opcode [31:26]\ target [25:0] ]
//------------------------------------------------------------------------

module InstructionDecoder(opcode, Rs, Rt, Rd ,shmt, func, immediate, target, instruction);
	input [31:0]instruction;
	output [5:0]opcode;
	output [4:0]Rs;
	output [4:0]Rt;
	output [4:0]Rd;
	output [4:0]shmt;
	output [5:0]func;
	output [15:0]immediate;
	output [25:0]target;
	
	assign  	  opcode = instruction[31:26],
			      Rs = instruction[25:21],
				  Rt = instruction[20:16],
				  Rd = instruction[15:11],
				  shmt = instruction[10:6],
				  func = instruction[5:0],
				  immediate = instruction[15:0],
				  target = instruction[25:0];
endmodule