#comparison between blocking and non-blocking events

module event_comparison;
   event blocking_event, non_blocking_event;

   initial begin
     $display("[%0t] Blocking event triggered", $time);
     -> blocking_event;
     $display("[%0t] After blocking event", $time);

     $display("[%0t] Blocking event triggered", $time);
     -> non_blocking_event;
     $display("[%0t] After blocking event", $time);
   end

   initial begin
    @blocking_event;
    $display("[%0t] Blocking event received", $time);
   end

   initial begin
    @non_blocking_event;
    $display("[%0t] Non-Blocking event received", $time);
   end

endmodule