`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/16 14:14:18
// Design Name: 
// Module Name: test_full_adder
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


module test_full_adder;

    reg a;
    reg b;
    reg cin;
    
    wire s;
    wire cout;
    
    integer i;

    full_adder f0(.a(a), .b(b), .cin(cin), .s(s), .cout(cout));

    initial begin
        a = 0; b = 0; cin = 0;
        
        for (i = 0; i < 8; i = i + 1) begin
            #100 
            a <= i & 1'b1;
            b <= (i >> 1)& 1'b1;
            cin <= (i >> 2)& 1'b1;
        end
        
    end;

endmodule
