/* You need to:
 ~ Generate this set once(in a dynamic queue)
 ~ Pick from it randomly
 ~ remove the picked value
 ~ Refill the set when empty 

 🟩 Strategy anchor:
     I need a data structure to track unused values — a queue or array.*/

class randc_emulator;

    // This is the value we will output like 'randc'

    bit [4:0] val;

    // This queue holds the remaining values not yet used in this cycle
    bit [4:0] history[$]; //dynamic queue

    //Constructor
    function new(string name = "randc_emulator");
    endfunction

    //This function initializes the queue with all the possible values for a 5 bit variable
    function void init();
        history.delete(); //Clear all old values

        //For 5 bit: push values 0 to 31 into history queue
        foreach (bit [4:0] i)
         history.push_back(i);
    endfunction

    //Picks up new value randomly for the queue and deremoves it
    function void randomize_val();
        //If all the values have been used, reset for a new cycle
        if(history.size() == 0)
         init();

        //Pick a random value index from 0 to queue size-1
         int idx = $urandom_range(0, history.size() - 1);

         //Assign that value to 'val'
         val = history[idx];

        //Remove this value from the queue to avoid repetition
         history.delete[idx];

    endfunction

endclass

//How to use it
module tb;
    randc_emulator rc;

    initial begin
     rc = new();
     rc.init(); //start first cycle
    end

    //Try 10 random values
    repeat(10) begin
        rc.randomize_val();
        $display("randc value: %0d", rc.val);
    end
endmodule
