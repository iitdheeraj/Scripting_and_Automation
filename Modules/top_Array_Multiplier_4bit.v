`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.01.2023 16:39:34
// Design Name: 
// Module Name: Array_Multiplier_4bit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module top_Array_Multiplier_4bit( input [3:0] A, input [3:0] B, output [7:0] OUT);

  wire [3:0] R1,R2,R3,R4;
  wire [10:0] c;
  wire s1,s2,s3,s4,s5,s6;
  
  assign R1=A[0]*B[3:0]; // multiplying each digit of A with B.
  assign R2=A[1]*B[3:0];
  assign R3=A[2]*B[3:0];
  assign R4=A[3]*B[3:0];
  assign OUT[0]=R1[0];

  halfadder m1(.A(R1[1]), .B(R2[0]),.OUT(OUT[1]), .Cout(c[0]));
  
  fulladder m2(.A(c[0]), .B(R1[2]), .Cin(R2[1]), .OUT(s1), .Cout(c[1]));
  halfadder m3(.A(s1), .B(R3[0]),.OUT(OUT[2]), .Cout(c[2]));
  
  fulladder m4(.A(c[1]), .B(c[2]), .Cin(R1[3]), .OUT(s2), .Cout(c[3]));
  fulladder m5(.A(s2), .B(R2[2]), .Cin(R3[1]), .OUT(s3), .Cout(c[4]));
  halfadder m6(.A(s3), .B(R4[0]),.OUT(OUT[3]), .Cout(c[5]));
  
  fulladder m7(.A(c[3]), .B(c[4]), .Cin(c[5]), .OUT(s4), .Cout(c[6]));
  fulladder m8(.A(s4), .B(R2[3]), .Cin(R3[2]), .OUT(s5), .Cout(c[7]));
  halfadder m9(.A(s5), .B(R4[1]),.OUT(OUT[4]), .Cout(c[8]));
  
  fulladder m10(.A(c[6]), .B(c[7]), .Cin(c[8]), .OUT(s6), .Cout(c[9]));
  fulladder m11(.A(s6), .B(R3[3]), .Cin(R4[2]), .OUT(OUT[5]), .Cout(c[10]));
  
  fulladder m12(.A(c[9]), .B(c[10]), .Cin(R4[3]), .OUT(OUT[6]), .Cout(OUT[7]));

endmodule
