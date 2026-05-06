`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/05/07 00:31:16
// Design Name: 
// Module Name: cpu
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

module cpu(
    input wire I_clk, I_rst,
    output wire [15:0] O_pc, O_dataResult,
    output wire [3:0] O_aluop
    );
    
    wire [4:0] en;
    wire [15:0] pc;
    wire we, flag;
    wire we_out, jump;
    wire [15:0] dataA, dataB, dataInst, dataResult;
    wire [7:0] dataImm;
    wire [3:0] aluop;
    
    assign O_pc = pc;
    assign O_dataResult = dataResult;
    assign O_aluop = aluop;
    
    wire [2:0] selD, selA, selB;
    
    wire en_fetch, en_inst, en_reg_read, en_alu, en_reg_write;
    
    assign en_fetch = en[0];
    assign en_inst = en[1];
    assign en_reg_read = en[2];
    assign en_alu = en[3];
    assign en_reg_write = en[4];
    
    instruction_decoder i0(
        .I_clk(I_clk), .I_en(en_inst), .I_dataInst(dataInst), 
        .O_aluOp(aluop), .O_flag(flag),
        .O_dataImm(dataImm), .O_regDwe(we), 
        .O_selA(selA), .O_selB(selB), .O_selD(selD)
    );
    
    alu a0(
        .I_clk(I_clk), .I_en(en_alu), .I_aluOp(aluop), .I_flag(flag),
        .I_dataA(dataA), .I_dataB(dataB),
        .I_pc(pc), .I_dataImm(dataImm), .I_regDWe(we),
        .O_dataResult(dataResult), .O_regDWe(we_out),
        .O_needJump(jump)
    );
    
    register_file r0(
        .I_clk(I_clk), .I_en(en_reg_read | en_reg_write), .I_we(we_out & en_reg_write),
        .I_dataD(dataResult),
        .O_dataA(dataA), .O_dataB(dataB),
        .I_selA(selA), .I_selB(selB), .I_selD(selD)
    );
    
    
    fsm #(5) f0(
        .I_clk(I_clk), .I_reset(I_rst), .O_state(en)
    );
    
    wire [1:0] pc_opcode;
    
    assign pc_opcode = I_rst ? `PC_OP_RESET : 
                   (jump ? `PC_OP_ASSIGN : 
                   (en_reg_write ? `PC_OP_INC : `PC_OP_NOP));
    
    pc p0(
        .I_clk(I_clk), .I_newPc(dataResult), .I_newPcOp(pc_opcode), .O_pc(pc)
    );
    
    bram16 #(32) ram0(
        .I_clk(I_clk), .I_we(1'b0),
        .I_wAddr(32'b0), .I_rAddr(32'b0 | pc), 
        .I_data(16'b0), .O_data(dataInst)
    );
    
//    always @(posedge I_clk) begin
//        if (I_rst) begin
//            pc_opcode <= `PC_OP_RESET;
//        end else begin
//            if (jump) begin
//                pc_opcode <= `PC_OP_ASSIGN;
//            end else begin
//                if (en_reg_write) begin
//                    pc_opcode <= `PC_OP_INC;
//                end else begin
//                    pc_opcode <= `PC_OP_NOP;
//                end
//            end 
//        end
//    end
endmodule
