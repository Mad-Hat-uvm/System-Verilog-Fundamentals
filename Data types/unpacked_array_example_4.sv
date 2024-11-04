/*Question: Write a SV task to rotate an unpacked array by N positions to the right. 
            For example, rotating {1, 2, 3, 4, 5} by 2 would result in {4, 5, 1, 2, 3}.*/

module RotateArray;

    typedef int int_array_t[5];

    //Task to rotate the array to the right by N positions
    task rotate(input int N, inout int_array_t arr);
    int_array_t temp;
    int len = arr.size();

    for(int i = 0; i < len; i++) begin
        temp[(i + N) % len] = arr[i];
    end

    //Copy rotated elements back to original array
    for(int i = 0; i < len; i++) begin
        arr[i] = temp[i];
    end
    endtask

    //Test the task
    initial begin
        int_array_t test_array = '{1, 2, 3, 4, 5};
        int rotate_by = 2;

        $dispay("Original Array: %0p", test_array);
        rotate(rotate_by, test_array);
        $display("Array after rotating by %0d: %0p", rotate_by, test_array);
    end
endmodule