/*Variable length size based on weight*/

class dynamic_data_len;
    typedef enum {BYTE, WORD, LWRD} data_len;

    rand data_len len;

    bit [31:0] byte_wt = 1; word_wt = 3; lwrd_wt = 5;
    constraint c_data_len {
        len dist {BYTE := byte_wt;
                  WORD := word_wt;
                  LWRD := lwrd_wt};
    }
endclass

module dynamic_len_test;
    initial begin
        dynamic_data_len d1;
        d1 = new();
        repeat(10) begin
            d1.randomize();
            $display("Len is: $s",d1.len);
        end
    end
endmodule