`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/20 16:49:35
// Design Name: 
// Module Name: instruction_decoder
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

module instruction_decoder(
    input wire I_clk, I_en,
    input wire [15:0] I_dataInst,
    output reg [3:0] O_aluOp,
    output reg O_flag,
    output reg [7:0] O_dataImm,
    output reg O_regDwe,
    output reg [2:0] O_selA, O_selB, O_selD
    );
    
    always @(posedge I_clk) begin
        if (I_en) begin // これいるんか？
            O_aluOp <= I_dataInst[15:12];
            O_flag <= I_dataInst[8];
            O_dataImm <= I_dataInst[7:0];
            O_selA <= I_dataInst[7:5];
            O_selB <= I_dataInst[4:2];
            O_selD <= I_dataInst[11:9];
            
            case (I_dataInst[15:12])
                `OPCODE_WRITE: O_regDwe <= 1'b0;
                `OPCODE_JUMP: O_regDwe <= 1'b0;
                `OPCODE_JUMPEQ: O_regDwe <= 1'b0;
                default: O_regDwe <= 1'b1;
            endcase
        end
    end
endmodule
