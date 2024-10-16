class randClass;
    rand logic [1:0] v1; 

    constraint c1 {
       //Weighted Distribution
        v1 dist {0 := 70, 1:= 10, 2 := 10, 3 := 10};
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