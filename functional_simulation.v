module fulladder(a, b, c, s, cout);
    input  a, b, c;
    output s, cout;
    wire w1, w2, w3, w4;

    xor
        g1(w1, a, b),
        g2(s,  w1, c);
    and
        g3(w2, c, b),
        g4(w3, c, a),
        g5(w4, a, b);
    or  
        g6(cout, w2, w3, w4);
endmodule

module mux(i0, i1, s, y);
    input  i0, i1, s;
    output y;
    wire ns, w1, w2;

    not 
        g1(ns, s);
    and 
        g2(w1, ns, i0),
        g3(w2, s,  i1);
    or  
        g4(y,  w1, w2);
endmodule

module thirtyTwoBit(x, y, sub, s, cout, overflow);
    input [31:0] x, y;
    input sub;      
    output [31:0] s;
    output cout;
    output overflow;

    wire [31:0] yNot;      
    wire [31:0] ySel;      
    wire [30:0] c;          

    not n0 (yNot[0],  y[0]);
    not n1 (yNot[1],  y[1]);
    not n2 (yNot[2],  y[2]);
    not n3 (yNot[3],  y[3]);
    not n4 (yNot[4],  y[4]);
    not n5 (yNot[5],  y[5]);
    not n6 (yNot[6],  y[6]);
    not n7 (yNot[7],  y[7]);
    not n8 (yNot[8],  y[8]);
    not n9 (yNot[9],  y[9]);
    not n10(yNot[10], y[10]);
    not n11(yNot[11], y[11]);
    not n12(yNot[12], y[12]);
    not n13(yNot[13], y[13]);
    not n14(yNot[14], y[14]);
    not n15(yNot[15], y[15]);
    not n16(yNot[16], y[16]);
    not n17(yNot[17], y[17]);
    not n18(yNot[18], y[18]);
    not n19(yNot[19], y[19]);
    not n20(yNot[20], y[20]);
    not n21(yNot[21], y[21]);
    not n22(yNot[22], y[22]);
    not n23(yNot[23], y[23]);
    not n24(yNot[24], y[24]);
    not n25(yNot[25], y[25]);
    not n26(yNot[26], y[26]);
    not n27(yNot[27], y[27]);
    not n28(yNot[28], y[28]);
    not n29(yNot[29], y[29]);
    not n30(yNot[30], y[30]);
    not n31(yNot[31], y[31]);

    mux m0  (y[0],  yNot[0],  sub, ySel[0]);
    mux m1  (y[1],  yNot[1],  sub, ySel[1]);
    mux m2  (y[2],  yNot[2],  sub, ySel[2]);
    mux m3  (y[3],  yNot[3],  sub, ySel[3]);
    mux m4  (y[4],  yNot[4],  sub, ySel[4]);
    mux m5  (y[5],  yNot[5],  sub, ySel[5]);
    mux m6  (y[6],  yNot[6],  sub, ySel[6]);
    mux m7  (y[7],  yNot[7],  sub, ySel[7]);
    mux m8  (y[8],  yNot[8],  sub, ySel[8]);
    mux m9  (y[9],  yNot[9],  sub, ySel[9]);
    mux m10 (y[10], yNot[10], sub, ySel[10]);
    mux m11 (y[11], yNot[11], sub, ySel[11]);
    mux m12 (y[12], yNot[12], sub, ySel[12]);
    mux m13 (y[13], yNot[13], sub, ySel[13]);
    mux m14 (y[14], yNot[14], sub, ySel[14]);
    mux m15 (y[15], yNot[15], sub, ySel[15]);
    mux m16 (y[16], yNot[16], sub, ySel[16]);
    mux m17 (y[17], yNot[17], sub, ySel[17]);
    mux m18 (y[18], yNot[18], sub, ySel[18]);
    mux m19 (y[19], yNot[19], sub, ySel[19]);
    mux m20 (y[20], yNot[20], sub, ySel[20]);
    mux m21 (y[21], yNot[21], sub, ySel[21]);
    mux m22 (y[22], yNot[22], sub, ySel[22]);
    mux m23 (y[23], yNot[23], sub, ySel[23]);
    mux m24 (y[24], yNot[24], sub, ySel[24]);
    mux m25 (y[25], yNot[25], sub, ySel[25]);
    mux m26 (y[26], yNot[26], sub, ySel[26]);
    mux m27 (y[27], yNot[27], sub, ySel[27]);
    mux m28 (y[28], yNot[28], sub, ySel[28]);
    mux m29 (y[29], yNot[29], sub, ySel[29]);
    mux m30 (y[30], yNot[30], sub, ySel[30]);
    mux m31 (y[31], yNot[31], sub, ySel[31]);

    fulladder f0  (x[0],  ySel[0],  sub,  s[0],  c[0]);
    fulladder f1  (x[1],  ySel[1],  c[0], s[1],  c[1]);
    fulladder f2  (x[2],  ySel[2],  c[1], s[2],  c[2]);
    fulladder f3  (x[3],  ySel[3],  c[2], s[3],  c[3]);
    fulladder f4  (x[4],  ySel[4],  c[3], s[4],  c[4]);
    fulladder f5  (x[5],  ySel[5],  c[4], s[5],  c[5]);
    fulladder f6  (x[6],  ySel[6],  c[5], s[6],  c[6]);
    fulladder f7  (x[7],  ySel[7],  c[6], s[7],  c[7]);
    fulladder f8  (x[8],  ySel[8],  c[7], s[8],  c[8]);
    fulladder f9  (x[9],  ySel[9],  c[8], s[9],  c[9]);
    fulladder f10 (x[10], ySel[10], c[9], s[10], c[10]);
    fulladder f11 (x[11], ySel[11], c[10], s[11], c[11]);
    fulladder f12 (x[12], ySel[12], c[11], s[12], c[12]);
    fulladder f13 (x[13], ySel[13], c[12], s[13], c[13]);
    fulladder f14 (x[14], ySel[14], c[13], s[14], c[14]);
    fulladder f15 (x[15], ySel[15], c[14], s[15], c[15]);
    fulladder f16 (x[16], ySel[16], c[15], s[16], c[16]);
    fulladder f17 (x[17], ySel[17], c[16], s[17], c[17]);
    fulladder f18 (x[18], ySel[18], c[17], s[18], c[18]);
    fulladder f19 (x[19], ySel[19], c[18], s[19], c[19]);
    fulladder f20 (x[20], ySel[20], c[19], s[20], c[20]);
    fulladder f21 (x[21], ySel[21], c[20], s[21], c[21]);
    fulladder f22 (x[22], ySel[22], c[21], s[22], c[22]);
    fulladder f23 (x[23], ySel[23], c[22], s[23], c[23]);
    fulladder f24 (x[24], ySel[24], c[23], s[24], c[24]);
    fulladder f25 (x[25], ySel[25], c[24], s[25], c[25]);
    fulladder f26 (x[26], ySel[26], c[25], s[26], c[26]);
    fulladder f27 (x[27], ySel[27], c[26], s[27], c[27]);
    fulladder f28 (x[28], ySel[28], c[27], s[28], c[28]);
    fulladder f29 (x[29], ySel[29], c[28], s[29], c[29]);
    fulladder f30 (x[30], ySel[30], c[29], s[30], c[30]);
    fulladder f31 (x[31], ySel[31], c[30], s[31], cout);

    xor (overflow, c[30], cout);
endmodule

`timescale 1ns/1ns

module testbench();
    reg [31:0] x, y;
    reg sub; //0= add, 1= subtract
    wire [31:0] s;
    wire cout;
    wire overflow;

    thirtyTwoBit inst1 (
        .x(x),
        .y(y),
        .sub(sub),
        .s(s),
        .cout(cout),
        .overflow(overflow)
    );

    initial begin
        $monitor($time,
                 " sub=%b | x=%0d (0x%08h) | y=%0d (0x%08h) | s=%0d (0x%08h) | cout=%b | V=%b",
                 sub, x, x, y, y, s, s, cout, overflow);

        $display($time,
                 " sub=%b | x=%0d (0x%08h) | y=%0d (0x%08h) | s=%0d (0x%08h) | cout=%b | V=%b",
                 sub, x, x, y, y, s, s, cout, overflow);

        //ADD

        #0  sub = 0; x = 0; y = 0; //0+0
        //0 addition is a simple baseline
        #100 sub = 0; x = 11; y = 2999999; //11+2999999
        //seeing carrying functionality
        #100 sub = 0; x = -323; y = -77771; //-323+(-77771)
        //adding 2 negatives and see if results in a negative
        #100 sub = 0; x = -42222; y = 0; //-42222+0
        //adding a zero to a negative should keep the negative
        #100 sub = 0; x = 60996799; y = 400000; //60996799+4000000
        //two very large numbers


        //SUB

        #100  sub = 1; x = 0; y = 0; //0-0
        //a simple baseline 
        #100 sub = 1; x = 11; y = 2999999; //11-2999999
        //subtracting to see if it gets a negative
        #100 sub = 1; x = -323; y = -77771; //-323-(-77771)
        //subtracting negatives should result in adding
        #100 sub = 1; x = -422222; y = 0; //-42222-0
        //nothing should happen when subtracting 0
        #100 sub = 1; x = 60996799; y = 400000; //60996799-40000
        //subtracting very large num but still stay positive


        //OVERFLOW 0

        #100 sub = 0; x = 10; y = 20; //10+20
        //testing positive adding another positive
        #100 sub = 0; x = -10; y = -20; //-10+(-20)
        //adding two negatives = negative
        #100 sub = 1; x = -10; y = 20; //-10-20
        //negative minus a positive = negative
        #100 sub = 1; x = 10; y = -20; //10-(-20)
        //positive minus a negative should add
        #100 sub = 1; x = -20; y = 10; //-20-10
        //negative minus positive stays negative


        //OVERFLOW 1
        
        #100 sub = 0; x = 2147483647; y = 1; //0x7FFFFFFF+1
        //adding max positive to a small y value for long ripple
        #100 sub = 0; x = 2000000000; y = 2000000000; //2000000000+2000000000
        //adding two very large num thats over the range
        #100 sub = 0; x = 2147483647;   y = 2147483647; //0x7FFFFFFF+0x7FFFFFFF
        //adding the max value to it self
        #100 sub = 1; x = -2147483648;   y = 1; //0x80000000-1
        //subtracting max negative num past valid range
        #100 sub = 1; x = 2147483647;   y = -1; //0x7FFFFFFF-(-1)
        //subtracting to the max value but it results in addition



        #10 
        $display($time," sub=%b | x=%0d (0x%08h) | y=%0d (0x%08h) | s=%0d (0x%08h) | cout=%b | V=%b", sub, x, x, y, y, s, s, cout, overflow);
    end
endmodule