module Adder(out , in1 , in2);
input [31:0]in1;
input [31:0]in2;
output [31:0]out;

assign out = in1 +in2;

endmodule 