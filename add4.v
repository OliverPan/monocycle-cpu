module add4(
    input [31:0]pc,
    output wire [31:0]newPc
);
    assign newPc = pc + 4;
endmodule