`include "./ctrl_encode_def.v"


module ctrl(
    input [5:0]OP,
    output reg [1:0]RegDst,
    output reg Jump,
    output reg Branch,
    output reg MemRead,
    output reg [1:0]MemtoReg,
    output reg [1:0]ALUOp,
    output reg MemWrite,
    output reg ALUSrc,
    output reg RegWrite
);
    always@(*)
    begin
        if((OP == `adduINPUT) || (OP == `subuINPUT))begin
            RegDst = 2'b01;
            Jump = 1'b0;
            Branch = 1'b0;
            MemRead = 1'b0;
            MemtoReg = 2'b00;
            ALUOp = `RtypeOP;
            MemWrite = 1'b0;
            ALUSrc = 1'b0;
            RegWrite = 1'b1;
        end
        if(OP == `oriINPUT)begin
            RegDst = 2'b00;
            Jump = 1'b0;
            Branch = 1'b0;
            MemRead = 1'b0;
            MemtoReg = 2'b00;
            ALUOp = `ItypeOP;
            MemWrite = 1'b0;
            ALUSrc = 1'b1;
            RegWrite = 1'b1;
        end
        if(OP == `lwINPUT)begin
            RegDst = 2'b00;
            Jump = 1'b0;
            Branch = 1'b0;
            MemRead = 1'b1;
            MemtoReg = 2'b01;
            ALUOp = `lwOP;
            MemWrite = 1'b0;
            ALUSrc = 1'b1;
            RegWrite = 1'b1; 
        end
        if(OP == `swINPUT)begin
            Jump = 1'b0;
            Branch = 1'b0;
            MemRead = 1'b0;
            ALUOp = `swOP;
            MemWrite = 1'b1;
            ALUSrc = 1'b1;
            RegWrite = 1'b0;
        end
        if(OP == `beqINPUT)begin
            Jump = 1'b0;
            Branch = 1'b1;
            MemRead = 1'b0;
            ALUOp = `beqOP;
            MemWrite = 1'b1;
            ALUSrc = 1'b0;
            RegWrite = 1'b0;
        end
        if(OP == `jalINPUT)begin
            RegDst = 2'b10;
            Jump = 1'b1;
            Branch = 1'b0;
            MemRead = 1'b0;
            MemtoReg = 2'b10;
            MemWrite = 1'b0;
            RegWrite = 1'b1;
        end
    end
endmodule

module alu_ctrl(
    input [1:0]ALUOp,
    input [5:0]Funct,
    output reg[1:0]ALUctrl
);
    always@(*)begin
        if(ALUOp == `RtypeOP)begin
            if(Funct == 6'h21)begin
                ALUctrl = 2'b00;
            end
            else if(Funct == 6'h23)begin
                ALUctrl = 2'b01;
            end
        end
        else if(ALUOp == `ItypeOP)begin
            ALUctrl = 2'b10;
        end
        else if(ALUOp == `lwOP || ALUOp == `swOP)begin
            ALUctrl = 2'b00;
        end
        else
        begin
            ALUctrl = 2'b01;
        end
    end
endmodule