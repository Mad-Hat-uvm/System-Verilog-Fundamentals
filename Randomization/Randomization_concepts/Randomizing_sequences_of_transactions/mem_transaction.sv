/*This transaction class could represent a generic memory transaction with fields for 
address, data, and type (e.g., read or write).*/

class mem_transaction extends uvm_sequence_item;
    `uvm_object_utils(mem_transaction)

    rand bit [31:0] address;       //Memory address
    rand bit [31:0] data;          //Data to write
    rand string transaction_type;  //Type of transaction

    function new(string name = "mem_transaction");
        super.new(name);
    endfunction

`uvm_object_utils_begin
 `uvm_field_int(address, UVM_DEFAULT)
 `uvm_field_int(data, UVM_DEFAULT)
 `uvm_field_string(transaction_type, UVM_DEFAULT)
`uvm_object_utils_end

endclass