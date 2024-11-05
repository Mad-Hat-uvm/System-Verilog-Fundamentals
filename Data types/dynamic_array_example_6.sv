/*Question: Write a function that takes two dynamic arrays as inputs and returns a new 
dynamic array*/

function int concatenate_arrays(input int array1[], input int array2[]);
    int result_array[] = new[array1.size() + array2.size()]; //Allocate memory

    //Copy elements from first array
    for(int i = 0; i < array1.size(); i++) begin
        result_array[i] = array1[i];
    end

    //Copy elementsfrom second array
    for(int j = 0; j < array2.size(); j++) begin
        result_array[array1.size() + j] = array2[j];
    end

    return result_array;
endfunction