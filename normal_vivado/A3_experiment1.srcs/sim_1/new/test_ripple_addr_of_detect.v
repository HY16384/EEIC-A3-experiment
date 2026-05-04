`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/16 15:41:23
// Design Name: 
// Module Name: test_ripple_addr_of_detect
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


module test_ripple_addr_of_detect;
    reg signed [4-1:0] a, b;
    reg cin;
    
    wire signed [4-1:0] s;
    wire cout;
    wire overflowed;
    
    ripple_addr_of_detect #(4) adder0(
        .a(a), .b(b), .cin(cin), .s(s), .cout(cout), .overflowed(overflowed)
       );
       
    integer i, j;
        
    initial begin
        cin = 0;
        for(i = 0; i < 4'b1111; i = i+1) begin
            for (j = 0; j < 4'b1111; j = j+1) begin
                #10
                a = i; b = j;
                $display("a: %d, b: %d, s: %d, overflowed: %b", a, b, s, overflowed);
            end
        end
    end
endmodule
