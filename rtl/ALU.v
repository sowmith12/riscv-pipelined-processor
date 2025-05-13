module ALU (
    input [31:0] A, B,
    input [3:0] ALUCtl,
    output reg [31:0] ALUOut,
    output reg zero
);
    always @(*) begin
        case (ALUCtl)
            4'b0000: ALUOut = A + B;         // ADD
            4'b0001: ALUOut = A - B;         // SUB
            4'b0010: ALUOut = ($signed(A) < $signed(B)) ? 32'b1 : 32'b0; // SLT (signed)
            4'b0011: ALUOut = A | B;         // OR
            4'b0100: ALUOut = A & B;         // AND
            4'b0101: ALUOut = (A < B) ? 32'b1 : 32'b0; // SLTU (unsigned)
            default: ALUOut = 32'b0;
        endcase
        zero = (ALUOut == 0) ? 1'b1 : 1'b0;
    end
endmodule
