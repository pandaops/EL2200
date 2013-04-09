// Half adder module
module half_adder(a, b, s, c);
input a,b;
output s,c;
xor x1(s,a,b);
and a1(c,a,b);
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

module multiplier(P,X,Y);
output [7:0]P;
input [3:0]X;
input [3:0]Y;
wire x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17;
wire D01,D02,D03,D10,D11,D12,D13,D20,D21,D22,D23,D30,D31,D32,D33;

and(P[0],X[0],Y[0]);
and(D01,X[0],Y[1]);
and(D02,X[0],Y[2]);
and(D03,X[0],Y[3]);
and(D10,X[1],Y[0]);
and(D11,X[1],Y[1]);
and(D12,X[1],Y[2]);
and(D13,X[1],Y[3]);
and(D20,X[2],Y[0]);
and(D21,X[2],Y[1]);
and(D22,X[2],Y[2]);
and(D23,X[2],Y[3]);
and(D30,X[3],Y[0]);
and(D31,X[3],Y[1]);
and(D32,X[3],Y[2]);
and(D33,X[3],Y[3]);

half_adder ha1(D10,D01,P[1],x1);
full_adder fa1(D11,D02,x1,x2,x3);
full_adder fa2(D12,D03,x3,x4,x5);
half_adder ha2(D13,x5,x6,x7);
half_adder ha3(x2,D20,P[2],x15);
full_adder fa3(x4,D21,x15,x14,x16);
full_adder fa4(x6,D22,x16,x13,x17);
full_adder fa5(x7,D23,x17,x9,x8);
half_adder ha4(x14,D30,P[3],x12);
full_adder fa6(x13,D31,x12,P[4],x11);
full_adder fa7(x9,D32,x11,P[5],x10);
full_adder fa8(x8,D33,x10,P[6],P[7]);

endmodule

