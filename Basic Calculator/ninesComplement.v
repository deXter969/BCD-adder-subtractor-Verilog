module ninesComplement(Abar,A,sel);
    input sel; input [3:0]A;
    output [3:0]Abar;

    wire w1,w2,w3,w5,w6,w8,w9;

    not G1(w1,sel),G5(w5,A[1]);
    nor G2(w2,w1,A[3]),G6(w6,w1,w5),G8(w8,A[2],A[1]);
    nand G3(w3,w1,A[3]),G4(Abar[3],w3,w9),G9(w9,w2,w8);
    xor G7(Abar[2],A[2],w6),G10(Abar[0],sel,A[0]);
    buf G11(Abar[1],A[1]);


endmodule