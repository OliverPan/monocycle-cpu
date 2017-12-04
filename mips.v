`include "./alu.v"
`include "./ctrl.v"
`include "./dm.v"
`include "./EXT.v"
`include "./mux.v"
`include "./RF.v"
`include "./im.v"
`include "./PC.v"
`include "./shift2.v"
`include "./add4.v"
`include "./addAddress.v"

module mips(
);

    `timescale 1ns/1ns
    //线
    reg clk, reset;

    wire Jump, Branch, MemRead, MemWrite, ALUSrc, RegWrite;
    wire[1:0] RegDst, MemtoReg, ALUOp, ALUctrl;


    wire [31:0]pcInput, PCout, IMout, add4out, writeData, RFdout1, RFdout2, extOut, aluIn1, aluIn2, aluRlt, DmOut, addResult, newpc, beqOut;
    wire [4:0]writeReg;
    wire Zero;

    assign aluIn1 = RFdout1;
    assign pcInput = newpc;




    
    
    initial
    begin
        clk = 1;
        reset = 1;
        #20
        reset = 0;
    end

    //实例化模块
    pc PC(pcInput, clk, reset, PCout);
    im IM(PCout[11:2], IMout);
    add4 pcadd4(PCout, add4out);
    Fourmux5 muxIMtoRF(IMout[20:16], IMout[15:11], 5'b11111, 5'bXXXXX, RegDst, writeReg);
    rf RF(IMout[25:21], IMout[20:16], writeReg, writeData, RegWrite, clk, RFdout1, RFdout2);
    ctrl Control(IMout[31:26], RegDst, Jump, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite);
    alu_ctrl alu_Control(ALUOp, IMout[5:0], ALUctrl);
    EXT signEXT(IMout[15:0], 2'b01, extOut);
    Twomux32 muxRFtoALU(RFdout2, extOut, ALUSrc, aluIn2);
    alu Alu(aluIn1, aluIn2, ALUctrl, Zero, aluRlt);
    dm DM(aluRlt[9:0], RFdout2, MemWrite, MemRead, DmOut);
    Fourmux32 muxDMtoRF(aluRlt, DmOut, add4out, {32{X}}, MemtoReg, writeData);
    addAddress aa(add4out, {extOut[29:0], 2'b00}, addResult);
    Twomux32 muxbeq(add4out, addResult, Branch&Zero, beqOut);
    Twomux32 muxjump(beqOut, {add4out[31:28], IMout[25:0], 2'b00}, Jump ,newpc);

    always
    begin
        #20
        clk = ~clk;
    end

endmodule
