`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/16 15:59:48
// Design Name: 
// Module Name: standard_seq_circ
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


module standard_seq_circ(
    input wire clk,
    input wire start,
    output wire out
    );
    
    // クロック立ち上がり時にSTART入力が1であれば、カウントを開始、
    // 以後クロックと同期して"1，0，0，0"を順に繰り返して出力
    // 再度STARTが1になったら、また1から順に繰り返し出力
    
    wire [2-1:0] s, s_next;
    
    next_state n0(.s(s), .start(start), .s_next(s_next));
    current_output c0(.s(s), .out(out));
    
    d_flipflop d0 (
        .CLK(clk),
        .NRST(1'b1),
        .d(s_next[0]),
        .q(s[0])
    );
    
    d_flipflop d1 (
        .CLK(clk),
        .NRST(1'b1),
        .d(s_next[1]),
        .q(s[1])
    );
    
endmodule

module next_state (
    input wire [2-1:0] s,
    input wire start,
    output wire [2-1:0] s_next
);

    // s0, s1, start | (next) s0, s1
    // 0 0 0 | 0 1
    // 0 0 1 | 0 0
    // 0 1 0 | 1 0
    // 0 1 1 | 0 0
    // 1 0 0 | 1 1
    // 1 0 1 | 0 0
    // 1 1 0 | 0 0
    // 1 1 1 | 0 0
    
    // s0' = ~start & (s0 ^ s1)
    // s1' = ~start & s1
    
    assign s_next[0] = ~(start | (s[0] ^ s[1]));
    assign s_next[1] = ~(start | s[1]);
endmodule

module current_output (
    input wire [2-1:0] s,
    output wire out
    );
    
    // 0 0 -> 1, else 0
    
    assign out = (~s[0]) & (~s[1]);
endmodule
