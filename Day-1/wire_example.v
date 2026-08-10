module wire_example(
    input A,
    input B,
    output Y
);

wire temp;

assign temp = A & B;
assign Y = temp;

endmodule
