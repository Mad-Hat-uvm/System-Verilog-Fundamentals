class randClass;
    rand logic [3:0] v1; 

    constraint c1 {
       //Excluding values from 0 to 10
        !(v1 inside {[0:10]});
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