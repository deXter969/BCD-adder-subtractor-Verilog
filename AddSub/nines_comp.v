// BCD 9's Complementer

module nines_comp(B,M,Bcomp);
input [3:0] B;
input M;                // M is for Mode Select
output [3:0] Bcomp;
assign Bcomp[3] = (((~B[3]) & (~B[2]) & (~B[1])) & M) + (B[3] & (~M));
assign Bcomp[2] = ((B[2]^B[1]) & M) + (B[2] & (~M));
assign Bcomp[1] = B[1];
assign Bcomp[0] = ((~B[0]) & M) + (B[0] & (~M));
endmodule