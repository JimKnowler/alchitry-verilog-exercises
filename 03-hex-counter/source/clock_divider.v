module clock_divider (
    input clock_in,
    output clock_out
  );
  
  parameter DIV = 10;
  
  // todo: parameterise
  reg [DIV:0] counter;

  always @(posedge clock_in) begin
    counter <= counter + 1;
  end
  
  // 50% duty cycle clock
  // todo: parameterise '8' based on size of counter
  assign clock_out = (counter >= (1<<DIV)) ? 1 : 0;
endmodule
