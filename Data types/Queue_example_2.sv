Implement a circular queue(ring buffer) that wraps around when it reaches the end of the
array. The queue should support the enqueue, dequeue, is_empty, and is_full operations.

Solution:
A circular queue in SV can be implemented with an array and two pointers, head and tail.

module CircularQueue #(parameter DEPTH = 8, DATA_WIDTH = 8);
    //Fixed size array for circular buffer
    logic [DATA_WIDTH-1:0] buffer[$:DEPTH];
    int head = 0, tail = 0;
    int count = 0; //tracks the number of elements in the queue

    //Task to enqueue with overflow protection
    task enqueue (input logic [DATA_WIDTH-1:0] data);
        if(count < DEPTH) begin
            buffer[tail] = data;
            tail = (tail + 1) % DEPTH;
            count ++;
        end else begin
            $display("Error: Circular Queue Overflow");
        end
    endtask

    //Function to dequeue with underflow protection
    function logic [DATA_WIDTH-1:0] dequeue();
        if(count > 0) begin
            logic [DATA_WIDTH-1:0] data = buffer[head];
            head = (head + 1) % DEPTH; //Wrap-around for head pointer
            count--;
            dequeue = 'x; //Returning 'x as a placeholder for empty dequeue
        end
    endfunction

    //Check if the queue is empty
    function logic is_empty();
        is_empty = (count == 0);
    endfunction

    //Check if the queue is full
    function logic is_full();
        is_full = (count == DEPTH);
    endfunction

    //Display the current state of the circular queue
    task display_queue();
        if (count == 0) begin
            $display("Queue is empty.");
        end else begin
            $display("Queue contents:");
            for(int i = 0; i < count; i++) begin
                int index = (head + i) % DEPTH;//Calculate the correct index in circular manner
                $display("buffer[%0d] = %0d", index, buffer[index]);
            end
        end
    endtask

endmodule