`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/21 15:56:33
// Design Name: 
// Module Name: alu_tb
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

`include "instructions.vh"

module alu_tb;
    reg clk;
    reg en, we, flag;
    wire we_out, jump;
    reg [15:0] pc, dataA, dataB;
    wire [15:0] dataResult;
    reg [7:0] dataImm;
    reg [3:0] aluop;
    
    
    alu a0(
        .I_clk(clk), .I_en(en), .I_aluOp(aluop), .I_flag(flag),
        .I_dataA(dataA), .I_dataB(dataB),
        .I_pc(pc), .I_dataImm(dataImm), .I_regDWe(we),
        .O_dataResult(dataResult), .O_regDWe(we_out),
        .O_needJump(jump)
    );
    
    always begin
        clk <= 1'b1;
        #100 clk <= ~clk;
        #100;
    end
    
    initial begin
        en <= 1'b1;
        pc <= 1'b0;
        we <= 1'b0;
    
        #200;
        dataA <= 16'd1;
        dataB <= 16'd2;
        aluop <= `OPCODE_ADD;
        flag <= 1'b0;
        dataImm <= 16'hf1fa;
        
        #200;
        dataA <= 16'd5;
        dataB <= 16'd3;
        aluop <= `OPCODE_SUB;
        
        #200;
        dataA <= 16'hfeee;
        dataB <= 16'd0;
        aluop <= `OPCODE_CMP;
        
        #200;
    end
    
endmodule
