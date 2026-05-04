`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/20 13:38:59
// Design Name: 
// Module Name: sim_bram_read_test
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


module sim_bram_read_test;
    reg clk, nrst;
    wire [4-1:0] data;
    
    bram_read_test b0(.clk(clk), .nrst(nrst), .data(data));
    
    always begin
        clk = 1'b1;
        #100 clk = ~clk;
        #100;
    end
    
    initial begin
        $monitor("cnt: %d, data: %d", b0.count, data);
        nrst <= 1'b0;
        #200
        nrst <= 1'b1;
        #(16*200);
    end
endmodule
