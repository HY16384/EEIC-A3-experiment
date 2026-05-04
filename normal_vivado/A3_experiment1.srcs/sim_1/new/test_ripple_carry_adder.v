`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/16 14:43:20
// Design Name: 
// Module Name: test_ripple_carry_adder
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


module test_ripple_carry_adder;

    reg signed [4-1:0] a, b;
    reg cin;
    
    wire signed [4-1:0] s;
    wire cout;
    
    ripple_carry_adder #(4) adder(
        .a(a), .b(b), .cin(cin), .s(s), .cout(cout)
       );
       
    integer i;
       
    initial begin
        a = 4'd0; b = 4'd0; cin = 0;
        
        for (i = 0; i < 10; i = i + 1) begin
            a = $random & 4'b1111; b = $random & 4'b1111;
            #500 $display ("a: %d, b: %d, s: %d", a, b, s);
        end
        
    end
    
endmodule
