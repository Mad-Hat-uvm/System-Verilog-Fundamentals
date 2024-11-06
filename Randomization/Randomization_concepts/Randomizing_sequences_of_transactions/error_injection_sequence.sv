/*In error_injection_sequence, we’ll configure the transaction for error injection by 
setting transaction_type to "ERROR". The inline constraints will set specific values 
or ranges for address and data that are likely to cause errors, such as an out-of-bounds 
address or invalid data patterns.*/

class error_injection_sequence extends uvm_sequence #(mem_transaction);
    `uvm_object_utils(error_injection_sequence)

    //Constructor
    function new(string name = "error_injection_sequence");
        super.new(name);
    endfunction

    //Main body of the read sequence
    virtual task body();
        mem_transaction txn;
        txn = mem_transaction::type_id::create("txn", this);

    //Set the transaction type to read
        txn.transaction_type = "ERROR";

    //Randomize the address eith inline constraint
        if(!txn.randomize() with {
                                  address inside {32'hFFFF_0000 : 32'hFFFF_FFFF}; //out of bounds address range
                                  data == 32'hDEAD_BEEF;
                                 }) begin
            `uvm_error("ERROR_SEQ", "Failed to randomize write transaction");
        end

        //Start the transaction
        `uvm_info("ERROR_SEQ", $sformatf("Error transaction - Address: %0h, Data: %0h", txn.address, txn.data), UVM_LOW);
        start_item(txn);
        finish_item(txn);
    endtask
endclass