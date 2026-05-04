`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/16 13:14:57
// Design Name: 
// Module Name: d_latch
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


module d_latch(
    input wire CLK,
    input wire d,
    output wire q
    );
    
    sr_latch sr(
    .s(CLK & d), .r(CLK & ~d), .q(q), .nq()
    );
    
endmodule

module sr_latch(
    input wire s,
    input wire r,
    output wire q,
    output wire nq
);
    
    assign q = ~(r | nq);
    assign nq = ~(s | q);
    
endmodule