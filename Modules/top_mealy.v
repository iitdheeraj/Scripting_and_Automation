`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.01.2023 23:27:56
// Design Name: 
// Module Name: top_mealy
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

module top_mealy(input clk, input reset, output reg in, out);
 
  reg [1:0] y, Y;
  parameter A=2'b00, B=2'b01, C=2'b10, D=2'b11; // Different States
 
  parameter pattern=20'b11001000010110110111; //input pattern
  reg clk_1=0;
  integer i=0;
  integer count=0;
 
  always @(in or y)
    case(y)
      A: if (in==0) begin
        out=0; Y=B;
      end
      else begin
        out=0; Y=A;
      end
     
      B: if (in==0) begin
        out=0; Y=C;
      end
      else begin
        out=0; Y=A;
      end
     
      C: if (in==0) begin
        out=0; Y=C;
      end
      else begin
        out=0; Y=D;
      end
     
      D: if (in==0) begin
        out=0; Y=B;
      end
      else begin
        out=1; Y=A;
      end
     
      default: Y = A;  // default as state A
     
    endcase
 
  always @(posedge clk_1 or negedge reset)
    begin
      if (reset==0) begin // if reset, start from state A.
        y<=A;
        i<=0;
      end
      else if(i>18) begin
        i<=0;
      end
      else begin
        y<=Y;
        in<=pattern[i];
        i<=i+1;
      end
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
