module Control (
    input [6:0] opcode,
    input [2:0] funct3,  // Added funct3 input
    output reg branch, memRead, memtoReg, memWrite, ALUSrc, regWrite,
    output reg [1:0] ALUOp
);
    always @(*) begin
        case (opcode)
            7'b0110011: begin // R-type
                ALUOp = 2'b10; branch = 0; memRead = 0; memtoReg = 0; memWrite = 0; ALUSrc = 0; regWrite = 1;
            end
            7'b0010011: begin // I-type (addi, slti, etc.)
                ALUOp = 2'b10; branch = 0; memRead = 0; memtoReg = 0; memWrite = 0; ALUSrc = 1; regWrite = 1;
            end
            7'b0000011: begin // Load instructions
                ALUOp = 2'b00; branch = 0; memRead = 1; memtoReg = 1; memWrite = 0; ALUSrc = 1; regWrite = 1;
            end
            7'b0100011: begin // Store instructions
                ALUOp = 2'b00; branch = 0; memRead = 0; memtoReg = 0; memWrite = 1; ALUSrc = 1; regWrite = 0;
            end
            7'b1100011: begin // Branch instructions
                ALUOp = 2'b01; branch = 1; memRead = 0; memtoReg = 0; memWrite = 0; ALUSrc = 0; regWrite = 0;
            end
            default: begin
                ALUOp = 2'b00; branch = 0; memRead = 0; memtoReg = 0; memWrite = 0; ALUSrc = 0; regWrite = 0;
            end
        endcase
    end
endmodule
