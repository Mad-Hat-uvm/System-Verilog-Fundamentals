/*Question: Write a task to append an integer to the end of a dynamic array. 
The task should take a dynamic array and the element to be appended as inputs.*/

task append_element(ref int array[], input int element);
    int new_size = array.size() + 1;
    array = {array, element};
endtask