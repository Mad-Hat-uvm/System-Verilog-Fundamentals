Q.: The following class has a constraint block that ensures x is always less than 10. 
Use inline constraints to override this and generate x between 15 and 20. 
Switch off the constraint if necessary.

class example_3;
    rand  x;

    constraint c {x < 10;} 

endclass

module test;
    example_3 obj;

    initial begin
        obj = new();

        repeat (10) begin
            if(obj.randomize() with {x inside {[15:20]};}) begin
                $display("x: %0d", obj.x);
            end else begin
                $display("Switching off constraint c");
                obj.c.constraint_mode(0);
                obj.randomize() with {x inside {[15:20]};}
                $display("x: %0d", obj.x);
            end
        end
    end
endmodule