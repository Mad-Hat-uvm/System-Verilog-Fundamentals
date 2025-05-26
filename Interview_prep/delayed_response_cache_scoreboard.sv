/* 🧩 Problem Statement:
In your DUT, read responses can be delayed by multiple clock cycles and may arrive out-of-order.
You need to design a scoreboard that still correctly verifies the read response data against expected values — even if the 
response comes several cycles after the request.

🧠 Strategy:
Shadow Memory Model:
Maintain a reference memory (shadow_mem) that mirrors all write transactions to track expected values at each address.

Track Outstanding Read Requests:
When a read request occurs, look up the expected data from the shadow memory and store it in a pending_reads associative array, 
indexed by address.

Handle Responses Separately:
When a read response arrives, match it by addr against pending_reads.

Compare actual_data vs. expected_data.

Decision Logic in write():
If transaction is a write, update shadow memory.
If it’s a read request (read_data === 'hx), store the expected response.
If it’s a read response, compare actual vs expected and raise errors if mismatched. */

module delayed_response_cache_scoreboard extends uvm_component;
 `uvm_component_utils(delayed_response_cache_scoreboard)
    //Analysis export to connect to the monitor
    uvm_analysis_imp #(cache_transaction, delayed_response_cache_scoreboard) analysis_export;

    //Reference model: shadow memory to store expected values
    bit [31:0] shadow_mem[bit[7:0]]; //addr -> expected data

    //Track outstanding read requests(addr -> expected_data)
    typedef struct{
        bit [7:0] addr,
        bit [31:0] expected_data;
    } read_req_t;

    read_req_t pending_reads [bit[7:0]];

    function new(string name, uvm_component parent);
        super.new(name, parent);
        analysis_export = new("analysis_port", this);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
    endfunction

    //Main entry point for monitored tranactions
    function voit write(cache_transaction tr);

        //Case 1: Write -> Update shadow memory
        if(tr.write) begin
            shadow_mem[tr.addr] <= tr.write_data;
        end

        //Case 2: Read request (no data yet)
        if(tr.read && tr.read_data === `hx) begin
            if(shadow_mem.exists(tr.addr)) begin
                write_read_request(tr.addr, shadow_mem[tr.addr]);
            end else begin
                ``uvm_warning(get_name(), $sformat("Read request for uninitialized address: %0h", tr.addr))
            end
        end

        //Case 3: Read response -> compare actual vs expected
        else if(tr.read && tr.read_data != `hx ) begin
            write_read_response(tr.addr, tr.read_data);
        end
    endfunction

    //Store expected value for a future read
    function void write_read_request(bit [7:0] addr, bit [31:0] expected_data);
        pending_reads[addr] = `{addr: addr, expected_data: expected_data};
    endfunction

    //Compare DUT response with reference value
    function void write_read_response(bit [7:0] addr, bit [31:0] actual_data);
        if(pending_reads.exists(addr)) begin
            bit [31:0] expected = pending_reads[addr].expected_data;

            if(expected_data != actual_data )begin
                `uvm_error(get_name(), $sformatf("Mismatch! addr:%0h, expected:%0h, got:%0h", addr, expected, actual_data));
            end else begin
                `uvm_info(get_name(), $sformatf("Read PASS: addr: %0h data: %0h", addr, actual_data), UVM_LOW);
            end
                
             pending_reads.delete(addr);

        end else begin
                `uvm_warning(get_name(), $sformatf("Unexpect response at addr: %0h with data: %0h", addr, actual_data));
                
        end
    endfunction


endmodule