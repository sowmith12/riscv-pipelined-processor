module Register (
    input clk, rst, regWrite,
    input [4:0] readReg1, readReg2, writeReg,
    input [31:0] writeData,
    output [31:0] readData1, readData2
);
    reg [31:0] regs [0:31];
    assign readData1 = (readReg1 != 0) ? regs[readReg1] : 0;
    assign readData2 = (readReg2 != 0) ? regs[readReg2] : 0;

    always @(posedge clk) begin
        if (~rst) begin
            regs[0] <= 0; regs[1] <= 0; regs[2] <= 32'd128; regs[3] <= 0;
            regs[4] <= 0; regs[5] <= 0; regs[6] <= 0; regs[7] <= 0;
            regs[8] <= 0; regs[9] <= 0; regs[10] <= 0; regs[11] <= 0;
            regs[12] <= 0; regs[13] <= 0; regs[14] <= 0; regs[15] <= 0;
            regs[16] <= 0; regs[17] <= 0; regs[18] <= 0; regs[19] <= 0;
            regs[20] <= 0; regs[21] <= 0; regs[22] <= 0; regs[23] <= 0;
            regs[24] <= 0; regs[25] <= 0; regs[26] <= 0; regs[27] <= 0;
            regs[28] <= 0; regs[29] <= 0; regs[30] <= 0; regs[31] <= 0;
        end else if (regWrite && writeReg != 0)
            regs[writeReg] <= writeData;
    end
endmodule
