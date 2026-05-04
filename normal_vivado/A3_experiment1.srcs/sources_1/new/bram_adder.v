`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/20 14:15:42
// Design Name: 
// Module Name: bram_adder
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


module bram_adder(
    input wire clk, nrst,
    input wire [5-1:0] count,
    output wire [4-1:0] data,
    output wire of
    );
    
    wire [4-1:0] val1, val2;
    
    bram_example b0(
        .clk(clk), .we(1'b0), .addr(count), .w_data(), .r_data(val1)
    );
    
    bram_example b1(
        .clk(clk), .we(1'b0), .addr(count+1), .w_data(), .r_data(val2)
    );
    
    ripple_addr_of_detect #(4) adder0(
        .a(val1), .b(val2), .cin(1'b0),
        .s(data), .cout(), .overflowed(of)
    );
    
endmodule
