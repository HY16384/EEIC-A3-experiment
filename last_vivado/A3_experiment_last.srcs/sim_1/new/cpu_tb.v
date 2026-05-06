`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/05/07 00:39:50
// Design Name: 
// Module Name: cpu_tb
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

module cpu_tb;
    reg clk, reset;
    
    wire [15:0] pc, dataResult;
    wire [3:0] aluop;
    
    cpu c0(.I_clk(clk), .I_rst(reset), .O_pc(pc), .O_dataResult(dataResult), .O_aluop(aluop));
    
    always begin
        clk <= 1'b1;
        #100 clk <= ~clk;
        #100;
    end
    
    initial begin
        #200;
        reset <= 1'b1;
        #500;
        reset <= 1'b0;
        #100000;
        reset <= 1'b1;
    end
endmodule
