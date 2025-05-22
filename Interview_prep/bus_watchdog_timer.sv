/* Watchdog Timer Problem Statement
You have two signals:

start_transaction: goes high when a request starts

complete_transaction: goes high when it's done

If the completion does not happen within 5 cycles of start, you must raise an error. */

/* 🧠 Thinking Strategy
We need:

A counter that starts on start_transaction

A way to reset the counter on completion

A mechanism to detect timeout (when counter > 5) */

module bus_watchdog_timer(
    input logic clk,
    input logic reset,
    input logic start_transaction,
    input logic complete_transaction,
    output logic timeout_error
);

    logic [2:0] cycle_counter;           //3-bit counter (0-7 is enough)
    logic active_timer;                  //Indicates if we are waiting for completion

    always_ff @(posedge clk or posedge reset) begin
        if(reset) begin
            cycle_counter  <= 0;
            active_timer   <= 0;
            timeout_error <= 0;
        end
        else begin
            timeout_error <= 0;

             if(start_transaction) begin
                cycle_counter <= 1'b0;
                active_timer  <= 1'b1;
             end else if(active_timer == 1 && !complete_transaction) begin
                cycle_counter <= cycle_counter + 1;

                if(cycle_counter >= 5) begin
                    timeout_error = 1'b1;
                end else if(complete_transaction) begin
                cycle_counter <= 0;
                active_timer  <= 0;
                
                end
             end
        end
    end


endmodule