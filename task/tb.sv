module testbench;

shortreal a, b,res;
shortreal res_real;
logic [31:0] a_f;
logic [31:0] b_f;
logic [31:0] result;
event ev;
add_float add_float
(
    .a(a_f),
    .b(b_f),
    .result(result)
);

initial begin
    a = 1.1;
    b = 2.2;
    a_f = $shortrealtobits(a);
    b_f = $shortrealtobits(b);
    ->>ev;
    #5;
    a = -1.2;
    b = -2.4;
    a_f = $shortrealtobits(a);
    b_f = $shortrealtobits(b);
    
    ->>ev;
    #5;
    a = 0.0;
    b = 4.35;
    a_f = $shortrealtobits(a);
    b_f = $shortrealtobits(b);
    
    ->>ev;
    #5;
    a = 4.234;
    b = -23.456;
    a_f = $shortrealtobits(a);
    b_f = $shortrealtobits(b);
    
    ->>ev;
    #5;
    $display("PASSED");
    $stop();
end

initial begin
    forever begin
        @ev;
        res = a+b;
        res_real = $bitstoshortreal(result);
        if((((a + b) - $bitstoshortreal(result)) > 0.01) || (((a + b) - $bitstoshortreal(result)) < -0.01))
            begin
                $display("ERROR %0.4f != %0.4f", a+b, $bitstoshortreal(result));
                $finish();
            end
        else begin
            $display("SUCCESS %0.4f == %0.4f", a+b, $bitstoshortreal(result));
        end
    end
end

endmodule