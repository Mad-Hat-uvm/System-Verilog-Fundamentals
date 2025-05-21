/* Randomize a packet with dependent constraints
**Problem:** Create a `packet` class with these constraints:
- `len` must be even if `type == 0`
- `len` must be odd if `type == 1`
- `priority` must be high (1) if `len > 8` */

class smart_packet;
    rand bit [3:0] len;
    rand bit [1:0] type;
    rand bit priority;

    constraint len_type {
        (type == 0) -> (len % 2 == 0);
        (type == 1) -> (len % 2 == 1);
    }

    constraint priority {
        (len > 8) -> priority == 1;
    }

    `uvm_object_utils_begin
      `uvm_field_int(len, UVM_ALL_ON)
      `uvm_field_int(type, UVM_ALL_ON)
      `uvm_field_int(priority, UVM_ALL_ON)
    `uvm_object_utils_end

    function new(string name = "smart_packet");
        super.new(name);
    endfunction
endclass