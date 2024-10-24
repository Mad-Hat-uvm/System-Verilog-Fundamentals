Q.: If a > 10, b must be in the range {20:30}.

class ConditionalRange;
    rand int a, b;

    constraint c_bidirectional {
        (a > 10) <-> (b inside {[20:30]});
    }
    
endclass

module test;
    ConditionalRange obj;

    initial begin
        obj = new();

        repeat(10) begin
            if(obj.randomize()) begin
                //if(obj.randomize() with {a > 10;}) begin : for verifying the constraint
                $display("a: %0d, b: %0d", obj.a, obj.b);
            end else begin
                $display("Randomization failed.");
            end
        end
    end
endmodule

Important: Incase you want to verify the constraint is working you can put an inline 
           constraint where a is always more than 10.
