/* **Problem:** Define a packet header class with the following constraints:
- `id` must be 4-bit, non-zero
- `type` must be either 2 or 3
- `priority` must be 0 if `type` is 3 */

class packet;
    rand bit [3:0] id;
    rand bit [1:0] type;
    rand bit priority;

    constraint valid_id {id != 0};
    constraint allowed_type {type inside {2, 3}; }
    constraint type_priority {
        type == 3 -> priority == 0;
    }

    `uvm_object_utils_begin
      `uvm_field_int(id, UVM_ALL_ON)
      `uvm_field_int(type, UVM_ALL_ON)
      `uvm_field_int(priority, UVM_ALL_ON)
    `uvm_object_utils_end

    function new(string name = "packet");
        super.new(name);
    endfunction

endclass