module shift2(
    input [31:0]Idata,
    output wire [31:0]Odata
);
    assign Odata = {Idata[29:0], 2'b00};
endmodule