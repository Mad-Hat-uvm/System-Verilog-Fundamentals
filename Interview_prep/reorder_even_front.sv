module reorder_event_front;
    int q[$] = `{3, 8, 1, 6, 5};
    int even[$], odd[$];

    initial begin
        foreach(q[i]) begin
            if (q[i] % 2 == 0) 
            even.push_back(q[i]);
            else
            odd.push_back(q[i]);
        end
    end

    q = {};
    q = {even,odd}; //concatenate
    $display("Reordered queue: %p", q);
endmodule
