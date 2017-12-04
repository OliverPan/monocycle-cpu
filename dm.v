module dm(
    input [9:0]addr,
    input [31:0]din,
    input MemWrite,
    input MemRead,
    output reg [31:0]dout
);
    reg [31:0]DMemory[31:0];
    integer node;
    initial
    begin
        for(node=0; node<32; node=node+1)begin
            DMemory[node] = 32'b0;
        end
    end
    always@(addr)begin
        if(MemWrite)begin
            DMemory[addr] <= din;
        end
        if(MemRead)begin
            dout <= DMemory[addr];
        end
    end

endmodule
