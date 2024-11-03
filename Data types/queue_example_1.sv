Design a Fifo (First in, First out) queue with the operations enqueue, dequeue and peek. 
The queue should maintain insertion order and have a fixed size with overflow and 
underflow protection.

module FifoQueue #(parameter int DEPTH = 8, DATA_WIDTH = 8);
    //Define a queue with maximum depth
    logic [DATA_WIDTH-1:0] queue[$:DEPTH];

    //Enqueue task with overflow protection
    task enqueue (input logic [DATA_WIDTH-1:0] data);
        if(queue.size() < DEPTH) begin
            queue.push_back(data);
        end else begin
            $display("Error: Queue Overflow");
        end
    endtask

    //Dequeue function with underflow protection
    function logic [DATA_WIDTH-1:0] dequeue();
        if(queue.size() > 0) begin
            dequeue = queue.pop_front();
        end else begin
            $display("Error: Queue Underflow");
            dequeue = 'x;    
        end
    endfunction

    //Peek function to look at the front of the queue
    function logic [DATA_WIDTH-1:0] peek();
        if(queue.size() > 0) begin
            peek = queue[0];
        end else begin
            $display("Error: Queue is empty");
            peek = 'x;
        end
    endfunction

    //Function to check if the queue is empty
    function logic is_empty();
        is_empty = (queue.size() == 0);
    endfunction

    //Function to get the current queue size
    function int get_size();
        get_size = queue.size();
    endfunction
endmodule