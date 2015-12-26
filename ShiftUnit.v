module ShiftLeft2(out, in);
input [31:0]in;
output [31:0]out;

assign out=in<<2;

endmodule



module ShiftLeft2_26bits(out, in);
input [25:0]in;
output [25:0]out;

assign out=in<<2;

endmodule
