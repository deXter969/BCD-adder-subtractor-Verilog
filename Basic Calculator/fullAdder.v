module fullAdder(Sum,Cout,A,B,Cin);
    input A,B,Cin; output Cout,Sum;

    wire w1,w3,w5;

    xor G1(w1,A,B),G2(Sum,w1,Cin);
    nand G3(w3,w1,Cin),G4(Cout,w3,w5),G5(w5,A,B);  
endmodule