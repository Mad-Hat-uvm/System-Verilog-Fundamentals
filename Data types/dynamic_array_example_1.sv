/*Question: Write a function that initializes a dynamic array of integers with values
            from 1 to N, where N is passed as an argument to the function.*/
            
function int dynamic_array_populate(input int N);
    int array [];

// Check for valid size
    if(N <= 0) begin
        $display("Error: Invalid array size.");
        return array;
    end

    array = new[N];

    for(int i = 0; i < N; i++) begin
        array[i] = i + 1;
    end

    return array;
endfunction