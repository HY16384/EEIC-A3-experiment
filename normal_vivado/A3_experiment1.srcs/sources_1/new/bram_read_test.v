`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/20 13:38:29
// Design Name: 
// Module Name: bram_read_test
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


module bram_read_test(
    input wire clk, nrst,
    output wire [4-1:0] data
    );
    
    reg [5-1:0] count;
    
    bram_example b0(
        .clk(clk), .we(1'b0), .addr(count), .w_data(), .r_data(data)
    );
    
    always @(posedge clk) begin
        if (nrst != 1'b1) count <= 4'b0;
        else count <= count + 1;
    end
    
endmodule
