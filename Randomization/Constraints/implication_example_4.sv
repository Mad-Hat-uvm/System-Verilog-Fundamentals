Q.:Create a class wiith two variables, x and y. Use soft constraints such that if x 
   is greater than 10, then y should ideally be equal to 20 (but not mandatory).
   
   class SoftConstraintExample;
    rand int x, y;

    constraint c_soft{
        (x > 10) -> soft (y == 20);
    }
   endclass

   module test;
    SoftConstraintExample obj;

    initial begin
        obj = new();
        
        repeat(10) begin
           if(obj.randomize()) begin
           $display("x: %0d, y: %0d", obj.x, obj.y);
        end else begin
            $display("Randomization failed!!");
        end
    end
    end
endmodule
