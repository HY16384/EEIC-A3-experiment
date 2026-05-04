`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/17 11:41:03
// Design Name: 
// Module Name: register_d_ff
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


module register_d_ff #(
    parameter width = 1
)
(
    input wire CLK,
    input wire [width-1:0] d,
    input wire NRST,
    output wire [width-1:0] q
    );
    
    genvar i;
    wire [width-1:0] n1;
    
    for (i = 0; i < width; i = i+1) begin
        d_latch d0(.CLK(~CLK), .d(NRST & d[i]), .q(n1[i]));
        d_latch d1(.CLK(CLK), .d(n1[i]), .q(q[i]));
    end
    
endmodule
