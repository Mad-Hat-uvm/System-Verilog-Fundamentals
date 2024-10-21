Q: Write a SystemVerilog class that contains two random variables, x and y.
Use inline constraints to ensure x is between 5 and 10 and y is always even.

class example_1;
    rand int x; 
    rand int y;
endclass

module test;
    example_1 obj;

    initial begin
        obj = new();

        repeat (10) begin
        if(obj.randomize() with { x inside {[5:10]}; y % 2 == 0}) begin
            $display("x = %0d, y = %0d", obj.x, obj.y);
        end else begin
            $display("Randomization failed.");
        end
    end
    end
endmodule