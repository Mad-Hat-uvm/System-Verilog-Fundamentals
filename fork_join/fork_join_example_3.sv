/*Question: Imagine you are testing a memory access mechanism where two threads
 try to write to the same location in a memory module. Use fork...join to simulate 
 this race condition and observe its effects.
 
 Solution: In the above race condition, we can avoid conflict using semaphores, 
           allowing only one process to access memory[0] at a time.*/

module semaphore_example;
    reg [7:0] memory [0:3];
    semaphore mem_access;

    initial begin
        memory[0]  = 8'hAA;
        mem_access = new(1); //Semaphore with a single token

    fork
        begin
            mem_access.get(); //Acquire semaphore
            #5 memory[0] = 8'hBB;
            $display("Process 1 wrote BB at time %0t", $time);
            mem_access.put(); //Release key
        end

        begin
            mem_access.get();  //Acquire semaphore
            #5 memory[0] = 8'hCC;
            $display("Process 1 wrote CC at time %0t", $time);
            mem_access.put();  //Release key
        end
    join
    end

    $display("Final memory[0] value: %0h", memory[0]);
endmodule

