Q.: Create a class with threevariables a,b and c. Use constraints such that if 
a is greater than b, c must be positive.

class Multi_variable_Example;
    rand int a,b,c;

    constraint c_conditional{
        (a > b) -> (c > 0);
    }
endclass

module test;
    Multi_variable_Example obj;

    initial begin
        obj = new();
        
        repeat(10) begin
           if(obj.randomize()) begin
           $display("a: %0d, b: %0d, c: %0d", obj.a, obj.b, obj.c);
        end else begin
            $display("Randomization failed!!");
        end
    end
    end
endmodule