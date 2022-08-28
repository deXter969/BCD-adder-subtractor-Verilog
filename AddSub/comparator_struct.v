module comparator_struct(x,y,L,E,G);

    // Inputs
    input[3:0] x;
    input[3:0] y;

    //Outputs
    output L,E,G;

    // Internal Nets
    wire t1,t2,t3,t4,t5,t6,t7;
    wire m1,m2,m3,m4,m5,m6,m7,m8,m9,m10,m11,m12,m13,m14,m15,m16,m17,m18,m19;
    wire n1,n2,n3,n4,n5,n6,n7,n8,n9,n10,n11,n12,n13,n14,n15,n16,n17,n18;
    wire w1=1;

    // X Equals to Y
    xor  g1_1  (t1,x[0],y[0]);
    xor  g1_2  (t2,x[1],y[1]);
    nor  g1_3  (t3,t1,t2);
    xor  g1_4  (t4,x[2],y[2]);
    xor  g1_5  (t5,x[3],y[3]);
    nor  g1_6  (t6,t4,t5);
    nand g1_7  (t7,t3,t6);
    nand g1_8  (E,w1,t7);

    // X Less than Y
    not  g2_1  (m1,x[3]);
    nand g2_2  (m2,m1,y[3]);
    not  g2_3  (m3,x[1]);
    nand g2_4  (m4,m3,y[1]);
    not  g2_5  (m5,y[0]);
    nor  g2_6  (m6,x[0],m5);
    not  g2_7  (m7,y[1]);
    nand g2_8  (m8,x[1],m7);
    nand g2_9  (m9,m6,m8);
    nand g2_10 (m10,m4,m9);
    not  g2_11 (m11,m10);
    nand g2_12 (m12,x[2],m11);
    nand g2_13 (m13,m12,y[2]);
    not  g2_14 (m14,x[2]);
    nand g2_15 (m15,m10,m14);
    nand g2_16 (m16,m13,m15);
    not  g2_17 (m17,y[3]);
    nand g2_18 (m18,x[3],m17);
    nand g2_19 (m19,m16,m18);
    nand g2_20 (L,m2,m19);

    // X Greater than Y
    not  g3_1  (n1,y[3]);
    nand g3_2  (n2,x[3],n1);
    not  g3_3  (n3,y[1]);
    nand g3_4  (n4,x[1],n3);
    not  g3_5  (n5,x[0]);
    nor  g3_6  (n6,n5,y[0]);
    not  g3_7  (n7,x[1]);
    nand g3_8  (n8,n7,y[1]);
    nand g3_9  (n9,n6,n8);
    nand g3_10 (n10,n4,n9);
    nor  g3_11 (n11,x[2],n10);
    nor  g3_12 (n12,n11,y[2]);
    not  g3_13  (n13,n12);
    nand g3_14 (n14,x[2],n10);
    nand g3_15 (n15,n13,n14);
    not  g3_16 (n16,x[3]);
    nand g3_17 (n17,n16,y[3]); 
    nand g3_18 (n18,n15,n17);
    nand g3_19 (G,n2,n18);   
endmodule
