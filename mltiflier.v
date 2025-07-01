`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2024 08:06:51 PM
// Design Name: 
// Module Name: multiplier
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

module multiplier( input clk, input[15:0]A1, B1, output reg [31:0] C);
integer i;
reg [31:0]A2;
reg [15:0]B2;
always@(posedge clk )
begin
		C=0;
		A2[15:0]=A1;
		A2[31:16]=0;
		B2=B1;
        for (i=0;i<15;i=i+1)
        begin
			if(B1[i]==1'b0)
			begin
				C=C+0;
			end
			else if (B1[i]==1'b1)
			begin
				C=C+(A1<<i);
			end
		end
end
endmodule
