module Twomux32(
    input [31:0]d0,
    input [31:0]d1,
    input s,
    output reg [31:0]y
);
    always@(*)
    begin
        y = s?d1:d0;
    end
endmodule

module Fourmux5(
    input [4:0]d0,
    input [4:0]d1,
    input [4:0]d2,
    input [4:0]d3,
    input [1:0]s,
    output reg [4:0]y
);
    always@(*)begin
        case(s)
            2'b00: y = d0;
            2'b01: y = d1;
            2'b10: y = d2;
            2'b11: y = d3;
        endcase
    end
endmodule

module Fourmux32(
    input [31:0]d0,
    input [31:0]d1,
    input [31:0]d2,
    input [31:0]d3,
    input [1:0]s,
    output reg [31:0]y
);
    always@(*)begin
        case(s)
            2'b00: y = d0;
            2'b01: y = d1;
            2'b10: y = d2;
            2'b11: y = d3;
        endcase
    end
endmodule



module mux8(d0,d1,d2,d3,d4,d5,d6,d7,s,y);
    input d0,d1,d2,d3,d4,d5,d6,d7;
    input [2:0]s;
    output reg y;
    always@(*)begin
        case(s)
            3'b000: y = d0;
            3'b001: y = d1;
            3'b010: y = d2;
            3'b011: y = d3;
            3'b100: y = d4;
            3'b101: y = d5;
            3'b110: y = d6;
            3'b111: y = d7;
        endcase
    end
endmodule

module mux16(d0,d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,s,y);
    input d0,d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15;
    input [3:0]s;
    output reg y;
    always@(*)begin
        case(s)
            4'b0000: y = d0;
            4'b0001: y = d1;
            4'b0010: y = d2;
            4'b0011: y = d3;
            4'b0100: y = d4;
            4'b0101: y = d5;
            4'b0110: y = d6;
            4'b0111: y = d7;
            4'b1000: y = d8;
            4'b1001: y = d9;
            4'b1010: y = d10;
            4'b1011: y = d11;
            4'b1100: y = d12;
            4'b1101: y = d13;
            4'b1110: y = d14;
            4'b1111: y = d15;
        endcase
    end
endmodule
            