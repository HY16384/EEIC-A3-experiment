`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/20 14:52:32
// Design Name: 
// Module Name: bram_example_expanded
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


module bram_example_expanded(
    input wire  clk,
    output wire [3:0] r_data
    );
    
    bram_example b0(.clk(clk), .we(1'b0), .addr(), .w_data(), .r_data());
    
    always @(posedge clk) begin
        
    
endmodule
