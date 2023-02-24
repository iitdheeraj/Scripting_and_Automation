`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.01.2023 16:45:02
// Design Name: 
// Module Name: top_Priority_Encoder8_3
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


module top_Priority_Encoder8_3( input [7:0] in, input en, output reg [2:0] out);

  always @(*)
  begin
    if(en==1) // when enable is 1
      begin    
        if(in[7]==1) out=3'b111;
        else if(in[6]==1) out=3'b110;
        else if(in[5]==1) out=3'b101;
        else if(in[4]==1) out=3'b100;
        else if(in[3]==1) out=3'b011;
        else if(in[2]==1) out=3'b010;
        else if(in[1]==1) out=3'b001;
        else
        out=3'b000;
      end
    else out=3'bzzz;  // when enable is 0
  end
  
endmodule
