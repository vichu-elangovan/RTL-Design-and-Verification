// 4-bit Synchronous Up Counter
module up_counter (
    input  wire       clk,
    input  wire       rst,
    output reg [3:0]  count
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            count <= 4'b0000;
        else
            count <= count + 1;
    end
endmodule

// Testbench
module up_counter_tb;
    reg clk, rst;
    wire [3:0] count;

    up_counter uut (.clk(clk), .rst(rst), .count(count));

    always #5 clk = ~clk;

    initial begin
        clk = 0; rst = 1;
        #10 rst = 0;
        #160 $finish;
    end

    initial
        $monitor("time=%0t count=%d", $time, count);
endmodule
