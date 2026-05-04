`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/20 13:01:17
// Design Name: 
// Module Name: test_seq_circ_rst
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


module test_seq_circ_rst;
    reg clk, start, rst;
    wire out;
    wire [2-1:0] s, s_next;
    
    standard_seq_circ_rst s0(.clk(clk), .start(start), .rst(rst), .out(out));
    
    always begin
        clk = 1'b1;
        #100 clk = ~clk;
        #100;
    end
    
    initial begin
        $monitor("state: %d, next_state: %d", s0.s, s0.s_next);
        start = 1'b0;
        rst = 1'b0;
        #700 start = ~start;
        #200 start = ~start;
        #1200 start = ~start;
        #200 start = ~start;
        #2000;
        #700 rst = ~rst;
        #200 rst = ~rst;
        #1200 rst = ~rst;
        #200 rst = ~rst;
        #2000;
        $finish;
    end

endmodule
