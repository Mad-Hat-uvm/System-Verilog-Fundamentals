Q.: Write a class where two variables, a and b, must satisfy the condition that 
their sum is always greater 20. 

class conditional;
    rand logic [7:0] a, b;
endclass

module test;
    conditional obj;

    initial begin
        obj = new();

        repeat (10) begin
        if (obj.randomize() with { (a + b) > 20; }) begin
            $display("a: %0d, b: %0d", obj.a, obj.b);
        end else begin
            $display("Randomization failed");
        end
        end
    end
endmodule