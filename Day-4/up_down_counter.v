// 4-bit Up/Down Counter (mode: 1 = up, 0 = down)
module up_down_counter (
    input  wire       clk,
    input  wire       rst,
    input  wire       mode,
    output reg [3:0]  count
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            count <= 4'b0000;
        else if (mode)
            count <= count + 1;
        else
            count <= count - 1;
    end
endmodule

// Testbench
module up_down_counter_tb;
    reg clk, rst, mode;
    wire [3:0] count;

    up_down_counter uut (.clk(clk), .rst(rst), .mode(mode), .count(count));

    always #5 clk = ~clk;

    initial begin
        clk = 0; rst = 1; mode = 1;
        #10 rst = 0;
        #60 mode = 0;   // switch to down counting
        #60 $finish;
    end

    initial
        $monitor("time=%0t mode=%b count=%d", $time, mode, count);
endmodule
