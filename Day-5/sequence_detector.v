// Moore FSM: detects the sequence "101" on a serial input (overlapping allowed)
module sequence_detector (
    input  wire clk,
    input  wire rst,
    input  wire din,
    output reg  detected
);
    parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;
    reg [1:0] state, next_state;

    // State register
    always @(posedge clk or posedge rst) begin
        if (rst)
            state <= S0;
        else
            state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (state)
            S0: next_state = din ? S1 : S0;
            S1: next_state = din ? S1 : S2;
            S2: next_state = din ? S3 : S0;
            S3: next_state = din ? S1 : S2;
            default: next_state = S0;
        endcase
    end

    // Output logic (Moore: depends only on state)
    always @(*) begin
        detected = (state == S3);
    end
endmodule

// Testbench
module sequence_detector_tb;
    reg clk, rst, din;
    wire detected;

    sequence_detector uut (.clk(clk), .rst(rst), .din(din), .detected(detected));

    always #5 clk = ~clk;

    initial begin
        clk = 0; rst = 1; din = 0;
        #10 rst = 0;
        // feed sequence 1 0 1 1 0 1
        din = 1; #10;
        din = 0; #10;
        din = 1; #10;   // "101" detected here
        din = 1; #10;
        din = 0; #10;
        din = 1; #10;   // overlapping "101" detected again
        $finish;
    end

    initial
        $monitor("time=%0t din=%b state=%b detected=%b", $time, din, uut.state, detected);
endmodule
