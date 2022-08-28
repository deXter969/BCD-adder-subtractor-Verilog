module FAdd(A,B,Cin,S,Cout);
input A,B,Cin;
output S,Cout;
wire S1,C1,C2;
xor(S1,A,B);
xor(S,S1,Cin);
nand(C1,S1,Cin);
nand(C2,A,B);
nand(Cout,C1,C2);
endmodule