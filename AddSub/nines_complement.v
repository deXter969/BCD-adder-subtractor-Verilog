module nines_complement(B,M,Bcomp);
input [3:0] B;
input M;                // M is for Mode Select
output [3:0] Bcomp;
wire w1,w2,w3,w4,w5,D;
wire t1,t2,t3,t4;

// For Bcomp[3]
assign D=1;
nand(w1,M,D);
nand(w2,w1,B[3]);
nor(w3,w1,B[1]);
nor(w4,B[2],B[3]);
nand(w5,w3,w4);
nand(Bcomp[3],w2,w5);

// For Bcomp[2]
xor(t1,B[2],B[1]);
nand(t2,t1,M);
not(t3,M);
nand(t4,B[2],t3);
nand(Bcomp[2],t2,t4);

// For Bcomp[1]
assign Bcomp[1] = B[1];

// For Bcomp[0]
xor(Bcomp[0],B[0],M);

endmodule
