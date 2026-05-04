`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/16 13:50:46
// Design Name: 
// Module Name: d_flipflop
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


module d_flipflop(
    input wire CLK,
    input wire d,
    input wire NRST,
    output wire q
    );
    
    wire n1;
    
    d_latch d0(.CLK(~CLK), .d(NRST & d), .q(n1));
    d_latch d1(.CLK(CLK), .d(n1), .q(q));
    
endmodule
