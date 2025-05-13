// Execute Stage
module execute (
    input clk, rst, ALUSrcE, MemWriteE, branchE, MemReadE, MemtoRegE,
    input [31:0] ReadData1E, ReadData2E, ImmExtE, PCE, PCPlus4E, InstD,
    input [1:0] ALUOpE,
    output [31:0] ALUOutM, WriteDataM, PCTarget, PCPlus4M,
    output ZeroM, branchM, PCSrcE, MemWriteM, MemReadM, MemtoRegM
);
    wire [31:0] ImmExtShift, SrcB, ALUOut;
    wire Zero;
    wire [3:0] ALUCtl;

    reg MemWriteE_r, ZeroE_r, MemtoRegE_r, MemReadE_r, branchE_r;
    reg [31:0] ALUOutE_r, WriteDataE_r;

    ShiftLeftOne m_ShiftLeftOne (
        .i(ImmExtE),
        .o(ImmExtShift)
    );

    Adder m_Adder_2 (
        .a(PCE),
        .b(ImmExtShift),
        .sum(PCTarget)
    );

    Mux2to1 #(.size(32)) m_Mux_ALU (
        .sel(ALUSrcE),
        .s0(ReadData2E),
        .s1(ImmExtE),
        .out(SrcB)
    );

    ALUCtrl m_ALUCtrl (
        .ALUOp(ALUOpE),
        .funct7(InstD[31:25]),
        .funct3(InstD[14:12]),
        .ALUCtl(ALUCtl)
    );

    ALU m_ALU (
        .ALUCtl(ALUCtl),
        .A(ReadData1E),
        .B(SrcB),
        .ALUOut(ALUOut),
        .zero(Zero)
    );

    always @(posedge clk or negedge rst) begin
        if (rst == 1'b0) begin
            MemWriteE_r <= 0;
            ALUOutE_r <= 32'b0;
            ZeroE_r <= 0;
            MemtoRegE_r <= 0;
            MemReadE_r <= 0;
            branchE_r <= 0;
            WriteDataE_r <= 32'b0;
        end else begin
            MemWriteE_r <= MemWriteE;
            ALUOutE_r <= ALUOut;
            ZeroE_r <= Zero;
            MemtoRegE_r <= MemtoRegE;
            MemReadE_r <= MemReadE;
            branchE_r <= branchE;
            WriteDataE_r <= ReadData2E;
        end
    end

    assign PCSrcE = ZeroE_r & branchE_r;
    assign MemWriteM = MemWriteE_r;
    assign PCPlus4M = PCPlus4E;
    assign WriteDataM = WriteDataE_r;
    assign ALUOutM = ALUOutE_r;
    assign branchM = branchE_r;
    assign MemReadM = MemReadE_r;
    assign MemtoRegM = MemtoRegE_r;
    assign ZeroM = ZeroE_r;
endmodule
