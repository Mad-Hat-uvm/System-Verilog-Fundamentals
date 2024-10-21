//In the below case the RANDOMIZATION WILL FAIL!!!!!!

class randClass;

    rand bit a,b;  

    constraint cons_a {  
     a == 0;
    }

    constraint cons_b {  
     b == 0;
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

        $display("Turn of cons_a constraint block");
        rc.cons_a.constraint_mode(0);

        repeat(10) begin
            rc.randomize();
            $display("a: %0d, b: %0d", rc.a, rc.b);
         end

         $display("Turn of all constraint blocks");
         rc.constraint_mode(0);

         repeat(10) begin
            rc.randomize();
            $display("a: %0d, b: %0d", rc.a, rc.b);
         end

    end
endmodule