Q.:Create a class with two variables, a and b. Use constraints such that if a is even, 
b must also be even, and vice versa.

class MutualDependencyExample;
    rand int a,b;

    constraint c_even {
        (a % 2 == 0) <-> (b % 2 == 0);
    }
endclass

module test;
    MutualDependencyExample obj;

    initial begin
        obj = new();

        repeat(10) begin
            if(obj.randomize()) begin
                $display("a: %0d, b: %0d", obj.a, obj.b);
            end else begin
                $display("Randomization failed.");
            end
        end
    end
endmodule