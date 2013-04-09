// Half adder module
module half_adder(a, b, s, c);
input a,b;
output s,c;
assign s=a^b;
assign c=a&b;
endmodule

// Full adder module
module full_adder(A,B,I,S,O);
input A,B,I;
output S,O;
wire s1,c1,c2;
half_adder HA1(A,B,s1,c1);
half_adder HA2(s1,I,S,c2);
or OG1(O,c1,c2);
endmodule

// Four-bit adder
module four_bit_adder(A,B,Cin,S,Cout);
input [3:0]A, B;
input Cin;
output [3:0]S;
output Cout;
wire C1,C2,C3;
full_adder FA1(A[0],B[0],Cin,S[0],C1);
full_adder FA2(A[1],B[1],C1,S[1],C2);
full_adder FA3(A[2],B[2],C2,S[2],C3);
full_adder FA4(A[3],B[3],C3,S[3],Cout);
endmodule


