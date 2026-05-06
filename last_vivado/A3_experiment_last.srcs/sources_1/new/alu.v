`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/21 13:36:00
// Design Name: 
// Module Name: alu
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
`include "cmp_map.vh"

module alu(
    input wire I_clk, I_en,
    input wire [3:0] I_aluOp,
    input wire I_flag,
    input wire [15:0] I_dataA, I_dataB,
    input wire [15:0] I_pc,
    input wire [7:0] I_dataImm,
    input wire I_regDWe,
    output reg [15:0] O_dataResult,
    output reg O_regDWe,
    output reg O_needJump
    );
    
    wire [15:0] s_a, s_s;
    wire cout_a, cout_s;
    
    ripple_carry_adder #(16) adder0(
        .a(I_dataA), .b(I_dataB), .cin(1'b0), .s(s_a), .cout(cout_a)
    );
    
    ripple_carry_adder #(16) sub0(
        .a(I_dataA), .b(~(I_dataB)+1'b1), .cin(1'b0), .s(s_s), .cout(cout_s)
    );
    
    always @(posedge I_clk) begin
        if (I_en) begin
            O_regDWe <= I_regDWe; // clkで同期をとらないといけないということ？たしかに enableの話もある？
            
            case (I_aluOp)
                `OPCODE_ADD: begin
                    O_dataResult <= s_a;
                    O_needJump <= 1'b0;
                end
                
                `OPCODE_SUB: begin
                    O_dataResult <= s_s;
                    O_needJump <= 1'b0;
                end
            
                `OPCODE_OR: begin
                    O_dataResult <= I_dataA | I_dataB;
                    O_needJump <= 1'b0;
                end
                
                `OPCODE_XOR: begin
                    O_dataResult <= I_dataA ^ I_dataB;
                    O_needJump <= 1'b0;
                end
                
                `OPCODE_AND: begin
                    O_dataResult <= I_dataA & I_dataB;
                    O_needJump <= 1'b0;
                end
                
                `OPCODE_NOT: begin
                    O_dataResult <= ~I_dataA;
                    O_needJump <= 1'b0;
                end
                
                `OPCODE_READ: begin
                end
                
                `OPCODE_WRITE: begin
                end
                    
                
                `OPCODE_LOAD: begin
                    if (I_flag) begin
                        O_dataResult <= I_dataImm;
                    end
                    else begin
                        O_dataResult <= 16'b0 | (I_dataImm << 8);
                    end
                    O_needJump <= 1'b0;
                end
                
                
                `OPCODE_CMP: begin
                    O_dataResult[`CMP_BIT_AEB] <= (I_dataA == I_dataB);
                    O_dataResult[`CMP_BIT_AZ] <= (I_dataA == 0);
                    O_dataResult[`CMP_BIT_BZ] <= (I_dataB == 0);
                    if (I_flag) begin
                        O_dataResult[`CMP_BIT_AGB]
                            <= ($signed(I_dataA) > $signed(I_dataB));
                        O_dataResult[`CMP_BIT_ALB] 
                            <= ($signed(I_dataA) < $signed(I_dataB));
                    end else begin
                        O_dataResult[`CMP_BIT_AGB] <= (I_dataA > I_dataB);
                        O_dataResult[`CMP_BIT_ALB] <= (I_dataA < I_dataB);
                    end
                    
                    O_dataResult[`CMP_BIT_UNUSED0] <= 1'b0;
                    O_dataResult[`CMP_BIT_UNUSED1] <= 1'b0;
                    O_dataResult[`CMP_BIT_UNUSED2] <= 1'b0;
                    O_dataResult[`CMP_BIT_UNUSED3] <= 1'b0;
                    O_dataResult[`CMP_BIT_UNUSED4] <= 1'b0;
                    O_dataResult[`CMP_BIT_UNUSED5] <= 1'b0;
                    O_dataResult[`CMP_BIT_UNUSED6] <= 1'b0;
                    O_dataResult[`CMP_BIT_UNUSED7] <= 1'b0;
                    O_dataResult[`CMP_BIT_UNUSED8] <= 1'b0;
                    O_dataResult[`CMP_BIT_UNUSED9] <= 1'b0;
                    O_dataResult[`CMP_BIT_UNUSED10] <= 1'b0;
                    
                    O_needJump <= 1'b0;
                end
                
                `OPCODE_SHL: begin
                    if (I_flag) begin // arithmatic
                        O_dataResult <= $signed(I_dataB) <<< I_dataA;
                    end
                    else begin // logical
                        O_dataResult <= I_dataB << I_dataA;
                    end
                    O_needJump <= 1'b0;
                end
                
                `OPCODE_SHR: begin
                    if (I_flag) begin // arithmatic
                        O_dataResult <= $signed(I_dataB) >>> I_dataA;
                    end
                    else begin // logical
                        O_dataResult <= I_dataB >> I_dataA;
                    end
                    O_needJump <= 1'b0;
                end
                
                `OPCODE_JUMP: begin
                    if (I_flag) begin
                        O_dataResult <= 16'b0 | I_dataImm;
                    end 
                    else begin
                        O_dataResult <= (16'b0 | I_dataA);
                    end
                    O_needJump <= 1'b1;
                end
                
                `OPCODE_JUMPEQ: begin
                    O_dataResult <= 16'b0 | I_dataB;
                    case ((I_flag << 2) | (I_dataImm[1:0]))
                        `CMP_FLAG_EQ: begin
                            O_needJump <= I_dataA[`CMP_BIT_AEB];
                        end
                        `CMP_FLAG_ANB: begin
                            O_needJump <= ~I_dataA[`CMP_BIT_AEB];
                        end
                        `CMP_FLAG_AZ: begin
                            O_needJump <= I_dataA[`CMP_BIT_AZ];
                        end
                        `CMP_FLAG_BZ: begin
                            O_needJump <= I_dataA[`CMP_BIT_BZ];
                        end
                        `CMP_FLAG_ANZ: begin
                            O_needJump <= ~I_dataA[`CMP_BIT_AZ];
                        end
                        `CMP_FLAG_BNZ: begin
                            O_needJump <= ~I_dataA[`CMP_BIT_BZ];
                        end
                        `CMP_FLAG_AGB: begin
                            O_needJump <= I_dataA[`CMP_BIT_AGB];
                        end
                        `CMP_FLAG_ALB: begin
                            O_needJump <= I_dataA[`CMP_BIT_ALB];
                        end
                    endcase
                end
                
                default: begin
                    O_dataResult <= 16'b0;
                end 
            endcase
        end
    end
                
endmodule
