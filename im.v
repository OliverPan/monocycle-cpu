module im(
    input [9:0]PCaddr,
    output reg [31:0]instruction
);
    `timescale 1ns/1ns

    reg [31:0]IMemory[31:0];
    reg [31:0]temp;
    integer fd, cnt, node;
    initial
    begin
        fd = $fopen("test.txt", "r");
        node = 0;
        for(node = 0; node < 32; node = node+1)begin
            cnt = $fscanf(fd, "%x", temp);
            IMemory[node] = temp;
        end
        $fclose(fd);
    end
    always@(PCaddr)begin
        instruction <= IMemory[PCaddr];
    end

endmodule