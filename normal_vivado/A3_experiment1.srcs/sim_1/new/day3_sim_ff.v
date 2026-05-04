`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/16 15:49:01
// Design Name: 
// Module Name: day3_sim_ff
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


module day3_sim_ff;
    reg clk;
    
    always begin
        clk = 1'b1;
        #100 clk = ~clk;
        #100;
    end
    
    reg a;
    wire out1, out2;
    
    example e0(.inA(a), .clk(clk), .out1(out1), .out2(out2));
    
    initial begin
        a = 1'b0;
        repeat(20) #15 a = ~a;
        $finish;
    end

endmodule
