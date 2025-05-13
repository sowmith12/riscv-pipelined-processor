`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.03.2025 19:27:48
// Design Name: 
// Module Name: RISCV_TB
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

module RISCV_TB;
    reg clk, rst;
    wire [31:0] result;

    pipelineee dut (
        .clk(clk),
        .rst(rst),
        .result(result)
    );

    initial begin
        clk = 0;
        rst = 0;
        #10 rst = 1;
        #1000 $finish;
    end

    always #5 clk = ~clk;

    
endmodule
