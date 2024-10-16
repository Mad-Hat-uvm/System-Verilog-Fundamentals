class rand_var;
    rand logic [2:0] v; //0 to 7, including 7

    constraint c1 {
        v > 7;        //In order to see what is the result of the constraint solver
    }
endclass

module tb;
    rand_var r_var;

    initial begin
        r_var = new();
        
        for(int i = 0; i < 10; i++) begin
            $display("Round: %0d", i);
            //if r_var.randomize is successful
            $display("Randomize: %0d: r_var.v: %0d", r_var.randomize(), r_var.v);
        end
    end
endmodule

