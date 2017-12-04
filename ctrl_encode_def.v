/* MIPS-Lite1＝{addu，subu，ori，lw，sw，beq，jal} */

`define adduINPUT 6'b000000
`define subuINPUT 6'b000000
`define oriINPUT  6'b001101
`define swINPUT   6'b101011
`define lwINPUT   6'b100011
`define beqINPUT  6'b000100
`define jalINPUT  6'b000011

`define RtypeOP 2'b10
`define ItypeOP 2'b11
`define lwOP 2'b00
`define swOP 2'b00
`define beqOP 2'b01
