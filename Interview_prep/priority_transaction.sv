/* Randomize a priority queue of transactions
**Problem:** Randomize a queue of 4 transaction objects, where:
- Priority must be highest for even-indexed entries
- No two priorities can be the same */

class transaction;
    rand bit [3:0] id;
    rand bit [2:0] priority;

    constraint id_valid {id != 0};

    `uvm_object_utils_begin
      `uvm_field_int(id, UVM_ALL_ON)
      `uvm_field_int(priority, UVM_ALL_ON)
    `uvm_object_utils_end

    function new(string name = "transaction");
        super.new("transaction");
    endfunction

endclass

class transaction_queue;
    rand transaction tlist[4];

    constraint unique_priorities{
        foreach(tlist[i])
         foreach(tlist[j])
         if(i != j) tlist[i].priority != tlist[j].priority;
    }

    constraint even_priority_bias {
        foreach(tlist[i])
         if(i % 2 == 0) tlist.priority < 3;
    }

    function void show();
        foreach (tlist[i])
         $display("[%0d] id=%0d, prio=%0d", i, tlist[i].id, tlist[i].priority);
    endfunction

endclass

module test_transaction_queue;
    transaction_queue tq = new();
    initial begin
        assert(tq.randomize());
        tq.show();
    end

endmodule