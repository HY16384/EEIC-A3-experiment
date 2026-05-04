`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/16 14:07:46
// Design Name: 
// Module Name: full_adder
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


module full_adder(
    input wire a,
    input wire b,
    input wire cin,
    output wire s,
    output wire cout
    );
    
    wire s_temp;
    wire c_temp0;
    wire c_temp1;
    
    half_adder hd0(.a(a), .b(b), .s(s_temp), .c(c_temp0));
    half_adder hd1(.a(cin), .b(s_temp), .s(s), .c(c_temp1));
    
    assign cout = c_temp0 | c_temp1;
    
endmodule;

module half_adder(
    input wire a,
    input wire b,
    output wire s,
    output wire c
    );
    
    assign s = a ^ b;
    assign c = a & b;
    
endmodule
