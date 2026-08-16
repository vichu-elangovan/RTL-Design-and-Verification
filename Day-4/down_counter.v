// 4-bit Synchronous Down Counter
module down_counter (
    input  wire       clk,
    input  wire       rst,
    output reg [3:0]  count
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            count <= 4'b1111;
        else
            count <= count - 1;
    end
endmodule

// Testbench
module down_counter_tb;
    reg clk, rst;
    wire [3:0] count;

    down_counter uut (.clk(clk), .rst(rst), .count(count));

    always #5 clk = ~clk;

    initial begin
        clk = 0; rst = 1;
        #10 rst = 0;
        #160 $finish;
    end

    initial
        $monitor("time=%0t count=%d", $time, count);
endmodule
