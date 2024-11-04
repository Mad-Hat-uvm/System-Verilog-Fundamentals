/* Question: Write a SV function to compute the sum of all elements in an unpacked array 
             of integers.*/
             
module SumArray;
    typedef int int_array_t[10];

    //Function to compute the sum of elements
    function int sum_array(input int_array_t arr);
        int sum = 0;
        for (int i = 0; i < arr.size(); i++) begin
            sum += arr[i];
        end
        return sum;
    endfunction

    //Test the function
    initial begin
        int_array_t test_array = '{1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
        int total_sum = sum_array(test_array);
        $display("Array: %0p", test_array);
        $display("Total sum: %0d", total_sum);
    end
    
endmodule