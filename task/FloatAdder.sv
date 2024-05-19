module add_float (
    input logic [31:0] a,
    input logic [31:0] b,

    output logic [31:0] result
);

Addition_Subtraction Addition_Subtraction
(
    .a_operand(a),
    .b_operand(b),
    .AddBar_Sub(1'b0),
    .result(result) 
);
endmodule