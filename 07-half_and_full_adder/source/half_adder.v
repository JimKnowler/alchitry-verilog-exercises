// module for implementing a half-adder circuit

module half_adder (
    input a,
    input b,
    output reg q,     // sum
    output reg c      // carry
  );

  always @* begin
    q <= a ^ b;
    c <= a & b;
  end
  
endmodule
