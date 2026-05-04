`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/16 13:56:43
// Design Name: 
// Module Name: test_d_ff
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


module test_d_ff;
// parameter
    parameter CYCLE = 1000; // clock cycle
    parameter HALF_CYCLE = 500; // half cycle
    parameter DLY = 500; // delay
    
    // wire/reg
    reg clk;
    reg d;
    reg rst;
    wire out;

    // DUT module
    d_flipflop d0 (
        .CLK(clk),
        .NRST(~rst),
        .d(d),
        .q(out)
    );

    // clock generator
    always begin
        clk = 1'b1;
        #(HALF_CYCLE) clk = 1'b0;
        #(HALF_CYCLE);
    end
    
    initial begin
        d = 1'b0;
        rst = 1'b0;
        
        #(50)
        
        repeat(10) #(100) d = ~d;
        
        rst = 1'b1;
        
        repeat(10) #(100) d = ~d;
    end
endmodule
