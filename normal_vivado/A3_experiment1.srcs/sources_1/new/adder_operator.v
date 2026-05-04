`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/16 15:05:11
// Design Name: 
// Module Name: adder_operator
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


module adder_operator#(
    parameter width=4
)(
    input wire signed [width-1:0] a, b,
    output wire signed [width-1:0] s
);

    assign s = a+b;

endmodule
