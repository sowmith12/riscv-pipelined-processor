// Writeback Stage
module writeback (
    input clk, rst,
    input [31:0] ReadDataW, ALUOutW,
    input MemtoRegW,
    output [31:0] WriteDataE
);
    wire [31:0] ResultW;

    Mux2to1 #(.size(32)) result_mux (
        .sel(MemtoRegW),
        .s0(ALUOutW),
        .s1(ReadDataW),
        .out(ResultW)
    );

    reg [31:0] WriteDataE_reg;
    always @(posedge clk or negedge rst) begin
        if (!rst)
            WriteDataE_reg <= 32'b0;
        else
            WriteDataE_reg <= ResultW;
    end

    assign WriteDataE = WriteDataE_reg;
endmodule
