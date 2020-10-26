// module for implementing an arbiter circuit

module arbiter (
    input [23:0] a,           // input (multiple-hot)
    output [23:0] q       // output (one hot)
  );

  wire [23+1:0] carry;
  assign carry[23+1] = 0;

  generate
    genvar i;
    
    for (i = 0; i<=23; i = i+1) begin
      arbiter_bit bit(
        .a(a[i]),
        .ci(carry[i+1]),
        .q(q[i]),
        .co(carry[i])
      );
    end
  
  endgenerate
  
endmodule
