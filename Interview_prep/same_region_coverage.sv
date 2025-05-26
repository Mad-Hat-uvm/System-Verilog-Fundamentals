/* Windowed Access Coverage or Assertion (Waymo/Google-style)
🔹 Problem:
You are monitoring memory accesses over an 8-bit address bus (addr[7:0]), and you want to:
Cover the case where 4 consecutive accesses (in 4 clock cycles) all fall in the same 64-byte region.
64-byte regions = address blocks where addr[7:6] remains the same

Example: addresses 65, 66, 70, 72 → all map to region 2'b01

🧠 Thinking Strategy:
Use a history buffer to track the last 4 address accesses
Sample this buffer every cycle
Write a coverpoint (or assertion) that detects when all 4 addr[7:6] values match */

module same_region_coverage(input logic clk, input logic reset, input logic addr_stb, input logic [7:0] addr);

    //Shift register to store last 4 addresses
    logic [7:0] addr_hist[4];

    always_ff @(posedge clk or posedge reset) begin
     if (reset) begin
        foreach(addr_hist[i]) addr_hist[i] <= 0;
     end else if(addr_stb) begin
        addr_hist[3] <= addr_hist[2];
        addr_hist[2] <= addr_hist[1];
        addr_hist[1] <= addr_hist[0];
        addr_hist[0] <= addr;
     end
    end

    //Cover when all addr[7:6] values match
    covergroup cg_same_region @(posedge clk);
        coverpoint addr_hist[0][7:6] iff (
            addr_hist[0][7:6] == addr_hist[1][7:6] &&
            addr_hist[1][7:6] == addr_hist[2][7:6] &&
            addr_hist[2][7:6] == addr_hist[3][7:6] 
        );
    endgroup

    cg_same_region cg_inst = new();
endmodule