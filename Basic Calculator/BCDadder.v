module BCDadder(Sum,Cout,A,B,Cin);
    input [3:0]A,B; input Cin;
    output [3:0]Sum; output Cout;

    wire w1,w2,w3,w4;
    wire [3:0]O;
    wire [1:0]C;

    //Logic gates
    nand G1(w1,O[3],O[2]),G2(w2,O[3],O[1]),G3(w3,w1,w2);
    nor G4(w4,w3,C[0]);
    not G5(w5,w4);
    buf G6(Cout,w5);

    //module adder4bit(Sum,Cout,A,B,Cin);
    adder4bit A4b1(O[3:0],C[0],A[3:0],B[3:0],Cin);
    adder4bit A4b2(Sum[3:0],C[1],O[3:0],{1'b0,w5,w5,1'b0},1'b0);
endmodule