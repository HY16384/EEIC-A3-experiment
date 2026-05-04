`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/16 12:55:15
// Design Name: 
// Module Name: testbench_xor
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


module testbench_xor;

    // parameter
    parameter CYCLE = 1000; // clock cycle
    parameter HALF_CYCLE = 500; // half cycle
    parameter DLY = 500; // delay
    
    // wire/reg
    reg clk;
    reg inA, inB;
    wire out_xor_gate;
    
    xor_gate xor_gate_0 (
        .inA(inA),
        .inB(inB),
        .out(out_xor_gate)
    );
    
    // clock generator
    always begin
        clk = 1'b1;
        #(HALF_CYCLE) clk = 1'b0;
        #(HALF_CYCLE);
    end
    
    // test scenario
    initial begin
        // initialize
        inA = 1'b0; inB = 1'b0;
        
        inA = 1'b0; inB = 1'b0;
        #100 $display("inA=%b inB=%b out=%b", inA, inB, out_xor_gate);
        inA = 1'b1; inB = 1'b0;
        #100 $display("inA=%b inB=%b out=%b", inA, inB, out_xor_gate);  
        inA = 1'b0; inB = 1'b1;
        #100 $display("inA=%b inB=%b out=%b", inA, inB, out_xor_gate);  
        inA = 1'b1; inB = 1'b1;
        #100 $display("inA=%b inB=%b out=%b", inA, inB, out_xor_gate);

        repeat(10) @(posedge clk); // repeat 10 times
        $finish;
    end

endmodule
