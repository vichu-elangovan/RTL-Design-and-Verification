// 4-bit Serial-In Parallel-Out (SIPO) Shift Register
module shift_register (
    input  wire       clk,
    input  wire       rst,
    input  wire       serial_in,
    output reg [3:0]  q
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 4'b0000;
        else
            q <= {q[2:0], serial_in};
    end
endmodule

// Testbench
module shift_register_tb;
    reg clk, rst, serial_in;
    wire [3:0] q;

    shift_register uut (.clk(clk), .rst(rst), .serial_in(serial_in), .q(q));

    always #5 clk = ~clk;

    initial begin
        clk = 0; rst = 1; serial_in = 0;
        #10 rst = 0;
        #10 serial_in = 1;
        #10 serial_in = 0;
        #10 serial_in = 1;
        #10 serial_in = 1;
        #20 $finish;
    end

    initial
        $monitor("time=%0t serial_in=%b q=%b", $time, serial_in, q);
endmodule
