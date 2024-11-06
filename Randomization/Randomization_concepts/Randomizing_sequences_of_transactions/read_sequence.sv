/*In the read_sequence, we’ll set transaction_type to "READ" and randomize the 
address with an inline constraint to limit the address range for read operations.*/

class read_sequence extends uvm_sequence #(mem_transaction);
    `uvm_object_utils(read_sequence)

    //Constructor
    function new(string name = "read_sequence");
        super.new(name);
    endfunction

    //Main body of the read sequence
    virtual task body();
        mem_transaction txn;
        txn = mem_transaction::type_id::create("txn", this);

    //Set the transaction type to read
        txn.transaction_type = "READ";

    //Randomize the address eith inline constraint
        if(!txn.randomize() with {address inside {32'h0000_0000 : 32'h0000_0FFF}; }) begin
            `uvm_error("READ_SEQ", "Failed to randomize read transaction");
        end

        //Start the transaction
        `uvm_info("READ_SEQ", $sformatf("Read transaction - Address: %0h", txn.address), UVM_LOW);
        start_item(txn);
        finish_item(txn);
    endtask
endclass