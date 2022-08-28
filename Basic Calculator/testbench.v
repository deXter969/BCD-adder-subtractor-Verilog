module testbench; 
    reg [11:0]A,B;
    reg Asign,Bsign,Mode;
    wire [11:0] Out;
    wire Cout,Sign;

    //module Integer3digitsAddSub(Out,Sign,Cout,Mode,Asign,Bsign,A,B);
    Integer3digitsAddSub DUT (Out,Sign,Cout,Mode,Asign,Bsign,A,B);
    
    initial 
        begin
        $dumpfile("Integer3digitsAddSub.vcd"); $dumpvars(0,testbench);

        #2 A=12'b0011_0100_1000;B=12'b0111_1000_0110;Mode=0;Asign=0;Bsign=0;
        #2 A=12'b0011_0100_1000;B=12'b0111_1000_0110;Mode=0;Asign=1;Bsign=0;
        #2 A=12'b0011_0100_1000;B=12'b0111_1000_0110;Mode=0;Asign=0;Bsign=1;
        #2 A=12'b0011_0100_1000;B=12'b0111_1000_0110;Mode=0;Asign=1;Bsign=1;
        #2 $finish;
        
        end
    initial $monitor ($time,"\t Asign = %b, Bsign = %b, A = %b, B = %b, Sign = %b, Cout = %b, Out = %b",Asign,Bsign,A,B,Sign,Cout,Out);

endmodule