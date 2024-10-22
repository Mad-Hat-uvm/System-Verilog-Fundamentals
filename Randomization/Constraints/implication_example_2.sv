Q.: Create a class eith an array of five 8 bit values. Use constraints to ensure that if 
the first element of the array is even, the last element must be equal to the first 
element.

class array_implication;
  
    rand bit [7:0] arr[5];

    constraint arr_c{
        (arr[0] % 2 == 0) -> (arr[4] == arr[0]);
    }
endclass

module test;
   array_implication obj;

    initial begin
        obj = new();
        
        repeat(10) begin
           if(obj.randomize()) begin
           $display("Array %0p", obj.arr);
        end else begin
            $display("Randomization failed!!");
        end
    end
    end
endmodule