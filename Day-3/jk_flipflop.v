// JK Flip-Flop (positive edge triggered, async reset)
module jk_flipflop (
    input  wire j,
    input  wire k,
    input  wire clk,
    input  wire rst,
    output reg  q
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 1'b0;
        else begin
            case ({j, k})
                2'b00: q <= q;      // hold
                2'b01: q <= 1'b0;   // reset
                2'b10: q <= 1'b1;   // set
                2'b11: q <= ~q;     // toggle
            endcase
        end
    end
endmodule

// Testbench
module jk_flipflop_tb;
    reg j, k, clk, rst;
    wire q;

    jk_flipflop uut (.j(j), .k(k), .clk(clk), .rst(rst), .q(q));

    always #5 clk = ~clk;

    initial begin
        clk = 0; rst = 1; j = 0; k = 0;
        #10 rst = 0;
        #10 j = 1; k = 0;   // set
        #10 j = 0; k = 1;   // reset
        #10 j = 1; k = 1;   // toggle
        #10 j = 1; k = 1;   // toggle again
        #10 j = 0; k = 0;   // hold
        #20 $finish;
    end

    initial
        $monitor("time=%0t j=%b k=%b q=%b", $time, j, k, q);
endmodule
