module MUX_2x1(out,value1,value2,sel);
input sel;
input [31:0]value1;
input [31:0]value2;
output [31:0]out; 
reg [31:0]out;



	
always @(sel or value1 or value2 )	
	begin
	if(sel==1'b0)  out=value1;			   
	else if(sel==1'b1) out=value2;
end

endmodule



	