Q.: Ensure bidirectional distribution where if p > 10, the value of q is 20 60% of 
    the time and 30 40% of the time.

    class DistributionExample;
        rand int p, q;

        constraint c_dist{
            (p > 10) == (q dist {20 := 60, 30 := 40});
        }
    endclass

    module test;
        DistributionExample obj;
    
        initial begin
            obj = new();
    
            repeat(10) begin
                if(obj.randomize()) begin
                    $display("p: %0d, q: %0d", obj.p, obj.q);
                end else begin
                    $display("Randomization failed.");
                end
            end
        end
    endmodule
    