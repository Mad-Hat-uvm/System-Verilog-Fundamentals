Q.:Create a class with three variables x, y and z. Use bidirectional constraints to 
ensure that the sum of x and y must always be equal to z.

class Sum_Constraint_Example;
    rand bit [7:0] x,y,z;

    constraint c_sum{z == x + y;}

endclass

module test;
    Sum_Constraint_Example obj;

    initial begin
        obj = new();

        repeat(10) begin
            if(obj.randomize()) begin
                $display("x: %0d, y: %0d, z: %0d", obj.x, obj.y, obj.z);
            end else begin
                $display("Randomization failed.");
            end
        end
    end
endmodule