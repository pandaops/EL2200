//Half adder test bench
`timescale 1ns / 100ps
module test; //test bench module
wire [3:0]S; //outputs from 4-bit adder
wire Cout;
reg [3:0]A, B;
reg Cin; 
four_bit_adder DUT(A,B,Cin,S,Cout); //instantiate the device under test (half adder)
initial
begin
$dumpfile("adder_data.vcd");
$dumpvars(0,DUT);
end
initial begin
//$timeformat(-9, 1, " ns", 6);
A = 4'd0; B = 4'd0; Cin=0;
#10 A = 4'd7; B=4'd2;
#10 A = 4'd5; B=4'd8;
#10 A = 4'd9; B=4'd11;
#10 A = 4'd2; B=4'd2;Cin=1;
#10;
end
always @(A or B)
#5 $display("%d A=%b B=%b S=%b",$time, A,B,S);
endmodule

