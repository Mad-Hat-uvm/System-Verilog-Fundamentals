class randc_Class;
    rand logic [1:0] v1; //0 to 7, including 7
    randc logic [1:0] v2; //All values should occur atleast once before repetition
    
endclass

module tb;
    randc_Class rc;

    initial begin
        rc = new();
        
        repeat(10) begin
            rc.randomize();
            $display("v1: %0d, v2: %0d", rc.v1, rc.v2);
        end
    end
endmodule