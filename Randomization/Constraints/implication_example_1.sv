Q.:Create a class with two variables, x and y. Use constraints such that if x is
 greater than 5, y must be equak to 10. 

 class BasicExample;
    rand bit [7:0] x, y;

    constraint c_implication{
        (x > 5) -> (y == 10);
    }

 endclass

 module test;
    BasicExample obj;

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