// Mod-6 Counter (counts 0 to 5, then rolls over)
module mod_n_counter #(
    parameter N = 6
) (
    input  wire       clk,
    input  wire       rst,
    output reg [3:0]  count
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            count <= 4'b0000;
        else if (count == N - 1)
            count <= 4'b0000;
        else
            count <= count + 1;
    end
endmodule

// Testbench
module mod_n_counter_tb;
    reg clk, rst;
    wire [3:0] count;

    mod_n_counter #(.N(6)) uut (.clk(clk), .rst(rst), .count(count));

    always #5 clk = ~clk;

    initial begin
        clk = 0; rst = 1;
        #10 rst = 0;
        #150 $finish;
    end

    initial
        $monitor("time=%0t count=%d", $time, count);
endmodule
