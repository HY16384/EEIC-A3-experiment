`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/16 20:57:56
// Design Name: 
// Module Name: test_sq_circ
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


module test_sq_circ;
    reg clk, start;
    wire out;
    wire [2-1:0] s, s_next;
    
    standard_seq_circ s0(.clk(clk), .start(start), .out(out));
    
    always begin
        clk = 1'b1;
        #100 clk = ~clk;
        #100;
    end
    
    initial begin
        $monitor("state: %d, next_state: %d", s0.s, s0.s_next);
        start = 1'b0;
        #700 start = ~start;
        #200 start = ~start;
        #1200 start = ~start;
        #200 start = ~start;
        #2000;
        $finish;
    end
    
endmodule
