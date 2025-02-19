//Scenario: Randomizing data selection in a test

/*Defining Transaction classes:
  read transaction: Represents a read operation.
  write_transaction: Represents a write operation.
  atomic_transaction: Represents an atomic operation.
  
  Each of the above classes may have different fields.*/

  class read_transaction extends uvm_sequence_item;
    rand int address;
    rand int length;
    // Additional fields and methods

    //Constraint for address and length fields in read_transaction
    constraint address_range_c {
        address inside {[0:1023]}; //Restrict address range to 0 - 1023
    }

    constraint length_c {
        length inside {[1, 2, 4, 8]}; //Restrict length to specific values
    }
  endclass

  class write_transaction extends uvm_sequence_item;
    rand int address;
    rand int length;
    rand int data;
    // Additional fields and methods

    //Constraints for write transaction fields
    constraint address_range_c {
        address inside {[0 : 2047]}; // Restrict address range to 0 - 2047 for writes
    }
    constraint length_c {
        length > 0 && length <= 64; //Limit length to a maximum of 64 bytes
    }
    constraint data_c {
        data inside {[0:255]}; // Limit data to a byte (0-255)
    }
  endclass

  class atomic_transaction extends uvm_sequence_item;
    rand int address;
    rand int atomic_op; //atomic operation code
    // Additional fields and methods
  endclass

  //Using a handle to randomly select transaction type
  class my_random_test_sequence extends uvm_sequence #(uvm_sequence_item);
    `uvm_object_utils(my_random_test_sequence)

    uvm_sequence_item tr_handle; //Handle to randomly select transaction type
    rand int tr_type_selector;   //Ranndom variable to control transaction type selection

    //Constraints on transaction type selection
    constraint tr_type_selector_c {
        tr_type_selector inside {0,1}; //Only allow read and write transactions
    }

    function new(string name = "my_random_test_sequence");
        super.new(name);
    endfunction

    virtual task body();
        //Randomly select a transaction type and execute it multiple times
        repeat(10) begin
            this.randomize_tr_handle();
            tr_handle.randomize(); //Randomize the fields of the transaction
            start_item(tr.handle);
            finish_item(tr.handle);
        end
    endtask

    //Function to randomize transaction handle
    function void randomize_tr_handle();
        if (this.randomize(tr_type_selector)) begin
        case (tr_type_selector) //Randomly choose a number between 0, 1 and 2
            0: tr_handle = read_transaction::type_id::create("tr_handle");
            1: tr_handle = write_transaction::type_id::create("tr_handle");
            2: tr_handle = atomic_transaction::type_id::create("tr_handle");
        endcase
    end
    endfunction
  endclass

  //Calling the sequence in the test
  my_random_test_sequence seq;
  initial begin
    seq = my_random_test_sequence::type_id::create("seq");
    seq.start(null);
  end