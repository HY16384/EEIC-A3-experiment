`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/16 14:30:28
// Design Name: 
// Module Name: ripple_carry_adder
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


// https://www.chipverify.com/verilog/verilog-generate-block
// https://stackoverflow.com/questions/8668143/how-to-define-a-module-with-a-parameter-in-verilog
module ripple_carry_adder #(
    parameter width=4
)(
    input wire [width-1:0] a, b,
    input wire cin,
    output wire [width-1:0] s,
    output wire cout
);

    wire [width:0] c_temp;
    
    assign c_temp[0] = cin;
    assign cout = c_temp[width];
    
    genvar i;
    
    for(i=0; i< width; i = i+1) begin
        full_adder f(
            .a(a[i]), .b(b[i]), .cin(c_temp[i]), .s(s[i]), .cout(c_temp[i+1])
        );
    end
    
endmodule
