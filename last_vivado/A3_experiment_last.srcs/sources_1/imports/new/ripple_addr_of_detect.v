`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/16 15:35:09
// Design Name: 
// Module Name: ripple_addr_of_detect
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


module ripple_adder_of_detect#(
    parameter width=4
)(
    input wire [width-1:0] a, b,
    input wire cin,
    output wire [width-1:0] s,
    output wire cout,
    output wire overflowed
);

    ripple_carry_adder #(width) addr(
        .a(a), .b(b), .cin(cin), .s(s), .cout(cout)
       );
       
    assign overflowed = (a[width-1] == b[width-1]) && (a[width-1] != s[width-1]) ? 1 : 0;

endmodule
