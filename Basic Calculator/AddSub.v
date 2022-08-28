module AddSub(Out,Cout,Asign,A,Bsign,B,Cin);
    input Cin,Asign,Bsign; output Cout;
    input [3:0]A,B; output [3:0]Out;

    wire w1,w2,w3,w4;
    wire [3:0]Adash,Bdash;

    //Logic gates
    not G1(w1,Asign),G2(w2,Bsign);
    nor G3(w3,w1,Bsign),G4(w4,w2,Asign);

    //module ninesComplement(Abar,A,sel);
    ninesComplement NC1(Adash[3:0],A[3:0],w3);
    ninesComplement NC2(Bdash[3:0],B[3:0],w4);

    //module BCDadder(Sum,Cout,A,B,Cin);
    BCDadder BCD(Out[3:0],Cout,Adash[3:0],Bdash[3:0],Cin);
endmodule