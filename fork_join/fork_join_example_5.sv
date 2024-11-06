/*Scenario: In testbenches, you might want to stop all child processes if one of them 
 encounters an error. SystemVerilog allows for this using disable fork.*/

 module disable_fork_example;
    bit error_flag = 0;

    initial begin
        fork 
            begin
                #5 error_flag = 1; //Simulate an error
                $display("Error detected by process at time %0t", $time);
                disable fork;
            end

            begin
                #10 $display("Process 2 at time %0t", $time);
            end

            begin
                #15 $display("Process 3 at time %0t", $time);
            end
        join

        if(error_flag) begin
            $display("Error handled, simulation stopped at time %0t", $time);
        end else begin
            $display("All processes completed without error at time %0t", $time);
        end
    end
 endmodule