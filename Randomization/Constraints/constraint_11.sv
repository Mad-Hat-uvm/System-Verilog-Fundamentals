class randClass;

    rand bit a,b;  

    constraint c1 {  //Here the the two constraint space will be solved independently,
     (a <-> b);      // and the union of both the spaces will the outcome.
     a == 1;
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