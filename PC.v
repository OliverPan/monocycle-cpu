module pc(
    input [31:0]inputPC,
    input clk,
    input reset,
    output reg [31:0]outputPC
);
    always@(posedge clk)begin
        outputPC <= inputPC;
        $display("pc:%x", outputPC);
        if(reset == 1)
            outputPC <= 32'h00003000;
    end

endmodule
