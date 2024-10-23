Q.: Create a class with a variable x. Use constraints such that if x is greater than 5,
   then it should follow a distribution where it is 8 with 70% probability and 12 with
   30% probability.

class DebugExample;
    rand bit [3:0] x;

    constraint c_debug {
        (x > 5) -> (x dist {8 := 70, 12 := 30}); 
    }
endclass

module test;
    DebugExample obj;

    initial begin
        obj = new();
        repeat(10) begin
        if (obj.randomize()) begin
            $display("x: %0d", obj.x);
        end else begin
            $display("Randomization Failed!!!");
        end
    end
    end
endmodule