Question: Implement a priority queue in SV where elements are inserted with a priority 
          value. Higher-priority elements are dequeued first.

Solution: In SV, we can achieve this by sorting the queue based on the priority each 
          time we enqueue an element.

module PriorityQueue #(parameter int DATA_WIDTH = 8);
    typedef struct packed {
        logic [DATA_WIDTH-1:0] data;
        int priority;
    } priority_item_t;

    //Declare a queue of priority items
    priority_item_t priorityQueue[$];

    //Task to enqueue based on priority
    task enqueue (input logic [DATA_WIDTH-1:0] data, input int priority);
        priority_item_t item;
        item.data = data;
        item.priority = priority;
        priorityQueue.push_back(item);

        //Sort queue for priority(Simple insertion sort)
        for(int i = priorityQueue.size() - 1; i > 0, i--) begin
            if(priorityQueue[i].priority > priorityQueue[i-1].priority) begin
                priority_item_t temp = priorityQueue[i];
                priorityQueue[i] = priorityQueue[i-1];
                priorityQueue[i-1] = temp;
            end else begin
                break;
            end
        end
    endtask

    //Function to dequeue based on priority
    function logic [DATA_WIDTH-1:0] dequeue();
        if(priorityQueue.size() > 0) begin
            dequeue = priorityQueue.pop_front().data;
        end else begin
            $display("Error: Priority Queue underflow");
            dequeue = 'x;
        end
    endfunction

    //Task to display the priority queue
    task display_queue();
        for (int i = 0; i < priorityQueue.size(); i++) begin
            $display("Data: %0d, Priority: %0d", priorityQueue[i].data, priorityQueue[i].priority);
        end
    endtask
endmodule