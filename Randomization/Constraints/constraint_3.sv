class randClass;
    rand logic [7:0] lo, med, hi; 

    constraint c1 {
       /*It will be wrong if we use (lo < med < hi), 
        as it will solve as ((lo < med) < hi) or (lo < (med < hi)). Hence, if (lo < med) is true, then this espression 
        will equal to 1. Then the overall expression viewed by tool will be as 1 < hi.
        if (lo < med) is false, then the overall expression viewed by the tool is 0 < hi. 
        Hence binary constraints shall be used, where the operator is used only once. */

        lo < med;
        med < hi;
    }
endclass

module tb;
    randClass rc;

    initial begin
        rc = new();
        
        repeat(10) begin
           rc.randomize();
           $display("lo: %0d, med: %0d, hi: %0d", rc.lo, rc.med, rc.hi);
        end
    end
endmodule