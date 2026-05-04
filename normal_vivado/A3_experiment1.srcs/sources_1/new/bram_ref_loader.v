`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/20 14:24:04
// Design Name: 
// Module Name: bram_ref_loader
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


module bram_ref_loader(
    input wire  clk, we,
    input wire [4:0] addr,
    input wire [3:0] w_data,
    output wire [3:0] r_data
);

    reg [3:0] mem [0:31];
    reg [3:0] mem_out;

    initial begin
        $readmemh("C:/Users/mount/A3_experiment1/ref.hex", mem);
    end
    
    always @(posedge clk) begin
        if (we) mem[addr] <= w_data;  // synchronous write
        mem_out <= mem[addr];  // synchronous read
    end
    
    assign r_data = mem_out;
endmodule
