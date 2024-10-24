Q.: Create a class with two variables, x and y. Use constraints to ensure that both 
    variables always remain within 10 units of each other.

    class RangeBidirectionalExample;
        rand bit[7:0] x, y;

        //Bidirectional constraints: Difference between x and y must not exceed 10

        constraint c_range{
            (x - y) inside {[-10:10]};
        }
    endclass

    module test;
        RangeBidirectionalExample obj;

    initial begin
        obj = new();

        repeat(10) begin
            if(obj.randomize()) begin
                $display("x: %0d, y: %0d", obj.x, obj.y);
            end else begin
                $display("Randomization failed.");
            end
        end
    end
    endmodule