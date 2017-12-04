module rf(
    input [4:0]RA1, //read address of reg1
    input [4:0]RA2, //read address of reg2
    input [4:0]WA, //write address
    input [31:0]WD,
    input RegWrite,
    input clk,
    output wire [31:0]RD1,
    output wire [31:0]RD2
);
    reg [31:0]register[31:0];
    integer node;
    initial
    begin
        register[0] = 0;
        node = 0;
    end
    
    always@(posedge clk)begin
        if(RegWrite == 1)begin
            register[WA] <= WD;
        end
        for(node=0; node<32; node=node+1)begin
            $display("register[%d] = 0x%x", node, register[node]);
        end
    end
    assign RD1 = register[RA1];
    assign RD2 = register[RA2];

endmodule
