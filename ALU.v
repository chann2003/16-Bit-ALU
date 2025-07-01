`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2024 08:03:18 PM
// Design Name: 
// Module Name: ALU
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


module ALU(
input clk,
input [15:0]a,b,
input [3*8:0] op,
output  reg [31:0]out
    );
    
wire [15:0]z1,z2,z3;
reg [15:0] a1, a2, a3, b1, b2, b3;
reg [1:0] sel;
wire Cout;

always @(a,b,op)
if(  op == "" || op == "|" || op == "&" || op == "&" || op == "~|" ||
     op == "^" || op == "~^" || op == ">>" || op == "<<" || op == "asr" || 
     op == "asl" || op == "ror" || op == "rol" || op == "cmp" )
 sel = 2'b00;
else if(op == "+" || op == "-")
    sel = 2'b01;
else if( op == "*" )
    sel = 2'b10;




logical L(a1, b1, op, z1);
arithmetic AA1( a2,b2,op,z2,Cout);
multiplier M( clk,a3, b3, z3);



always @(*)
case(sel)
2'b00 : begin
        a1 = a;
        a2 = 0;
        a3 = 0;
        b1 = b;
        b2 = 0;
        b3 = 0;
        out[15:0] = z1;
        out[31:16] = 0;
        end
2'b01  : begin
        a1 = 0;
        a2 = a;
        a3 = 0;
        b1 = 0;
        b2 = b;
        b3 = 0;
        out[15:0] = z2;
        out[16] = Cout;
        out[31:17] = 0;
        end     
2'b10 :  begin
        a1 = 0;
        a2 = 0;
        a3 = a;
        b1 = 0;
        b2 = 0;
        b3 = b;
       out = z3;
        end            
default : out = 0;

endcase
  
endmodule
