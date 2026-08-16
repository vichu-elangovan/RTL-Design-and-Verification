// 2-bit Magnitude Comparator
module comparator (
    input  wire [1:0] a,
    input  wire [1:0] b,
    output wire        a_gt_b,
    output wire        a_lt_b,
    output wire        a_eq_b
);
    assign a_gt_b = (a > b);
    assign a_lt_b = (a < b);
    assign a_eq_b = (a == b);
endmodule

// Testbench
module comparator_tb;
    reg  [1:0] a, b;
    wire a_gt_b, a_lt_b, a_eq_b;

    comparator uut (.a(a), .b(b), .a_gt_b(a_gt_b), .a_lt_b(a_lt_b), .a_eq_b(a_eq_b));

    initial begin
        $monitor("a=%d b=%d gt=%b lt=%b eq=%b", a, b, a_gt_b, a_lt_b, a_eq_b);
        a = 2'b00; b = 2'b01; #10;
        a = 2'b10; b = 2'b01; #10;
        a = 2'b11; b = 2'b11; #10;
        a = 2'b01; b = 2'b11; #10;
        $finish;
    end
endmodule
