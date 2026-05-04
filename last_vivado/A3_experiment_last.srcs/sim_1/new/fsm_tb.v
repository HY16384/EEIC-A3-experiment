`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/23 13:33:17
// Design Name: 
// Module Name: fsm_tb
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

module fsm_tb;
    
    reg clk, reset;
    wire [3:0] en;
    wire we, flag;
    wire we_out, jump;
    reg [15:0] pc, dataInst;
    wire [15:0] dataA, dataB;
    wire [15:0] dataResult;
    wire [7:0] dataImm;
    wire [3:0] aluop;
    
    wire [2:0] selD, selA, selB;
    
    wire en_inst, en_reg_read, en_alu, en_reg_write;
    
    assign en_inst = en[0];
    assign en_reg_read = en[1];
    assign en_alu = en[2];
    assign en_reg_write = en[3];
    
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
    
    
    fsm f0(
        .I_clk(clk), .I_reset(reset), .O_state(en)
    );
    
    always begin
        clk <= 1'b1;
        #100 clk <= ~clk;
        #100;
    end
    
    initial begin
        reset <= 1'b1;
        dataInst <= {`OPCODE_LOAD, 3'b000, 1'b0, 8'hfe};
        #100;
        reset <= 1'b0;
        #1000;
        
        dataInst <= {`OPCODE_LOAD, 3'b001, 1'b1, 8'hed};
        #1000;
        
        dataInst <= {`OPCODE_OR, 3'b010, 1'b0, 3'b000, 3'b001, 2'b0};
        #1000;
        
        dataInst <= {`OPCODE_LOAD, 3'b011, 1'b1, 8'h1};
        #1000;
        
        dataInst <= {`OPCODE_LOAD, 3'b100, 1'b1, 8'h2};
        #1000;
        
        dataInst <= {`OPCODE_ADD, 3'b011, 1'b0, 3'b011, 3'b100, 2'b0};
        #1000;
        
        dataInst <= {`OPCODE_OR, 3'b101, 1'b0, 3'b000, 3'b011, 2'b0};
        #1000;
    end
        
endmodule
