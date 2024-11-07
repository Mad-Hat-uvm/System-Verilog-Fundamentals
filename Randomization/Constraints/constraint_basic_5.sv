/*depending on the address space(mem_space or io_space), the MSB of the address is set*/

class pkt;
    typedef enum {mem_space, io_space} addr_space;

    rand addr_space addr_s;
    rand [7:0] addr;
    rand [31:0] data;
    rand bit wr;

    constraint c_addr_space {
          (addr_s == mem_space) -> addr[7] == 0;
          (addr_s == io_space) -> addr[7] == 1;
    }

endclass

module test_pkt;
initial begin
    pkt p1;
    p1 = new();
    p1.randomize;
    $display("Addr_space: %0s, AAD MSB: %0b", p1.addr_s, p1.addr[7]);
end
endmodule