// Memory Stage
module memory (
    input clk, rst, MemReadM, MemtoRegM, MemWriteM, ZeroM, branchM,
    input [31:0] PCPlus4M, WriteDataM, ALUOutM,
    output [31:0] ReadDataW, ALUOutW,
    output MemtoRegW
);
    wire [31:0] ReadData;
    reg [31:0] ReadDataM_r, ALUOutM_r;
    reg MemtoRegM_r;

    DataMemory m_DataMemory (
        .rst(rst),
        .clk(clk),
        .memWrite(MemWriteM),
        .memRead(MemReadM),
        .address(ALUOutM),
        .writeData(WriteDataM),
        .readData(ReadData)
    );

    always @(posedge clk or negedge rst) begin
        if (rst == 1'b0) begin
            ALUOutM_r <= 32'h0;
            ReadDataM_r <= 32'h0;
            MemtoRegM_r <= 1'b0;
        end else begin
            ALUOutM_r <= ALUOutM;
            ReadDataM_r <= ReadData;
            MemtoRegM_r <= MemtoRegM;
        end
    end

    assign ALUOutW = ALUOutM_r;
    assign ReadDataW = ReadDataM_r;
    assign MemtoRegW = MemtoRegM_r;
endmodule
