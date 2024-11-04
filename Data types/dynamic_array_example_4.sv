/*Question: Write a function to delete an element at a specific index from a dynamic 
            array of integers. If the index is out of bounds, display an error message.*/

function void delete_element(ref int array[], input int index);
    if(index < 0 || index >= array.size()) begin
        $display("Error: Index out of bounds.");
        return;
    end else begin
        for(i = index; i < array.size(); i++) begin
            array[i] = array[i + 1];
        end

        //Resize the array to remove the lat element 
        array = array[0 : array.size() - 2];
    end
endfunction