Q.:Given a class with 3 variables, a,b and c, randomize only b and c, 
while keeping a fixed to 5. Use inline constraints.

class example_2;
    rand logic [7:0] a,b,c;
endclass

module test;
    example_2 obj;

    initial begin
        obj = new();

        repeat (10) begin
            if(obj.randomize() with { a == 5; b > 0; c < 10; }) begin
                $display("a: %0d, b: %0d, c: %0d", obj.a, obj.b, obj.c);
            end else begin
                $display("Randomization failed");
            end

        end
    end

endmodule