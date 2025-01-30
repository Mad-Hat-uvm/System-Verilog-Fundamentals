class MySequence_static extends uvm_sequence # (MyTransaction);
    static int TotalTransactions;
    task body();
        MyTransaction trans = MyTransaction::type_id::create("trans");
        start_item(trans);
        finish_item(trans);
        TotalTransactions++;
    endtask
endclass
   

   