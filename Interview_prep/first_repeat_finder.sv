module first_repeat_finder;
    int arr[] = `{2, 5, 3, 4, 5, 6};
    int seen[int];

    initial begin
        foreach (arr[i]) begin
            if(seen.exists[arr[i]]) begin
                $display("First repeated number = %d", arr[i]);
            end else begin
                seen[arr[i]] = 1;
            end
        end
    end
endmodule