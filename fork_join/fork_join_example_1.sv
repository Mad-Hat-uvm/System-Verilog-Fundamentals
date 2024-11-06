/*Here is a simple example demonstrating fork...join */

module fork_join_example;
    initial begin
        fork
            $display("Process 1 started at time %0t", $time);
            #5 $display("Process 2 started at time %0t", $time);
            #10 $display("Process 3 started at time %0t", $time);
        join
        $display("All process completed at time %0t", $time);
    end
    endmodule