/*Generate address depending on the address range*/

class addr_gen;
    typedef enum {low_range, mid_range, high_range} addr_range;

    rand bit [7:0] addr;
    rand addr_range addr_var;

    constraint c_addr{
        (addr_var == low_range) -> addr inside { [0 : 15] };
        (addr_var == mid_range) -> addr inside { [16 : 127]};
        (addr_var == high_range) -> addr inside { [128 : 255]};
    }
endclass

module addr_test;
    initial begin
        addr_gen addr_obj;
        addr_obj = new();
        assert(addr_obj.randomize() with {addr_var == mid_range;});
        $display("High addr generated is %0d\n", addr_obj.addr);
    end
endmodule