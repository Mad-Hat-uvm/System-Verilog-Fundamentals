
In SystemVerilog, to enforce 4K (4096-byte) alignment on a variable (e.g., an address), you can use constraints to ensure that the value is a multiple of 4096.

4K Alignment Constraint Example

class aligned_transaction;
    rand bit [31:0] addr; // 32-bit address

    constraint align_4k {
        addr % 4096 == 0; // Ensure address is a multiple of 4096
    }

    `uvm_object_utils(aligned_transaction)

    function new(string name = "aligned_transaction");
        super.new(name);
    end
endclass

module test;
    initial begin
        aligned_transaction tr;

        repeat (5) begin
            tr = new();
            if (tr.randomize()) begin
                $display("Randomized 4K-aligned address: 0x%0h", tr.addr);
            end else begin
                $display("Randomization failed!");
            end
        end
    end
endmodule

How This Works
	•	The constraint addr % 4096 == 0; ensures that the generated addr is a multiple of 4096.
	•	This guarantees that addr is aligned to a 4KB boundary.

Alternative Constraint Using Bitmask

A faster way to enforce 4K alignment (instead of using modulus) is to force the lower 12 bits to be 0:

constraint align_4k {
    addr[11:0] == 12'b0; // Force lower 12 bits to 0
}

This ensures that addr is a multiple of 4096 (2^12), avoiding division and improving performance.

Example Output

Randomized 4K-aligned address: 0x00001000
Randomized 4K-aligned address: 0x00002000
Randomized 4K-aligned address: 0x0000C000
Randomized 4K-aligned address: 0x0001F000
Randomized 4K-aligned address: 0x00030000

