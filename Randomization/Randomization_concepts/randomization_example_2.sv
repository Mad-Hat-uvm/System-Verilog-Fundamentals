/*Pre randomization and post randomization
  Scenario: If the an address is written to, if the next operation is read, it needs to 
            read from the same data*/

class packet;
    rand bit [31:0] addr;
    rand bit [63:0] data;
    rand bit wr;
    bit tmp_wr;

    //Disable addr randomization if previous operation is wr
    function void pre_randomize();
        if(tmp_wr == 1) addr.rand_mode(0);
        else addr.rand_mode(1);
    endfunction

    //Store the value of previous wr bit and display the values
    function void post_randomize();
        tmp_wr = wr;
         $display("Values: Addr = %0h, Data = %0h, wr = %0h", addr,data, wr)
    endfunction
endclass

module rand_methods;
    initial begin
        packet pkt;
        pkt = new();
        repeat(4) pkt.randomize();
    end
endmodule