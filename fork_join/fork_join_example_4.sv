/*Question: Use fork...join_none to run background tasks and use event to synchronize 
            them at a specific point in the simulation.*/

module event_sync_example;
    event sync_event;

    initial begin
        $display("Starting background processes at time %0t", $time);

        fork
            begin
                #10 -> sync_event;
                $display("Background process 1 triggered sync_event at time %0t", $time);
            end

            begin
                wait(sync_event.triggered);
                $display("Background process 2 triggered sync_event at time %0t", $time);
            end
        join_none;

        #20;
        $display("Main process completed at time %0t", $time);
    end
endmodule

/*Explanation:

Process 1 triggers sync_event after 10 time units.
Process 2 waits for sync_event and then executes, 
showing how event can synchronize independent processes running in the background.*/