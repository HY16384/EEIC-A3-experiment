`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/23 13:29:34
// Design Name: 
// Module Name: fsm
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


module fsm #(
    parameter num = 6
    )(
    input wire I_clk, I_reset,
    output reg [num-1:0] O_state
    );
    
    always @(posedge I_clk) begin
        if (I_reset) begin
            O_state <= 1'b1;
        end
        else begin
            if ((O_state >> (num-1)) == 1'b1) begin
                O_state <= 1'b1;
            end
            else begin
                O_state <= (O_state << 1);
            end
        end
    end
    
endmodule
