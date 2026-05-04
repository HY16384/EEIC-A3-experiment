`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/16 15:07:10
// Design Name: 
// Module Name: test_adder_compare
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


module test_adder_compare;
    reg signed [4-1:0] a, b;
    reg cin;
    
    wire signed [4-1:0] s0, s1;
    wire cout;
    
    ripple_carry_adder #(4) adder0(
        .a(a), .b(b), .cin(cin), .s(s0), .cout(cout)
       );
       
    integer i, j;
    
    adder_operator #(4) adder1(
        .a(a), .b(b), .s(s1)
        );
        
    integer n_correct, is_wrong;
        
    initial begin
        cin = 0;
        n_correct = 0;
        is_wrong = 1'b0;
        for(i = 0; i < 4'b1111; i = i+1) begin
            for (j = 0; j < 4'b1111; j = j+1) begin
                #10
                a = i; b = j;
                if (s0 == s1) begin
                    n_correct = n_correct + 1;
                    is_wrong = 1'b0;
                end
                else
                    is_wrong = 1'b1;
                
                $display("a: %d, b: %d, s0: %d, s1: %d", a, b, s0, s1);
            end
        end
    end
        
    
endmodule
