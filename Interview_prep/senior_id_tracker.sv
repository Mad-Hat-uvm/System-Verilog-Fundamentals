/* There is sequential request input coming in: req =  01,2,3,4,5.....
The response from the DUT is random: resp = .....4,0,1,3,5,6,2,.......
I need to update the senior most id which still hasn't been responded: most_senior_id: 0,1,2,2,2,7 */

module senior_id_tracker #(parameter MAX_ID = 64) (
    input  logic clk,
    input  logic reset,
    input  logic       req_valid,
    input  logic [5:0] req_id,
    input  logic       resp_valid,
    input  logic [5:0] resp_id,
    output logic [5:0] most_senior_id
);

//Tracking which requests have been seen
logic pending_reqs [0:MAX_ID-1];

//Default: No id pending at reset
integer i;

always_ff @(posedge clk or posedge reset) begin
    if(reset) begin
        for(i = 0; i < MAX_ID; i++) begin
            pending_reqs[i] <= 1'b0;
        end
        most_senior_id <= 0;
    end else begin

 //On each new request, mark that ID as pending
        if(req_valid) begin
            pending_reqs[req_id] <= 1'b1;
        end

 //On each response, mark the ID as no longer pending
        if(resp_valid) begin
            pending_reqs[resp_id] <= 1'b0;
        end

  //Update the most_senior_id by scanning from 0 upwards
        for(i = 0; i < MAX_ID, i++) begin
            if(pending_reqs[i] == 1'b1) begin
                most_senior_id <= i;
                break;
            if (i == MAX_ID-1) begin
                //If no pending requests, set to MAX_ID(or hold last known)
                most_senior_id <= MAX_ID;
            end
            end
        end
    end
end

endmodule