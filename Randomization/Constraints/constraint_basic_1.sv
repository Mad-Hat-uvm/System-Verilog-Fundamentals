class pkt;
    randc bit [7:0] addr;
    rand bit [7:0] data;
    rand bit wr;

    constraint addr_range { addr inside {[0:15]}; }
    constraint data_range { !(data inside {[16:255]}); }
    constraint wr_val {wr = 1; }

endclass

module test_pkt;

    initial begin
        pkt p1;
        p1 = new();
        repeat(10) begin
            p1.randomize();
        end
    end
endmodule