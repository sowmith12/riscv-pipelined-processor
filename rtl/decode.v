// Decode Stage
module decode (
    input clk, rst,
    input [31:0] InstD, PCD, PCPlus4D, WriteDataE,
    output branchE, MemReadE, MemtoRegE, MemWriteE, ALUSrcE,
    output [31:0] ReadData1E, ReadData2E, ImmExtE, PCE, PCPlus4E,
    output [1:0] ALUOpE
);
    wire branch, memRead, memtoReg, memWrite, ALUSrc, regWrite;
    wire [1:0] ALUOp;
    wire [31:0] readData1, readData2, ImmExt;

    reg ALUSrcD_r, MemWriteD_r, BranchD_r, MemReadD_r, MemtoRegD_r;
    reg [31:0] RD1_D_r, RD2_D_r, ImmExt_D_r, PCD_r, PCPlus4D_r;
    reg [1:0] ALUOpD_r;

    Control m_Control (
        .opcode(InstD[6:0]),
        .funct3(InstD[14:12]), // Assuming funct3 is used by Control
        .branch(branch),
        .memRead(memRead),
        .memtoReg(memtoReg),
        .ALUOp(ALUOp),
        .memWrite(memWrite),
        .ALUSrc(ALUSrc),
        .regWrite(regWrite)
    );

    Register m_Register (
        .clk(clk),
        .rst(rst),
        .regWrite(regWrite),
        .readReg1(InstD[19:15]),
        .readReg2(InstD[24:20]),
        .writeReg(InstD[11:7]),
        .writeData(WriteDataE),
        .readData1(readData1),
        .readData2(readData2)
    );

    ImmGen #(.Width(32)) m_ImmGen (
        .inst(InstD),
        .imm(ImmExt)
    );

    always @(posedge clk or negedge rst) begin
        if (rst == 1'b0) begin
            ALUSrcD_r <= 1'b0;
            MemWriteD_r <= 1'b0;
            BranchD_r <= 1'b0;
            RD1_D_r <= 32'h0;
            RD2_D_r <= 32'h0;
            ImmExt_D_r <= 32'h0;
            PCD_r <= 32'h0;
            PCPlus4D_r <= 32'h0;
            MemReadD_r <= 1'b0;
            MemtoRegD_r <= 1'b0;
            ALUOpD_r <= 2'b00;
        end else begin
            ALUSrcD_r <= ALUSrc;
            MemWriteD_r <= memWrite;
            BranchD_r <= branch;
            RD1_D_r <= readData1;
            RD2_D_r <= readData2;
            ImmExt_D_r <= ImmExt;
            PCD_r <= PCD;
            PCPlus4D_r <= PCPlus4D;
            MemReadD_r <= memRead;
            MemtoRegD_r <= memtoReg;
            ALUOpD_r <= ALUOp;
        end
    end

    assign ALUSrcE = ALUSrcD_r;
    assign MemWriteE = MemWriteD_r;
    assign branchE = BranchD_r;
    assign ReadData1E = RD1_D_r;
    assign ReadData2E = RD2_D_r;
    assign ImmExtE = ImmExt_D_r;
    assign PCE = PCD_r;
    assign MemReadE = MemReadD_r;
    assign MemtoRegE = MemtoRegD_r;
    assign ALUOpE = ALUOpD_r;
    assign PCPlus4E = PCPlus4D_r;
endmodule
