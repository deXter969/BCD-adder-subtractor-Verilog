module AddSub(S,Cout,A,B,Asign,Bsign,Cin);
    input [3:0]A,B; 
    input Asign,Bsign,Cin; 
    output [3:0]S; 
    output Cout;
    wire Abar,Bbar,w1,w2;
    wire [3:0]Adash,Bdash;
    
    not G1(Abar,Asign),G2(Bbar,Bsign);
    nor G3(w1,Asign,Bbar),G4(w2,Abar,Bsign);

    //nines_comp(B,M,Bcomp);
    nines_comp C1 (A[3:0],w2,Adash[3:0]);
    nines_comp C2(B[3:0],w1,Bdash[3:0]);
    //bcd_add(A,B,Cin,Sum,Cout);
    bcd_add Add (Adash[3:0],Bdash[3:0],Cin,S[3:0],Cout);

endmodule