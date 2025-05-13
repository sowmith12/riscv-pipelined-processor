module pipelineee (
    input clk,
    input start,
    output [31:0] result
);

    // Fetch to Decode wires
    wire [31:0] InstD, PCD, PCPlus4D;
    wire [31:0] PCTarget;

    // Decode to Execute wires
    wire branchE, MemReadE, MemtoRegE, MemWriteE, ALUSrcE;
    wire [1:0] ALUOpE;
    wire [31:0] ReadData1E, ReadData2E, ImmExtE, PCE, PCPlus4E;

    // Execute to Memory wires
    wire [31:0] ALUOutM, WriteDataM, PCPlus4M;
    wire ZeroM, branchM, PCSrcE, MemWriteM, MemReadM, MemtoRegM;

    // Memory to Writeback wires
    wire [31:0] ReadDataW, ALUOutW;
    wire MemtoRegW;

    // Writeback to Decode
    wire [31:0] WriteDataE;

    // Fetch Stage
    fetch fetch_stage (
        .clk(clk),
        .rst(start),
        .PCSrcE(PCSrcE),
        .PCTarget(PCTarget),
        .InstD(InstD),
        .PCD(PCD),
        .PCPlus4D(PCPlus4D)
    );

    // Decode Stage
    decode decode_stage (
        .clk(clk),
        .rst(start),
        .InstD(InstD),
        .PCD(PCD),
        .PCPlus4D(PCPlus4D),
        .WriteDataE(WriteDataE),
        .branchE(branchE),
        .MemReadE(MemReadE),
        .MemtoRegE(MemtoRegE),
        .ALUOpE(ALUOpE),
        .MemWriteE(MemWriteE),
        .ALUSrcE(ALUSrcE),
        .ReadData1E(ReadData1E),
        .ReadData2E(ReadData2E),
        .PCE(PCE),
        .ImmExtE(ImmExtE),
        .PCPlus4E(PCPlus4E)
    );

    // Execute Stage
    execute execute_stage (
        .clk(clk),
        .rst(start),
        .ALUSrcE(ALUSrcE),
        .MemWriteE(MemWriteE),
        .branchE(branchE),
        .MemReadE(MemReadE),
        .MemtoRegE(MemtoRegE),
        .ReadData1E(ReadData1E),
        .ReadData2E(ReadData2E),
        .ImmExtE(ImmExtE),
        .PCE(PCE),
        .PCPlus4E(PCPlus4E),
        .InstD(InstD),
        .PCTarget(PCTarget),
        .ALUOpE(ALUOpE),
        .ALUOutM(ALUOutM),
        .ZeroM(ZeroM),
        .branchM(branchM),
        .MemtoRegM(MemtoRegM),
        .MemWriteM(MemWriteM),
        .MemReadM(MemReadM),
        .PCSrcE(PCSrcE),
        .WriteDataM(WriteDataM),
        .PCPlus4M(PCPlus4M)
    );

    // Memory Stage
    memory memory_stage (
        .clk(clk),
        .rst(start),
        .MemReadM(MemReadM),
        .MemtoRegM(MemtoRegM),
        .MemWriteM(MemWriteM),
        .ZeroM(ZeroM),
        .branchM(branchM),
        .PCPlus4M(PCPlus4M),
        .WriteDataM(WriteDataM),
        .ALUOutM(ALUOutM),
        .ReadDataW(ReadDataW),
        .ALUOutW(ALUOutW),
        .MemtoRegW(MemtoRegW)
    );

    // Writeback Stage
    writeback writeback_stage (
        .clk(clk),
        .rst(start),
        .ReadDataW(ReadDataW),
        .ALUOutW(ALUOutW),
        .MemtoRegW(MemtoRegW),
        .WriteDataE(WriteDataE)
    );

    assign result = WriteDataE;
endmodule
