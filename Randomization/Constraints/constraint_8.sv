/*--------------------IMPLICATION CONSTRAINTS(IF - ELSE)-------------------------------
If - else can be used in constraints. Any number of else if can be added.*/

class randClass;

    rand bit [1:0] a,b; //0,1,2,3 

    constraint c1 {
      if (a == 2'h0) {
        b == 2'h0;
      } else if (a == 2'h1) {
        b == 2'h1;
      }
      else {
          b inside {2'h2, 2'h3};
      }
    }
endclass

module tb;
    randClass rc;

    initial begin
        rc = new();
        
        repeat(10) begin
           rc.randomize();
           $display("a: %0d, b: %0d", rc.a, rc.b);
        end
    end
endmodule