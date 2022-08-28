module comparator_12_bit_struct(A,B,L,E,G);

    // Inputs
    input[11:0] A;
    input[11:0] B;

    wire [3:0]x2 = A[11:8], x1 = A[7:4], x0 = A[3:0];
    wire [3:0]y2 = B[11:8], y1 = B[7:4], y0 = B[3:0];

    //Outputs
    output L,E,G;

    // Internal Nets
    wire L0,L1,L2,E0,E1,E2,G0,G1,G2;
    wire t1,t2,t3;
    wire n1;
    wire m1,m2,m3;

    comparator_struct bcd2 (x2,y2,L2,E2,G2);
    comparator_struct bcd1 (x1,y1,L1,E1,G1);
    comparator_struct bcd0 (x0,y0,L0,E0,G0);

    not  p1 (t1,L2);
    nand p2 (t2,E2,L1);
    nand p3 (t3,E2,E1,L0);
    nand p4 (L,t1,t2,t3);

    nand q1 (n1,E2,E1,E0);
    not  q2 (E,n1);

    not  r1 (m1,G2);
    nand r2 (m2,E2,G1);
    nand r3 (m3,E2,E1,G0);
    nand r4 (G,m1,m2,m3);

endmodule
