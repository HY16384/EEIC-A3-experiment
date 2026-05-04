`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/23 14:51:09
// Design Name: 
// Module Name: pc
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

module pc(
    input wire I_clk,
    input wire [15:0] I_newPc,
    input wire [1:0] I_newPcOp,
    output wire [15:0] O_pc
    );
    
    reg [15:0] pc;
    
    always @(posedge I_clk) begin
        case(I_newPcOp)
            `PC_OP_NOP: ;
            `PC_OP_INC: begin
                pc <= pc + 1'b1;
            end
            `PC_OP_ASSIGN: begin
                pc <= I_newPc;
            end
            `PC_OP_RESET: begin
                pc <= 16'b0;
            end
        endcase
    end
    assign O_pc = pc;
endmodule
