`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2024 08:05:53 PM
// Design Name: 
// Module Name: arithmetic
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


module arithmetic(
input [15:0] A,
input [15:0] B,
input [8:0] sel,
output reg [15:0] Sum,
output reg Cout
    );

wire [15:0] B_comp;
twos_comp TC(B,B_comp);

reg [15:0] b;
wire [15:0] S1;
wire c1;
adder A1( A, b, S1, c1);

always @(*)
case(sel)

"+" : begin
        b = B;
        Sum = S1;
        Cout = c1;
      end
        
"-" : begin
        b = B_comp;
        Sum = S1;
        Cout = 0;
      end       
      
default : begin
        Sum = 0;
        Cout = 0;
        end       

endcase 
      
endmodule

module adder(
input [15:0] A,
input [15:0] B,
output [15:0] Sum,
output Cout
    );
    
wire [2:0] cout_cla;
wire Cin;
assign Cin = 0;

carry_look_ahead CLA1(A[3:0],B[3:0], Cin, cout_cla[0]);
carry_look_ahead CLA2(A[7:4],B[7:4], cout_cla[0], cout_cla[1]);
carry_look_ahead CLA3(A[11:8],B[11:8], cout_cla[1], cout_cla[2] );  
carry_look_ahead CLA4(A[15:12],B[15:12], cout_cla[2], Cout );

ripple_carry_adder RCA1(A[3:0], B[3:0], Cin, Sum[3:0]);
ripple_carry_adder RCA2(A[7:4], B[7:4],cout_cla[0], Sum[7:4]);
ripple_carry_adder RCA3(A[11:8], B[11:8], cout_cla[1], Sum[11:8]);
ripple_carry_adder RCA4(A[15:12], B[15:12], cout_cla[2], Sum[15:12]);  
    
endmodule


module full_adder(
input a, b, cin,
output sum, cout
);
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (cin & a);
endmodule


module ripple_carry_adder(
    input [3:0] a, b,
    input cin,
    output [3:0] sum
);
    wire [3:0] c;
    full_adder FA1(a[0], b[0], cin, sum[0], c[0]);
    full_adder FA2(a[1], b[1], c[0], sum[1], c[1]);
    full_adder FA3(a[2], b[2], c[1], sum[2], c[2]);
    full_adder FA4(a[3], b[3], c[2], sum[3], c[3]);
endmodule

module carry_look_ahead(
input [3:0]a,b,
input Cin,
output Cout1);

wire [3:0]p,g;

assign p = a^b;
assign g = a&b;

assign Cout1 =  g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]) | (p[3] & p[2] & p[1] & p[0] & Cin);

endmodule



module twos_comp(
input [15:0]B,
output [15:0]B_comp
);

assign B_comp = ~B + 1'b1;


endmodule
