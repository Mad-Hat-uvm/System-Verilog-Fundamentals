/*Constrained randomizing of an index of an array*/

class randc_idx;
    int arr[7] = '{10, 20, 30, 40 ,50, 60, 70};
    randc bit [2:0] idx;

    function int choose_array_element();
        return arr[idx];
    endfunction

endclass

module test_randc_idx;
    initial begin
        randc_idx r1;
        r1 = new();
        repeat(10) begin
            assert(r1.randomize());
            $display("val: %0d, idx: %0d", r1.choose_array_element(), r1.idx);
        end
    end
endmodule