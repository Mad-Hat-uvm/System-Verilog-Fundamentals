/*Question: Write a SV function that takes an unpacked array as input and returns
          a new unpacked array with the elements in reverse order.*/

module ReverseArray;

    //Define the datatype of the unpacked array
    typedef int int_array_t[10];

    //Function to reverse the array
    function int_array_t reverse(input int_array_t arr);
        int_array_t reversed;
        for(i = 0; i < arr.size(); i++) begin
            reversed[i] = arr[arr.size() - 1 - i];
        end
        return reversed;
    endfunction

    //Test the function
    initial begin
        int_array_t original = '{1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
        int_array_t reversed_array;

        reversed_array = reverse(original);
        $display("Original Array: %0p", original);
        $display("Reversed Array: %0p", reversed_array);
    end
    
endmodule