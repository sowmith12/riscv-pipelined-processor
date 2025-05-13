module DataMemory(
    input rst,
    input clk,
    input memWrite,
    input memRead,
    input [31:0] address,
    input [31:0] writeData,
    output reg [31:0] readData
);
    // Do not modify this file!

    reg [7:0] data_memory [127:0];
    always @ (posedge clk) begin
        if(~rst) begin
            data_memory[0] <= 8'b0;
            data_memory[1] <= 8'b0;
            data_memory[2] <= 8'b0;
            data_memory[3] <= 8'b0;
            data_memory[4] <= 8'b0;
            data_memory[5] <= 8'b0;
            data_memory[6] <= 8'b0;
            data_memory[7] <= 8'b0;
            data_memory[8] <= 8'b0;
            data_memory[9] <= 8'b0;
            data_memory[10] <= 8'b0;
            data_memory[11] <= 8'b0;
            data_memory[12] <= 8'b0;
            data_memory[13] <= 8'b0;
            data_memory[14] <= 8'b0;
            data_memory[15] <= 8'b0;
            data_memory[16] <= 8'b0;
            data_memory[17] <= 8'b0;
            data_memory[18] <= 8'b0;
            data_memory[19] <= 8'b0;
            data_memory[20] <= 8'b0;
            data_memory[21] <= 8'b0;
            data_memory[22] <= 8'b0;
            data_memory[23] <= 8'b0;
            data_memory[24] <= 8'b0;
            data_memory[25] <= 8'b0;
            data_memory[26] <= 8'b0;
            data_memory[27] <= 8'b0;
            data_memory[28] <= 8'b0;
            data_memory[29] <= 8'b0;
            data_memory[30] <= 8'b0;
            data_memory[31] <= 8'b0;
            data_memory[32] <= 8'b0;
            data_memory[33] <= 8'b0;
            data_memory[34] <= 8'b0;
            data_memory[35] <= 8'b0;
            data_memory[36] <= 8'b0;
            data_memory[37] <= 8'b0;
            data_memory[38] <= 8'b0;
            data_memory[39] <= 8'b0;
            data_memory[40] <= 8'b0;
            data_memory[41] <= 8'b0;
            data_memory[42] <= 8'b0;
            data_memory[43] <= 8'b0;
            data_memory[44] <= 8'b0;
            data_memory[45] <= 8'b0;
            data_memory[46] <= 8'b0;
            data_memory[47] <= 8'b0;
            data_memory[48] <= 8'b0;
            data_memory[49] <= 8'b0;
            data_memory[50] <= 8'b0;
            data_memory[51] <= 8'b0;
            data_memory[52] <= 8'b0;
            data_memory[53] <= 8'b0;
            data_memory[54] <= 8'b0;
            data_memory[55] <= 8'b0;
            data_memory[56] <= 8'b0;
            data_memory[57] <= 8'b0;
            data_memory[58] <= 8'b0;
            data_memory[59] <= 8'b0;
            data_memory[60] <= 8'b0;
            data_memory[61] <= 8
