`include "sample.v"

module lab4( a, b, output1 );

	input [3:0]a;
	input [3:0]b;
	output [7:0]output1;
	wire [3:0] mult1, mult2, mult3, mult4;
	wire AxB, AxBaC, AaB, S, S0, C;
	wire AxB1, AxBaC1, AaB1, S1, C1;
	wire AxB2, AxBaC2, AaB2, S2, C2;
	wire AxB3, AxBaC3, AaB3, S3, C3;
	wire AxB4, AxBaC4, AaB4, S4, C4;
	wire AxB5, AxBaC5, AaB5, S5, C5;
	wire AxB6, AxBaC6, AaB6, S6, C6;
	wire AxB7, AxBaC7, AaB7, S7, C7;
	wire AxB8, AxBaC8, AaB8, S8, C8;
	wire AxB9, AxBaC9, AaB9, S9, C9;
	wire AxB10, AxBaC10, AaB10, S10, C10;
	wire AxB11, AxBaC11, AaB11, S11, C11;
	wire AxB12, AxBaC12, AaB12, S12, C12;
	wire AxB13, AxBaC13, AaB13, S13, C13;

	AND2X1 m0(.A(a[0]), .B(b[0]), .Y(mult1[0]));  //C0
	AND2X1 m1(.A(a[1]), .B(b[0]), .Y(mult1[1]));  //C1
	AND2X1 m2(.A(a[2]), .B(b[0]), .Y(mult1[2]));  //C2
	AND2X1 m3(.A(a[3]), .B(b[0]), .Y(mult1[3]));  //C3
	//------------------------------------------------
	AND2X1 m4(.A(a[0]), .B(b[1]), .Y(mult2[0]));  //C1
	AND2X1 m5(.A(a[1]), .B(b[1]), .Y(mult2[1]));  //C2
	AND2X1 m6(.A(a[2]), .B(b[1]), .Y(mult2[2]));  //C3
	AND2X1 m7(.A(a[3]), .B(b[1]), .Y(mult2[3]));  //C4
	//------------------------------------------------
	AND2X1 m8(.A(a[0]), .B(b[2]), .Y(mult3[0]));  //C2
	AND2X1 m9(.A(a[1]), .B(b[2]), .Y(mult3[1]));  //C3
	AND2X1 m10(.A(a[2]), .B(b[2]), .Y(mult3[2])); //C4
	AND2X1 m11(.A(a[3]), .B(b[2]), .Y(mult3[3])); //C5
	//------------------------------------------------
	AND2X1 m12(.A(a[0]), .B(b[3]), .Y(mult4[0])); //C3
	AND2X1 m13(.A(a[1]), .B(b[3]), .Y(mult4[1])); //C4
	AND2X1 m14(.A(a[2]), .B(b[3]), .Y(mult4[2])); //C5
	AND2X1 m15(.A(a[3]), .B(b[3]), .Y(mult4[3])); //C6


	// output[0]
	AND2X1 x( .A(mult1[0]), .B(mult1[0]), .Y(output1[0]) );

	// output[1]
	XOR2X1 x0( .A(mult1[1]), .B(mult2[0]), .Y(AxB));
	XOR2X1 x1( .A(AxB), .B(0), .Y(output1[1]));
	AND2X1 x2( .A(AxB), .B(0), .Y(AxBaC));
	AND2X1 x3( .A(mult1[1]), .B(mult2[0]), .Y(AaB));
	OR2X1 x4( .A(AaB), .B(AxBaC), .Y(C));

	// output[2]
	XOR2X1 x5( .A(mult1[2]), .B(mult2[1]), .Y(AxB1));
	XOR2X1 x6( .A(AxB1), .B(C), .Y(S0)); 
	AND2X1 x7( .A(AxB1), .B(C), .Y(AxBaC1));
	AND2X1 x8( .A(mult1[2]), .B(mult2[1]), .Y(AaB1));
	OR2X1 x9( .A(AaB1), .B(AxBaC1), .Y(C1));

	// output[3]
	XOR2X1 x10( .A(mult1[3]), .B(mult2[2]), .Y(AxB2));
	XOR2X1 x11( .A(AxB2), .B(C1), .Y(S) );
	AND2X1 x12( .A(AxB2), .B(C1), .Y(AxBaC2));
	AND2X1 x13( .A(mult1[3]), .B(mult2[2]), .Y(AaB2));
	OR2X1 x14( .A(AaB2), .B(AxBaC2), .Y(C2));

	// output[4]
	XOR2X1 x15( .A(0), .B(mult2[3]), .Y(AxB3));
	XOR2X1 x16( .A(AxB3), .B(C2), .Y(S1) );
	AND2X1 x17( .A(AxB3), .B(C2), .Y(AxBaC3));
	AND2X1 x18( .A(0), .B(mult2[3]), .Y(AaB3) );
	OR2X1 x19( .A(AaB3), .B(AxBaC3), .Y(C3));

	// output[5]
	OR2X1 x20( .A(C3), .B(0), .Y(S2));

	// output[2](1)
	OR2X1 x21( .A(mult3[0]), .B(0), .Y(S3));

	// output[3](1)
	XOR2X1 x22( .A(mult3[1]), .B(mult4[0]), .Y(AxB4));
	XOR2X1 x23( .A(AxB4), .B(0), .Y(S4)); 
	AND2X1 x24( .A(AxB4), .B(0), .Y(AxBaC4));
	AND2X1 x25( .A(mult3[1]), .B(mult4[0]), .Y(AaB4));
	OR2X1 x26( .A(AaB4), .B(AxBaC4), .Y(C4));

	// output[4](1)
	XOR2X1 x27( .A(mult3[2]), .B(mult4[1]), .Y(AxB5));
	XOR2X1 x28( .A(AxB5), .B(C4), .Y(S5)); 
	AND2X1 x29( .A(AxB5), .B(C4), .Y(AxBaC5));
	AND2X1 x30( .A(mult3[2]), .B(mult4[1]), .Y(AaB5));
	OR2X1 x31( .A(AaB5), .B(AxBaC5), .Y(C5));

	// output[5](1)
	XOR2X1 x32( .A(mult3[3]), .B(mult4[2]), .Y(AxB6));
	XOR2X1 x33( .A(AxB6), .B(C5), .Y(S6));
	AND2X1 x34( .A(AxB6), .B(C5), .Y(AxBaC6));
	AND2X1 x35( .A(mult3[3]), .B(mult4[2]), .Y(AaB6));
	OR2X1 x36( .A(AaB6), .B(AxBaC6), .Y(C6));

	// output[6]
	XOR2X1 x37( .A(0), .B(mult4[3]), .Y(AxB7));
	XOR2X1 x38( .A(AxB7), .B(C6), .Y(S7));
	AND2X1 x39( .A(AxB7), .B(C6), .Y(AxBaC7));
	AND2X1 x40( .A(0), .B(mult4[3]), .Y(AaB7));
	OR2X1 x41( .A(AaB7), .B(AxBaC7), .Y(C7));

	// output[7]
	OR2X1 x42( .A(C7), .B(0), .Y(S8));

	// output[2] + output[2](1) + carry from 1 
	XOR2X1 s0( .A(S0), .B(S3), .Y(AxB8));
	XOR2X1 s1( .A(AxB8), .B(0), .Y(output1[2]));
	AND2X1 s2( .A(AxB8), .B(0), .Y(AxBaC8));
	AND2X1 s3( .A(S0), .B(S3), .Y(AaB8));
	OR2X1 s4( .A(AaB8), .B(AxBaC8), .Y(C8));

	// output[3] + output[3](1) + carry from 2(C8)
	XOR2X1 s5( .A(S), .B(S4), .Y(AxB9));
	XOR2X1 s6( .A(AxB9), .B(C8), .Y(output1[3]));
	AND2X1 s7( .A(AxB9), .B(C8), .Y(AxBaC9));
	AND2X1 s8( .A(S), .B(S4), .Y(AaB9));
	OR2X1 s9( .A(AaB9), .B(AxBaC9), .Y(C9));

	// output[4] + output[4](1) + carry from 3(C9)
	XOR2X1 s10( .A(S1), .B(S5), .Y(AxB10));
	XOR2X1 s11( .A(AxB10), .B(C9), .Y(output1[4]));
	AND2X1 s12( .A(AxB10), .B(C9), .Y(AxBaC10));
	AND2X1 s13( .A(S1), .B(S5), .Y(AaB10));
	OR2X1 s14( .A(AaB10), .B(AxBaC10), .Y(C10));

	// output[5] + output[5](1) + carry from 4(C10)
	XOR2X1 s15( .A(S2), .B(S6), .Y(AxB11));
	XOR2X1 s16( .A(AxB11), .B(C10), .Y(output1[5]));
	AND2X1 s17( .A(AxB11), .B(C10), .Y(AxBaC11));
	AND2X1 s18( .A(S2), .B(S6), .Y(AaB11));
	OR2X1 s19( .A(AaB11), .B(AxBaC11), .Y(C11));

	// 0 + output[6] + carry from 5(C11)
	XOR2X1 s20( .A(0), .B(S7), .Y(AxB12));
	XOR2X1 s21( .A(AxB12), .B(C11), .Y(output1[6]));
	AND2X1 s22( .A(AxB12), .B(C11), .Y(AxBaC12));
	AND2X1 s23( .A(0), .B(S7), .Y(AaB12));
	OR2X1 s24( .A(AaB12), .B(AxBaC12), .Y(C12));

	// 0 + output[7] + carry from 6(C12)
	XOR2X1 s25( .A(0), .B(S8), .Y(AxB13));
	XOR2X1 s26( .A(AxB13), .B(C12), .Y(output1[7]));
	AND2X1 s27( .A(AxB13), .B(C12), .Y(AxBaC13));
	AND2X1 s28( .A(0), .B(S8), .Y(AaB13));
	OR2X1 s29( .A(AaB13), .B(AxBaC13), .Y(C13));
endmodule