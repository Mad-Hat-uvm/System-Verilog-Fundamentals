/*Scenario: Imagine a design where a process monitors for an interrupt signal and 
another process does background work. When the interrupt occurs, the background task 
should halt, and the interrupt should be handled immediately.*/

module interrupt_example;
    bit interrupt_occured = 0;

    initial begin
        fork
            begin
                #7 interrupt_occured = 1; // Triggered interrupt after 7 time units
                $display("Interrupt occured at time %0t", $time);
            end
            begin
                wait(interrupt_occured);
                $dispay("Handling interrupt at time %0t", $time);
            end
            begin
                repeat(10) begin
                    if (interrupt_occured) disable fork;
                    #1 $display("Background task running at time %0t", $time);
                end
            end
        join_any
        $display("Interrupt handled, main process continues at time %0t", $time);
    end
endmodule