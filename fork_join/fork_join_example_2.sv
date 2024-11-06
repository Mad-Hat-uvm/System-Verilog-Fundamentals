/*Question: How would you handle timeouts or monitor for a deadlock condition with
 fork...join?
 Solution: You can use join_any with a timer to prevent indefinite waiting.
fork...join_any: Proceeds after any one of the child processes completes. 
                 Useful when you only need to wait for one event or when any one of 
                 multiple events signals a state change. */

module fork_joint_timeout_example;
    initial begin
        bit timed_out = 0;
        fork
            begin
                #10;
                timed_out = 1;
            end

            begin
                //Main process that may get stuck
                //...some task
            end
        join_any

        if(timed_out == 1) begin
            $display("Timed out occured at time %0t", $time);
        end else begin
            $display("Process completed before timeout at time %0t", $time);
        end
    end
endmodule