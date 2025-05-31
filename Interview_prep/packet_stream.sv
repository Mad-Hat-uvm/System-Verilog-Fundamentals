/* Problem Statement
You are asked to generate a sequence of packets with the following constraints:
id must be unique
type must be one of {data, ctrl}
If type == ctrl, then length == 0
No two adjacent packets can both be of ctrl type

🧠 Strategy
This question tests:
Your use of:
foreach
-> implication
!= for uniqueness
Structuring cross-packet constraints (adjacent dependency)
Class and constraint modeling of structured data */

class packet;
    rand bit [3:0] id;
    rand bit [1:0] type;      // 0 = data, 1 = ctrl
    rand bit [7:0] length;

    constraint type_range {type inside {0, 1}; }
    constraint ctrl_length {type == 1 -> length == 0; };

    `uvm_object_utils_begin(packet)
      `uvm_field_int(id,     UVM_ALL_ON)
      `uvm_field_int(type,   UVM_ALL_ON)
      `uvm_field_int(length, UVM_ALL_ON)
    `uvm_object_utils_end

    function new(string name = "packet");
        super.new();
    endfunction
endclass

class packet_stream;
    rand packet pkts[5];

    //Ensure unique IDs
    constraint unique_ids {
        foreach(pkts[i])
         foreach(pkts[j])
           if(i != j) pkts[i].id != pkts[j].id;
    }

    //Disallow adjacent control packets
    constraint no_adjacent_control {
      foreach (pkts[i]) 
      if (i < pkts.size() - 1) 
      (pkts[i].type == 1 && pkts[i+1].type == 1) -> 0;
    }

    function void show();
        foreach (pkts[i])
        $display("Pkt[%0d]: id=%0d, type=%s, length=%0d", i, pkts[i].id, 
        (pkts[i].type == 0) ? "DATA" : "CTRL", pkts[i].length);
        
    endfunction
endclass