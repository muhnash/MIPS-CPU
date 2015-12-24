module Adder(out , in1 , in2);
input in1[31:0],in2[31:0];
output out[31:0];

assign out = in1 +in2;

endmodule 