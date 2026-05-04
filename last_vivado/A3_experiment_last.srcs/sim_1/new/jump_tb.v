`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/23 16:22:46
// Design Name: 
// Module Name: jump_tb
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

`include "pc_opcode.vh"

module jump_tb;
    reg clk, reset;
    wire [4:0] en;
    wire we, flag;
    wire we_out, jump;
    wire [15:0] pc;
    wire [15:0] dataA, dataB, dataInst;
    wire [15:0] dataResult;
    wire [7:0] dataImm;
    wire [3:0] aluop;
    
    wire [2:0] selD, selA, selB;
    
    wire en_fetch, en_inst, en_reg_read, en_alu, en_reg_write;
    
    // ram fetchのステートありなしの比較を入れる
    assign en_fetch = en[0];
    assign en_inst = en[1];
    assign en_reg_read = en[2];
    assign en_alu = en[3];
    assign en_reg_write = en[4];
    
    instruction_decoder i0(
        .I_clk(clk), .I_en(en_inst), .I_dataInst(dataInst), 
        .O_aluOp(aluop), .O_flag(flag),
        .O_dataImm(dataImm), .O_regDwe(we), 
        .O_selA(selA), .O_selB(selB), .O_selD(selD)
    );
    
    alu a0(
        .I_clk(clk), .I_en(en_alu), .I_aluOp(aluop), .I_flag(flag),
        .I_dataA(dataA), .I_dataB(dataB),
        .I_pc(pc), .I_dataImm(dataImm), .I_regDWe(we),
        .O_dataResult(dataResult), .O_regDWe(we_out),
        .O_needJump(jump)
    );
    
    register_file r0(
        .I_clk(clk), .I_en(en_reg_read | en_reg_write), .I_we(we_out & en_reg_write),
        .I_dataD(dataResult),
        .O_dataA(dataA), .O_dataB(dataB),
        .I_selA(selA), .I_selB(selB), .I_selD(selD)
    );
    
    
    fsm #(5) f0(
        .I_clk(clk), .I_reset(reset), .O_state(en)
    );
    
    reg [1:0] pc_opcode;
    
    pc p0(
        .I_clk(clk), .I_newPc(dataResult), .I_newPcOp(pc_opcode), .O_pc(pc)
    );
    
    reg ram_we;
    reg [15:0] ram_wData;
    wire [15:0] ram_rData;
    reg [31:0] ram_wAddr;
    
    bram16 #(32) ram0(
        .I_clk(clk), .I_we(ram_we),
        .I_wAddr(ram_wAddr), .I_rAddr(32'b0 | pc), 
        .I_data(ram_wData), .O_data(ram_rData)
    );
    
    assign dataInst = ram_rData;
    
    always begin
        clk <= 1'b1;
        pc_opcode <= reset ? `PC_OP_RESET : (jump ? `PC_OP_ASSIGN : (en_reg_write ? `PC_OP_INC : `PC_OP_NOP));
        #100 clk <= ~clk;
        #100;
    end
    
    initial begin
        ram_wData <= 32'hffff;
        ram_we <= 1'b0;
        #200;
        reset <= 1'b1;
        #500;
        reset <= 1'b0;
        #100000;
        reset <= 1'b1;
    end
endmodule
