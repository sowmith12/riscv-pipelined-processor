// Fetch Stage
module fetch (
    input clk, rst,
    input PCSrcE,
    input [31:0] PCTarget,
    output [31:0] InstD,
    output [31:0] PCD, PCPlus4D
);
    wire [31:0] PCNext, PC, PCPlus4;
    wire [31:0] Inst;
    reg [31:0] Inst_reg, PC_reg, PCPlus4_reg;

    Mux2to1 #(.size(32)) m_Mux_PC (
        .sel(PCSrcE),
        .s0(PCPlus4),
        .s1(PCTarget),
        .out(PCNext)
    );

    PC m_PC (
        .clk(clk),
        .rst(rst),
        .pc_i(PCNext),
        .pc_o(PC)
    );

    Adder m_Adder_1 (
        .a(PC),
        .b(32'd4),
        .sum(PCPlus4)
    );

    InstructionMemory m_InstMem (
        .readAddr(PC),
        .inst(Inst)
    );

    always @(posedge clk or negedge rst) begin
        if (rst == 1'b0) begin
            Inst_reg <= 32'h0;
            PC_reg <= 32'h0;
            PCPlus4_reg <= 32'h0;
        end else begin
            Inst_reg <= Inst;
            PC_reg <= PC;
            PCPlus4_reg <= PCPlus4;
        end
    end

    assign InstD = (rst == 1'b0) ? 32'h0 : Inst_reg;
    assign PCD = (rst == 1'b0) ? 32'h0 : PC_reg;
    assign PCPlus4D = (rst == 1'b0) ? 32'h0 : PCPlus4_reg;
endmodule
