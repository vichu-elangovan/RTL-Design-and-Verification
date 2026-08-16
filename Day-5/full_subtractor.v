// Full Subtractor
module full_subtractor (
    input  wire a,
    input  wire b,
    input  wire bin,
    output wire diff,
    output wire bout
);
    assign diff = a ^ b ^ bin;
    assign bout = (~a & b) | (~a & bin) | (b & bin);
endmodule

// Testbench
module full_subtractor_tb;
    reg a, b, bin;
    wire diff, bout;

    full_subtractor uut (.a(a), .b(b), .bin(bin), .diff(diff), .bout(bout));

    integer i;
    initial begin
        $monitor("a=%b b=%b bin=%b diff=%b bout=%b", a, b, bin, diff, bout);
        for (i = 0; i < 8; i = i + 1) begin
            {a, b, bin} = i;
            #10;
        end
        $finish;
    end
endmodule
