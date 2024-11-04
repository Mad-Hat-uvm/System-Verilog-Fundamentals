Question: Write a SV module to generate a sequence of integers from 1 to N and store 
them in a queue. Then, dequeue them and display the output.

module SequenceGenerator #(parameter int N = 10);
    logic [31:0] numberQueue[$];

    //Task to generate and enqueue numbers from 1 to N
    task generate_sequence();
        for(int i = 0; i <= N; i++) begin
            numberQueue.push_back(i);
        end
    endtask

    //Task to dequeue and display numbers
    task display_sequence();
        while (numberQueue.size() > 0) begin
            $display("Number: %0d", numberQueue.pop_front());
        end
    endtask

    //Test the sequence generator
    initial begin
        generate_sequence();
        display_sequence();
    end
endmodule