/*--------------------BIDIRECTIONAL CONSTRAINTS-------------------------------
Constraint blocks are not procedural code, they are declarative code.
All the listed constraints are avtive at the same time.*/

class randClass;
    rand int v1; 

    constraint c1 {
      v1 inside {[10:30]};
      v1 > 20;
    }
endclass

module tb;
    randClass rc;

    initial begin
        rc = new();
        
        repeat(10) begin
           rc.randomize();
           $display("v1: %0d", rc.v1);
        end
    end
endmodule