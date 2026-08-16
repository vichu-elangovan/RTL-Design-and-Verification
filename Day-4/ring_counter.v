// 4-bit Ring Counter (single 1 circulates through the register)
module ring_counter (
    input  wire       clk,
    input  wire       rst,
    output reg [3:0]  q
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 4'b0001;
        else
            q <= {q[2:0], q[3]}; // rotate left
    end
endmodule

// Testbench
module ring_counter_tb;
    reg clk, rst;
    wire [3:0] q;

    ring_counter uut (.clk(clk), .rst(rst), .q(q));

    always #5 clk = ~clk;

    initial begin
        clk = 0; rst = 1;
        #10 rst = 0;
        #80 $finish;
    end

    initial
        $monitor("time=%0t q=%b", $time, q);
endmodule
