class SymmetricalExample;
    rand int a, b;

    //Bidirectional constraint: a must equal b and vice versa
    constraint c_symmetrical{a == b; }
endclass

module test;
    SymmetricalExample obj;

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