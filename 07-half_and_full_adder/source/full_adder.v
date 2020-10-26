// module for implementing a full-adder circuit

module full_adder (
    input a,
    input b,
    input ci,         // carry in
    output reg q,     // sum
    output reg co      // carry out
  );

  // combinatiorial logic
  always @(*) begin
    q <= (a ^ b) ^ ci;
    co <= (a & b) | (a & ci) | (b & ci);
  end
  
endmodule
