class DebugBidirectional;
    rand int a, b;

    constraint c_debug{
        (a + b) / 2 == a;
    }

endclass

module test;
    DebugBidirectional obj;

    initial begin
        obj = new();

        repeat(10) begin
            if(obj.randomize()) begin
                $display("a: %0d, b: %0d", obj.a, obj.b);
            end else begin
                $display("Randomization failed.");
            end
        end
    end
endmodule

Explanation: The above constraint involves division, which could produce a non-integer 
             results. The fixed version simplifies the relationship a == b.