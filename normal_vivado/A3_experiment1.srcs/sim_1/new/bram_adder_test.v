`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/20 14:21:32
// Design Name: 
// Module Name: bram_adder_test
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


module bram_adder_test;
    reg clk, nrst;
    reg [5-1:0] count;
    wire [4-1:0] data, ref_data;
    wire of;
    
    wire diff;
    
    bram_adder b0(.clk(clk), .nrst(nrst), .count(count), .data(data), .of(of));
    
    bram_ref_loader b1(
        .clk(clk), .we(1'b0), .addr(count), .w_data(), .r_data(ref_data)
    );
    
    assign diff = data != ref_data;
    
    integer i;
    
    always begin
        clk = 1'b1;
        #100 clk = ~clk;
        #100;
    end
    
    initial begin
//        $monitor(
//            "cnt: %d, data: %d, ref_data %d, overflowed: %b",
//            b0.count, data, ref_data, of
//        );
        nrst <= 1'b0;
        #200
        nrst <= 1'b1;
        count <= 5'b0;
        
        for (i=0; i < 16; i = i + 1) begin
            if (diff) begin
                $display("result does not match! addr: %d", count);
            end
            #200;
            count <= count + 1;
        end
    end
endmodule
