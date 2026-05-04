`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/20 13:13:31
// Design Name: 
// Module Name: ram_a
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


module ram_a(
    input wire clk, we,
    input wire [11-1:0] w_addr, r_addr,
    input wire [32-1:0] w_data,
    output reg [32-1:0] r_data
    );
    reg [32-1:0] mem [0:2048-1];
    always @(posedge clk) begin
        if(we) mem[w_addr] <= w_data;
        r_data <= mem[r_addr];
    end
endmodule
