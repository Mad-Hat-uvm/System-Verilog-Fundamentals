/*In your test, you can instantiate the memory_sequence_selector, randomize it, 
and then use the selected sequence.*/

class memory_controller_test extends uvm_test;
    `uvm_component_utils(memory_controller_test)

    memory_sequence_selector seq_selector;

    function new(string new = "memory_controller_test", uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        seq_selector = memory_sequence_selector::type_id::create("seq_selector");
    endfunction

    task run_phase(uvm_phase phase);
        phase.raise_objection(this);

        //Run transaction for a set number of iterations
        for(int i = 0; i < 20; i++) begin
            if (!seq_selector.randomize()) begin
                `uvm_error("SEQ_SEL", "Failed to randomize sequence selector")
            end

            //Select the sequence based on the randomized seq_type
            seq_selector.select_sequence();

            //Starting the sequence
            `uvm_info("SEQ_SEL", "Starting the sequence");
             seq_selector.seq_handle.start(null); //Start the sequence
        end
        
        phase.drop_objection(this);
    endtask

endclass