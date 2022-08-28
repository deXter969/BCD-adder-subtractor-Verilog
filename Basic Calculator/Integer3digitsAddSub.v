module Integer3digitsAddSub(Out,Sign,Cout,Mode,Asign,Bsign,A,B);
    input Mode,Asign,Bsign; input [11:0]A,B;
    output Sign,Cout; output [11:0]Out;

    wire w1,w4,w8,w11,w2,w5,w12,w3,w7,w6,w10,w9,w15;
    wire [5:0]C;
    wire [11:0]O1,O2;

    //Logic gates
    not G1(w1,Asign),G4(w4,w3),G8(w8,w7),G11(w11,w10),G15(w15,C[2]);
    nor G2(w2,w1,w3),G5(w5,Asign,w4),G12(w12,C[2],w8),G14(Cout,w9,w7);
    xor G3(w3,Mode,Bsign),G7(w7,Asign,w3);
    nand G6(w6,Asign,w3),G10(w10,w7,C[2]),G13(Sign,w6,w16),G16(w16,w15,w6);
    xnor G9(w9,C[2],C[5]);
    
    //module AddSub(Out,Cout,Asign,A,Bsign,B,Cin);
    AddSub AD0(O1[3:0],C[0],w2,A[3:0],w5,B[3:0],1'b0);
    AddSub AD1(O1[7:4],C[1],w2,A[7:4],w5,B[7:4],C[0]);
    AddSub AD2(O1[11:8],C[2],w2,A[11:8],w5,B[11:8],C[1]);

    //module BCDadder(Sum,Cout,A,B,Cin);
    BCDadder BCD0(O2[3:0],C[3],O1[3:0],4'b0000,w11);
    BCDadder BCD1(O2[7:4],C[4],O1[7:4],4'b0000,C[3]);
    BCDadder BCD2(O2[11:8],C[5],O1[11:8],4'b0000,C[4]);

    //module ninesComplement(Abar,A,sel);
    ninesComplement NC0(Out[3:0],O2[3:0],w12);
    ninesComplement NC1(Out[7:4],O2[7:4],w12);
    ninesComplement NC2(Out[11:8],O2[11:8],w12);
endmodule