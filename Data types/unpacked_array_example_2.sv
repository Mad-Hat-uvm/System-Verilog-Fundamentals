/*Question: Write s SV function that finds and returns the maximum value in an unpacked 
array of integers */

module MaxinArray;

    typedef int int_array_t[10];

    //Function to find the maximum value
    function int find_max(int_array_t arr);
        int max_val = arr[0]; //Assume first element is the max
        if(arr.size() > 0) begin
        for(int i = 0; i < arr.size(); i++) begin
            if (arr[i] > max_val) begin
                max_val = arr[i];
            end
        end
        return max_val;
    end else begin
        $display("Error: Array size is 0");
    end
    endfunction
endmodule