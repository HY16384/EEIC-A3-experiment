`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/21 13:25:29
// Design Name: 
// Module Name: bram16
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

module bram16 #(parameter width = 32)(
    input wire I_clk, I_we,
    input wire [width-1:0] I_wAddr, I_rAddr,
    input wire [15:0] I_data,
    output reg [15:0] O_data
    );
    
    reg [15:0] mem [0:width-1];
    
    initial begin
        // test1
//        mem[0] <= {`OPCODE_LOAD, 3'b000, 1'b0, 8'hfe};
//        mem[1] <= {`OPCODE_LOAD, 3'b001, 1'b1, 8'hed};
//        mem[2] <= {`OPCODE_OR, 3'b010, 1'b0, 3'b000, 3'b001, 2'b0};
//        mem[3] <= {`OPCODE_LOAD, 3'b011, 1'b1, 8'h1};
//        mem[4] <= {`OPCODE_LOAD, 3'b100, 1'b1, 8'h2};
//        mem[5] <= {`OPCODE_ADD, 3'b011, 1'b0, 3'b011, 3'b100, 2'b0};
//        mem[6] <= {`OPCODE_OR, 3'b101, 1'b0, 3'b000, 3'b011, 2'b0};
//        mem[7] <= {`OPCODE_OR, 3'b101, 1'b0, 3'b101, 3'b101, 2'b0};

        // test2
//        mem[0] <= {`OPCODE_LOAD, 3'b000, 1'b0, 8'hfe};
//        mem[1] <= {`OPCODE_LOAD, 3'b001, 1'b1, 8'hed};
//        mem[2] <= {`OPCODE_OR, 3'b010, 1'b0, 3'b000, 3'b001, 2'b0};
//        mem[3] <= {`OPCODE_LOAD, 3'b011, 1'b1, 8'h1};
//        mem[4] <= {`OPCODE_LOAD, 3'b100, 1'b1, 8'h2};
//        mem[5] <= {`OPCODE_ADD, 3'b011, 1'b0, 3'b011, 3'b100, 2'b0};
//        mem[6] <= {`OPCODE_OR, 3'b101, 1'b0, 3'b000, 3'b011, 2'b0};
//        mem[7] <= {`OPCODE_OR, 3'b101, 1'b0, 3'b101, 3'b101, 2'b0};
//        mem[8] <= {`OPCODE_JUMP, 3'b000, 1'b1, 8'h5};

        // test3
        mem[0] <= {`OPCODE_LOAD, 3'b001, 1'b1, 8'h5};
        mem[1] <= {`OPCODE_LOAD, 3'b010, 1'b1, 8'h3};
        mem[2] <= {`OPCODE_XOR, 3'b000, 1'b0, 3'b000, 3'b000, 2'b0};
        mem[3] <= {`OPCODE_LOAD, 3'b011, 1'b1, 8'h1};
        mem[4] <= {`OPCODE_LOAD, 3'b110, 1'b1, 8'hb};
        mem[5] <= {`OPCODE_OR, 3'b100, 1'b0, 3'b010, 3'b010, 2'b0};
        mem[6] <= {`OPCODE_CMP, 3'b101, 1'b0, 3'b100, 3'b000, 2'b0};
        mem[7] <= {`OPCODE_JUMPEQ, 3'b000, 1'b0, 3'b101, 3'b110, 2'b10};
        mem[8] <= {`OPCODE_SUB, 3'b100, 1'b0, 3'b100, 3'b011, 2'b00};
        mem[9] <= {`OPCODE_ADD, 3'b000, 1'b0, 3'b000, 3'b001, 2'b00};
        mem[10] <= {`OPCODE_JUMP, 3'b000, 1'b1, 8'h6};
        mem[11] <= {`OPCODE_JUMP, 3'b000, 1'b1, 8'hb};
        mem[12] <= 16'b0;
        mem[13] <= 16'b0;
        mem[14] <= 16'b0;
    end
    
    always @(posedge I_clk) begin
        if (I_we) mem[I_wAddr] <= I_data;
        O_data <= mem[I_rAddr];
    end
endmodule
