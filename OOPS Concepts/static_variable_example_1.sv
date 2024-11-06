//Static variable initialization

class Transaction;
    bit [31:0] data;
    bit [7:0] addr;

    static int trans_cnt = 0;

    function new();
        trans_cnt++;
    endfunction

    task initialize_static(input int initial_val);
        trans_cnt = initial_val;
    endtask

    task print_var();
        $display("cnt: %0d", trans_cnt);
    endtask
endclass

module testTrans;
    Transaction t1, t2, t3;

    initial begin
        t1 = new();
        t1.print_var();
        t2.initialize_static();
        t2 =new();
        t2.print_var();
        t3 = new();
        t3.print_var();

    end
endmodule