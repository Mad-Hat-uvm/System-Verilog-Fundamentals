Q. Create an array of 5 integers. Use inline constraints to ensure that all 
elements of the array are between 1 and 50.

class array_example;
    rand int arr[5];
endclass

module test;
    array_example obj;

    initial begin
        obj = new();
        if(obj.randomize() with {foreach(arr[i]) arr[i] inside {[1:50]};}) begin
            $display("Array: %p", obj.arr);
        end else begin
            $display("Randomization failed");
        end
    end
endmodule