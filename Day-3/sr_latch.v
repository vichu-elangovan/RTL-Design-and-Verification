// SR Latch (level sensitive, NOR based)
module sr_latch (
    input  wire s,
    input  wire r,
    output reg  q,
    output wire qbar
);
    assign qbar = ~q;

    always @(*) begin
        if (s && !r)
            q = 1'b1;
        else if (!s && r)
            q = 1'b0;
        else if (s && r)
            q = 1'bx; // invalid state
        // s=0, r=0 -> hold previous value
    end
endmodule

// Testbench
module sr_latch_tb;
    reg s, r;
    wire q, qbar;

    sr_latch uut (.s(s), .r(r), .q(q), .qbar(qbar));

    initial begin
        s = 0; r = 0;
        #10 s = 1; r = 0;   // set
        #10 s = 0; r = 0;   // hold
        #10 s = 0; r = 1;   // reset
        #10 s = 0; r = 0;   // hold
        #10 $finish;
    end

    initial
        $monitor("time=%0t s=%b r=%b q=%b qbar=%b", $time, s, r, q, qbar);
endmodule
