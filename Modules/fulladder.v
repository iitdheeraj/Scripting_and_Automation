`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.01.2023 16:40:16
// Design Name: 
// Module Name: fulladder
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


module fulladder( input A, input B, input Cin, output OUT, output Cout);
  wire x,y,z;
  halfadder f1(.A(A), .B(B),.OUT(x), .Cout(y));
  halfadder f2(.A(x), .B(Cin),.OUT(OUT), .Cout(z));
  or f3(Cout, y, z);  //Carry Out
endmodule
