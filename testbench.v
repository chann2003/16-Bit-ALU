`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2024 08:15:22 PM
// Design Name: 
// Module Name: ALU_tb
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

module tb_ALU;
reg clk;
reg [15:0]a,b;
reg [3*8:0] op;
wire [31:0]out;


ALU ABC(clk,a,b,op,out);

always begin
clk=0; #0.5
clk=1; #0.5;
end

initial begin
a = 16'd14;   b = 16'd12;
op = "~"; #10
op = "|"; #10
op = "&"; #10
op = "~|"; #10
op = "^"; #10
op = "asl"; #10
op = "ror"; #10
op = "+"; #10
op = "-";  #10
op = "*"; #10
op = "abc"; #10

$finish;
end


endmodule
