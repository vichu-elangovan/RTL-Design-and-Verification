module reg_example(
    input A,
    output reg Y
);

always @(A)
begin
    if(A)
        Y = 1'b1;
    else
        Y = 1'b0;
end

endmodule
