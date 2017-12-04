module alu(
    input [31:0]A,
    input [31:0]B,
    input [1:0]ALUOp,
    output reg Zero,
    output reg [31:0]C
);
    always@(*)begin
        case(ALUOp)
            2'b00: C = A+B;
            2'b01: C = A-B;
            2'b10: C = A|B;
            default:
                C = 32'b0;
        endcase
        Zero = (C==32'b0)?1'b1:1'b0;
    end
endmodule
