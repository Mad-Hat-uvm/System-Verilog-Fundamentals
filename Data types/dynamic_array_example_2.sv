/*Question: Write a function that takes a dynamic array of integers as input and returns
            the maximum value in the array*/

function find_max_value(input int array[]);
    if(array.size() == 0) begin
        $display("Error: Array is empty.");
        return 'x;
    end

    int max_val = int'low; // Initialize to the lowest possible integer

    foreach(array[i]) begin
        if(array[i] > max_val) begin
            max_val = array[i];
        end
    end

    return max_val;
endfunction