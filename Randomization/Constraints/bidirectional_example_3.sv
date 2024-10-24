Q.: Create a class with an array of 5 integers. Use bidirectional constraints to ensure
 that first element is always equal to the last element.
 
 class ArrayBidirectionalExample;
    rand int arr[5];

    constraint c_array {arr[0] == arr[4];}

 endclass

 module test;
    ArrayBidirectionalExample obj;

    initial begin
        obj = new();

        repeat(10) begin
            if(obj.randomize()) begin
                $display("Array: %p", obj.arr);
            end else begin
                $display("Randomization failed.");
            end
        end
    end
 endmodule