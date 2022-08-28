module testbench; 
  reg [11:0]A,B;
  reg Asign,Bsign,M;
  wire [11:0] S;
  wire Cout,sign;
  BCD_3_digits uut (S,sign,Cout,A,B,Asign,Bsign,M);
  
  initial 
    begin
      $dumpfile("BCD_3_digits.vcd"); $dumpvars(0,testbench);

      #2 A=12'b0111_0100_0101;B=12'b0110_0010_0011;M=0;Asign=0;Bsign=0;
      #2 A=12'b0111_0100_0101;B=12'b0110_0010_0011;M=0;Asign=1;Bsign=0;
      #2 A=12'b0001_0100_0111;B=12'b1001_0101_0010;M=1;Asign=0;Bsign=1;
      #2 A=12'b0111_0100_0101;B=12'b0110_0010_0011;M=0;Asign=1;Bsign=1;
      #2 A=12'b0111_0100_0101;B=12'b0110_0010_0011;M=1;Asign=0;Bsign=1;
      #2 A=12'b0001_0100_0111;B=12'b1001_0101_0010;M=0;Asign=0;Bsign=0;
      #2 A=12'b0010_0110_0011;B=12'b0101_0001_0010;M=0;Asign=0;Bsign=0;
      #2 A=12'b1001_0110_0011;B=12'b0101_0101_0010;M=0;Asign=1;Bsign=0;
      #2 $finish;
      
    end
  initial $monitor ($time,"\t sign=%b,a=%b,sign=%b,b=%b,m=%b,c_out=%b,sign=%b,result=%b \t",Asign,A,Bsign,B,M,Cout,sign,S);

endmodule