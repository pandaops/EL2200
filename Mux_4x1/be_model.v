module mux(select, d, q);
input[1:0] select;
input[3:0] d;
output reg q;

always @(d or select)
begin
q <= d[select];
end
endmodule
