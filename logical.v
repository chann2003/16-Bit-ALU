`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2024 08:04:19 PM
// Design Name: 
// Module Name: logical
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


module logical(
input [15:0] a,b,
input [3*8:0] sel,
output reg [15:0] x

    );
    

 always@(*)
begin
    case(sel)
    "~"://not
            x=~a;
    "|"://or
            x=a|b;
    "&"://and
            x=a&b;
    "~&"://nand
            x=~(a&b);
    "~|"://nor
            x=~(a|b);
    "^"://xor
            x=a^b;
    "~^"://xnor
            x=~(a^b);
    "<<"://logical left shift
            x=a<<1;
    ">>"://logical right shift
            x=a>>1;
    "asl"://arithmetic left shift
            x={a[14:0],1'b0};
    "asr"://arithmetic right shift
            x={a[15],a[15:1]};
    "rol"://rotate left
            x={a[14:0],a[15]};
    "ror"://rotate right
            x={a[0],a[15:1]};  
    "cmp"://comparision
            if(a>b)
                x=1;
             else if(a<b)
                x=16'hffff;
             else
                x=0;  
         
     default:
            x=0;
     endcase
end
       
  
    
endmodule
