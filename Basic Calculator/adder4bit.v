module adder4bit(Sum,Cout,A,B,Cin);
    input [3:0]A,B; input Cin;
    output [3:0]Sum; output Cout;

    wire w1,w2,w3;

    //module fullAdder(Sum,Cout,A,B,Cin);
    fullAdder FA1(Sum[0],w1,A[0],B[0],Cin);
    fullAdder FA2(Sum[1],w2,A[1],B[1],w1);
    fullAdder FA3(Sum[2],w3,A[2],B[2],w2);
    fullAdder FA4(Sum[3],Cout,A[3],B[3],w3);
endmodule