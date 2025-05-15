/* You have 2 inputs: req1 and req2.
Only one can be granted (grant1 or grant2) at a time.
If both are high, alternate who gets granted each cycle. */

module fair_arbiter(
    input logic clk,
    input logic reset,
    input logic req1,
    input logic req2,
    outtput logic grant1,
    output logic grant2
);

    logic toggle; //Remembers which was last granted

    always_ff @(posedge clk or posedge reset) begin
        if(reset) begin
            toggle <= 0;
            grant1 <= 0;
            grant2 <= 0;
        end else begin
            grant1 <= 0;
            grant2 <= 0;

            if(req1 && req2) begin
                if(toggle == 0) begin
                    grant1 <= 1;
                    toggle <= 1;
                end else begin
                        grant2 <= 1;
                        toggle <= 0;
                    end
            end else if(req1) begin
                grant1 <= 1;
            end else if(req2) begin
                grant2 <= 1;
            end
        end 
    end

endmodule