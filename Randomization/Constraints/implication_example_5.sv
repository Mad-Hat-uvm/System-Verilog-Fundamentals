class MultiConditionExample;
    rand int a,b,c;

    constraint c_multi{
        ((a > 0) && (b > 0)) -> (c > 100); 
    }
endclass

module test;
    MultiConditionExample obj;

    initial begin
        obj = new();

        repeat (10) begin
            if(obj.randomize()) begin
                $display("a: %d, b: %d, c: %d", obj.a, obj.b, obj.c);
            end else begin
                $display("Randomization Failed!!");
            end
        end
    end
endmodule