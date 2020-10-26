module arbiter_bit (
    input ci,           // carry in (1 if already chosen)
    input a,            // input
    output reg q,       // output
    output reg co      // carry out (1 if chosen)
  );

  /* Combinational Logic */
  always @* begin
    q <= a & !ci;
    co <= ci | q;
  end
  
endmodule
