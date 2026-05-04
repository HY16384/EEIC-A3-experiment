`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/20 15:37:11
// Design Name: 
// Module Name: register_file
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


module register_file(
    input wire I_clk,
    input wire I_en, I_we,
    input wire [15:0] I_dataD,
    output reg [15:0] O_dataA, O_dataB,
    input wire [2:0] I_selA, I_selB, I_selD
    );
    
    reg [15:0] register [0:7];
    
    initial begin
        // Initialize each element individually
        register[0] = 16'h0000;
        register[1] = 16'h0000;
        register[2] = 16'h0000;
        register[3] = 16'h0000;
        register[4] = 16'h0000;
        register[5] = 16'h0000;
        register[6] = 16'h0000;
        register[7] = 16'h0000;
    end
    
    always @(posedge I_clk) begin
        if (I_en) begin
            O_dataA <= register[I_selA];
            O_dataB <= register[I_selB];
        end
        if (I_we) begin
            register[I_selD] <= I_dataD;
        end
    end
endmodule
