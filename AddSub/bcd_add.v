// BCD Adder

module bcd_add(A,B,Cin,Sum,Cout);
input [3:0] A,B;                    // A & B are in BCD form
input Cin;
output [3:0] Sum;
output Cout;
wire [3:0] Sbfa,InvalidBCD_add;
wire C1,C2;
FA4bit bfa0 (A,B,Cin,Sbfa,C1);
assign Cout = (Sbfa[3] & Sbfa[2]) | (Sbfa[3] & Sbfa[1]) | C1;
assign InvalidBCD_add = {1'b0,Cout,Cout,1'b0};        /* Addition of 0110 for invalid BCD 
                                                        or carry out generation */
FA4bit bfa1 (Sbfa,InvalidBCD_add,Cin,Sum,C2);
// display "Cout" on 1 LED & "Sum" on 2nd LED
endmodule