class randClass;

    rand bit [1:0] a;  

    constraint cons_a {  
     a inside {0, 1, 2};
    }
endclass

module tb;
    randClass rc;

    initial begin
        rc = new();
        
        repeat(10) begin
           rc.randomize();
           $display("a: %0d", rc.a);
        end

        $display("Adding inline constraints");
       
        repeat(10) begin
            rc.randomize() with {a<2;};
            $display("a: %0d", rc.a);
         end

         rc.cons_a.constraint_mode(0);
         $display("Disable cons_a constraint block");

         repeat(10) begin
            rc.randomize()with {a == 3;};
            $display("a: %0d", rc.a);
         end

    end
endmodule