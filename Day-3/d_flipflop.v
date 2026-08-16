// D Flip-Flop (positive edge triggered, async reset)
module d_flipflop (
    input  wire d,
    input  wire clk,
    input  wire rst,
    output reg  q
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 1'b0;
        else
            q <= d;
    end
endmodule

// Testbench
module d_flipflop_tb;
    reg d, clk, rst;
    wire q;

    d_flipflop uut (.d(d), .clk(clk), .rst(rst), .q(q));

    always #5 clk = ~clk;

    initial begin
        clk = 0; rst = 1; d = 0;
        #10 rst = 0;
        #10 d = 1;
        #10 d = 0;
        #10 d = 1;
        #20 $finish;
    end

    initial
        $monitor("time=%0t rst=%b d=%b clk=%b q=%b", $time, rst, d, clk, q);
endmodule
