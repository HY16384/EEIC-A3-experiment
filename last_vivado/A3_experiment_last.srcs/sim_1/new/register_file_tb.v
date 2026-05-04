`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/20 15:50:26
// Design Name: 
// Module Name: register_file_tb
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


module register_file_tb;
    reg clk;
    reg en, we;
    reg [15:0] dataD;
    wire [15:0] dataA, dataB;
    reg [2:0] addrD, addrA, addrB; 
    
    
    register_file r0(
        .I_clk(clk), .I_en(en), .I_we(we),
        .I_dataD(dataD),
        .O_dataA(dataA), .O_dataB(dataB),
        .I_selA(addrA), .I_selB(addrB), .I_selD(addrD)
    );
    
    always begin
        clk <= 1'b1;
        #100 clk <= ~clk;
        #100;
    end
    
    initial begin
        $monitor("dataA: %d, dataB: %d", dataA, dataB);
        en <= 1'b0; we <= 1'b1;
        addrA <= 3'd0;
        addrB <= 3'd1;
        addrD <= 3'd0;
        dataD <= 16'hbeef;
        #250;
        
        en <= 1'b1; we <= 1'b1;
        addrA <= 3'd0;
        addrB <= 3'd1;
        addrD <= 3'd1;
        dataD <= 16'hfeed;
        #250;
        
        en <= 1'b1; we <= 1'b0;
        addrA <= 3'd0;
        addrB <= 3'd1;
        addrD <= 3'd1;
        dataD <= 16'hbeef;
        #250;
        
        en <= 1'b0; we <= 1'b1;
        addrA <= 3'd0;
        addrB <= 3'd1;
        addrD <= 3'd1;
        dataD <= 16'hbeef;
        #250;
        
        en <= 1'b1; we <= 1'b0;
        addrA <= 3'd0;
        addrB <= 3'd1;
        addrD <= 3'd1;
        dataD <= 16'hbeef;
        #250;
        
        en <= 1'b0; we <= 1'b1;
        addrA <= 3'd0;
        addrB <= 3'd1;
        addrD <= 3'd0;
        dataD <= 16'hfeed;
        #250;
        
        en <= 1'b0; we <= 1'b0;
        addrA <= 3'd0;
        addrB <= 3'd1;
        addrD <= 3'd0;
        dataD <= 16'hfeed;
        #250;
        
        en <= 1'b1; we <= 1'b0;
        addrA <= 3'd0;
        addrB <= 3'd1;
        addrD <= 3'd0;
        dataD <= 16'hfeed;
        #250;
        
        $finish;
    end
endmodule
