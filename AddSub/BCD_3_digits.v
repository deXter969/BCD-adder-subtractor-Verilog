module BCD_3_digits(S,sign,Cout,A,B,Asign,Bsign,M);
    output [11:0]S; output sign,Cout; input [11:0]A,B; input Asign,Bsign,M;
    
    wire w1,w2,w4,w5,w6,w7,w9,w10,w11,w12,w13,w14,w15,L,E,G,C0,C1,C2,C3,C4,C5,s;
    wire [11:0]O;

    nand G1(w1,Asign,G),G2(w2,w11,w12),G3(sign,w2,w1);
    nor G4(w4,Asign,L),G5(w5,w13,w11),G6(w6,Asign,w9),G7(Cout,w10,w14),G8(w8,w15,C2);
    xnor G9(w9,Bsign,M);
    xor G10(w10,Asign,w11),G11(w11,Bsign,M);
    not G12(w12,w4),G13(w13,Asign),G14(w14,C2),G15(w15,w10);

    // AddSub(S,Cout,A,B,Asign,Bsign,Cin)
    AddSub M0(O[3:0],C0,A[3:0],B[3:0],w5,w6,1'b0);
    AddSub M1(O[7:4],C1,A[7:4],B[7:4],w5,w6,C0);
    AddSub M2(O[11:8],C2,A[11:8],B[11:8],w5,w6,C1);

    //add_sub_1digit (result,c_out,sign,a,b,m,cin)
    add_sub_1digit Mo0(S[3:0],C3,s,{1'b0,w8,2'b00,w8},{w8,O[3:0]},1'b0,1'b0);
    add_sub_1digit Mo1(S[7:4],C4,s,{1'b0,w8,2'b00,w8},{w8,O[7:4]},1'b0,C3);
    add_sub_1digit Mo2(S[11:8],C5,s,{1'b0,w8,2'b00,w8},{w8,O[11:8]},1'b0,C4);

    //comparator_12_bit_struct(A,B,L,E,G)
    comparator_12_bit_struct comp(A[11:0],B[11:0],L,E,G);

endmodule