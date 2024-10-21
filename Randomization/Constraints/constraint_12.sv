//In the below case the RANDOMIZATION WILL FAIL!!!!!!

class randClass;

    rand bit a,b;  

    constraint c1 {  
     (a <-> b);      
     a == 1;
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
    end
endmodule