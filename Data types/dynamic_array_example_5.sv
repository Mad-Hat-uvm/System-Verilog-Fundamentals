/*Question: Write a function to reverse the elements of a dynamic array in place.*/

function void reverse_array(ref int array[]);
    int temp;
    int n = array.size();

    for(int i = 0; i < n / 2; i++) begin
        temp = array[i];
        array[i] = array[n - i - 1];
        array[n - i - 1] = temp;
    end
endfunction