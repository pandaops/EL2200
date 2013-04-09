module mux(select, d, q);
input[1:0] select;
input[3:0] d;
output q;

assign q = d[select];

endmodule


