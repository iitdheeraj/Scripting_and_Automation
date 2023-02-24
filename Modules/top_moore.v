`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.01.2023 23:36:42
// Design Name: 
// Module Name: top_moore
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

module top_moore(input clk, input reset, output reg in, out);
 
  reg [2:0] y, Y;
  parameter A=3'b000, B=3'b001, C=3'b010, D=3'b011, E=3'b100; // Different States
 
  parameter pattern=20'b11001000010110110111;  //input pattern
  reg clk_1=0;
  integer i=0;
  integer count=0;
 
  always @(in or y)
    case (y)
      A: if (in==0) begin
        Y=B;
      end
      else begin
        Y=A;
      end
     
      B: if (in==0) begin
        Y=C;
      end
      else begin
        Y=A;
      end
     
      C: if (in==0) begin
        Y=C;
      end
      else begin
        Y=D;
      end
     
      D: if (in==0) begin
        Y=B;
      end
      else begin
        Y=E;
      end
     
      E: if (in==0) begin
        Y=B;
      end
      else begin
        Y=A;
      end
     
      default: Y = A;  // default as state A
    endcase
 
  always @(negedge reset or posedge clk_1)
    begin
      if (reset == 0) begin
        y <= A;      // if reset, start from state A.
        i<=0;
      end
      else if(i>18) begin
        i<=0;
      end
      else begin
        y <= Y;
        in<=pattern[i];
        i<=i+1;
      end
     
      out = (y == E);
    end
 
  always @(posedge clk)
    begin
      count=count+1;
      if (count==(50000-1))
        begin
          clk_1=~clk_1;
          count=0;
        end
    end
 
endmodule
