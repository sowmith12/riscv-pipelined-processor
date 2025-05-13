module ALUCtrl (
    input [1:0] ALUOp,
    input [6:0] funct7,
    input [2:0] funct3,
    output reg [3:0] ALUCtl
);
    always @(*) begin
        case (ALUOp)
            2'b00: ALUCtl = 4'b0000; // ADD for loads/stores
            2'b01: ALUCtl = 4'b0001; // SUB for branches
            2'b10: begin
                case (funct3)
                    3'b000: ALUCtl = (funct7 == 7'b0100000) ? 4'b0001 : 4'b0000; // SUB/ADD
                    3'b010: ALUCtl = 4'b0010; // SLT
                    3'b110: ALUCtl = 4'b0011; // OR
                    3'b111: ALUCtl = 4'b0100; // AND
                    3'b011: ALUCtl = 4'b0101; // SLTU
                    default: ALUCtl = 4'b0000;
                endcase
            end
            default: ALUCtl = 4'b0000;
        endcase
    end
endmodule
