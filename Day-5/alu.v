// Simple 4-bit ALU
// sel: 000=ADD 001=SUB 010=AND 011=OR 100=XOR 101=NOT a 110=shift-left a 111=shift-right a
module alu (
    input  wire [3:0] a,
    input  wire [3:0] b,
    input  wire [2:0] sel,
    output reg  [3:0] result,
    output reg         carry_out
);
    always @(*) begin
        carry_out = 1'b0;
        case (sel)
            3'b000: {carry_out, result} = a + b;
            3'b001: {carry_out, result} = a - b;
            3'b010: result = a & b;
            3'b011: result = a | b;
            3'b100: result = a ^ b;
            3'b101: result = ~a;
            3'b110: result = a << 1;
            3'b111: result = a >> 1;
            default: result = 4'b0000;
        endcase
    end
endmodule

// Testbench
module alu_tb;
    reg  [3:0] a, b;
    reg  [2:0] sel;
    wire [3:0] result;
    wire       carry_out;

    alu uut (.a(a), .b(b), .sel(sel), .result(result), .carry_out(carry_out));

    initial begin
        $monitor("sel=%b a=%d b=%d result=%d carry=%b", sel, a, b, result, carry_out);
        a = 4'd5; b = 4'd3;
        sel = 3'b000; #10; // add
        sel = 3'b001; #10; // sub
        sel = 3'b010; #10; // and
        sel = 3'b011; #10; // or
        sel = 3'b100; #10; // xor
        sel = 3'b101; #10; // not a
        sel = 3'b110; #10; // shift left
        sel = 3'b111; #10; // shift right
        $finish;
    end
endmodule
