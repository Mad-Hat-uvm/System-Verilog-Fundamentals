/*In the write_sequence, we’ll set transaction_type to "WRITE" and randomize both 
address and data fields, applying constraints to control the address range and a
specific range for the data value.*/

class write_sequence extends uvm_sequence #(mem_transaction);
    `uvm_object_utils(read_sequence)

    //Constructor
    function new(string name = "write_sequence");
        super.new(name);
    endfunction

    //Main body of the read sequence
    virtual task body();
        mem_transaction txn;
        txn = mem_transaction::type_id::create("txn", this);

    //Set the transaction type to read
        txn.transaction_type = "WRITE";

    //Randomize the address eith inline constraint
        if(!txn.randomize() with {
                                  address inside {32'h0000_0000 : 32'h0000_0FFF};
                                  data inside {32'h0000_0000 : 32'h0000_0FFF};
                                 }) begin
            `uvm_error("WRITE_SEQ", "Failed to randomize write transaction");
        end

        //Start the transaction
        `uvm_info("WRITE_SEQ", $sformatf("Write transaction - Address: %0h, Data: %0h", txn.address, txn.data), UVM_LOW);
        start_item(txn);
        finish_item(txn);
    endtask
endclass