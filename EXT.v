module EXT(
    input [15:0]Imm,
    input [1:0]EXTOp,
    output reg [31:0]Imm32
);
    always@(*)begin
      case(EXTOp)
        2'b00: Imm32 = {16'b0, Imm};
        2'b01: Imm32 = Imm[15]?{~16'b0, Imm}:{16'b0, Imm};
        2'b10: Imm32 = {Imm, 16'b0};
        default:
            Imm32 = 32'b0;
      endcase
    end




endmodule
