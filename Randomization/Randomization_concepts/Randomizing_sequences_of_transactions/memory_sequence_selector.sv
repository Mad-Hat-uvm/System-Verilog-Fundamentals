/*This class will hold the handle to the sequence that will be selected and randomized.*/

class memory_sequence_selector extends uvm_object;
    `uvm_object_utils(memory_sequence_selector)

   //Handle to a uvm_sequence (polymorphic)
    uvm_sequence_base seq_handle;

  //Enum to control selection probabilities
    typedef enum {READ, WRITE, ERROR} seq_type_enum;
    rand seq_type_enum seq_type;

    function new(string name = "memory_sequence_selector");
        super.new(name);
    endfunction

    constraint seq_type_constraint {
        seq_type dist {READ := 50, WRITE := 40, ERROR := 10};
    }

    //Method to select the sequence based on sequence type
    function void select_sequence();
        case (seq_type)
            READ  : seq_handle = read_sequence::type_id::create("read_sequence");
            WRITE : seq_handle = write_sequence::type_id::create("write_sequence");
            ERROR : seq_handle = error_sequence::type_id::create("error_sequence");
        endcase
    endfunction
endclass