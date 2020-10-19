module positive_edge_detector (
    input clk,  // clock
    input sig,  // signal to detect
    output pe   // positive edge (1 for a single clock cycle)
  );

  reg last_sig;

  always @(posedge clk) begin
    last_sig <= sig;
  end
  
  assign pe = sig & ~last_sig;
   
endmodule
