// T Flip-Flop (positive edge triggered, async reset)
module t_flipflop (
    input  wire t,
    input  wire clk,
    input  wire rst,
    output reg  q
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 1'b0;
        else if (t)
            q <= ~q;
        else
            q <= q;
    end
endmodule

// Testbench
module t_flipflop_tb;
    reg t, clk, rst;
    wire q;

    t_flipflop uut (.t(t), .clk(clk), .rst(rst), .q(q));

    always #5 clk = ~clk;

    initial begin
        clk = 0; rst = 1; t = 0;
        #10 rst = 0;
        #10 t = 1;
        #10 t = 1;
        #10 t = 0;
        #10 t = 1;
        #20 $finish;
    end

    initial
        $monitor("time=%0t t=%b q=%b", $time, t, q);
endmodule
