//Half adder test bench
`timescale 1ns / 100ps
module test; //test bench module
wire out;
reg [1:0]A;
reg [3:0]B; 
mux DUT(A,B,out); //instantiate the device under test (half adder)
initial
begin
$dumpfile("mux_data.vcd");
$dumpvars(0,DUT);
end
initial begin
//$timeformat(-9, 1, " ns", 6);
B = 4'd1;  A=2'd0; 
#10 B = 4'd2; A=2'd1;
#10 B = 4'd5; A=2'd2;
#10 B = 4'd7; A=2'd3;
#10 B = 4'd8; A=2'd3;
#10;
end
always @(A or B)
#5 $display("%d Data=%b Select=%b Output=%b",$time, B,A,out);
endmodule

