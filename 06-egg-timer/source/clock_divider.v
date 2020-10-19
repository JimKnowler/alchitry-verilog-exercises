module clock_divider 
  #(
    parameter DIV = 10
  )
  (
    input clock_in,
    output clock_out
  );
  
  reg [DIV:0] counter;

  always @(posedge clock_in) begin
    counter <= counter + 1;
  end
  
  // 50% duty cycle clock
  assign clock_out = (counter >= (1<<DIV)) ? 1 : 0;
endmodule
