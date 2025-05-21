/* ### ✅ Q5: Randomize a 5-element array such that:
- All values are unique
- All values are less than 10 */

class unique_array_gen;
    rand bit [3:0] arr[];

    constraint no_duplicates {
        foreach (arr[i])
         foreach (arr[j])
         if(i != j) arr[i] != arr[j];
    }

    constraint value_limit {
        foreach arr([i]) arr[i] < 10;
    }

    function void display();
        foreach (arr[i]) 
         $display ("arr[%0d] = %0d", i, arr[i]);
    endfunction
endclass

//----------------- in a module
initial begin
    unique_array_gen u = new();
    assert(u.randomize());
    u.display();
end