module ripple_adder (
    input [7:0] a,
    input [7:0] b,
    output [7:0] q,
    output c
  );
  
  wire carry[8:0];
  assign carry[0] = 0;
    
  generate
    genvar i;
      
    for (i = 0; i <= 7; i = i+1) begin      
      full_adder ripple(
        .a(a[i]),
        .b(b[i]),
        .q(q[i]),
        .ci(carry[i]),
        .co(carry[i+1])
      );
    end
  endgenerate
  
  assign c = carry[8];
      
endmodule