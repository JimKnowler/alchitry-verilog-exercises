module button_debounce (
    input clk,             // clock
    input switch_input,    // direct input from switch
    output reg state,      // 1 while button is pressed
    output up,             // 1 for a single clock cycle when button is released
    output down            // 1 for a single clock cycle when button is pressed
  );
  
  localparam WIDTH = 16;
  
  // reference: https://www.fpga4fun.com/Debouncer.html

  // synchronize the switch input to the clock
  reg sync_0, sync_1;
  
  always @(posedge clk)
  begin
    sync_0 <= switch_input;
  end
  
  always @(posedge clk)
  begin
    sync_1 <= sync_0;
  end
  
  // debounce the synchronized switch input
  reg [WIDTH-1:0] count;
  wire idle = (state == sync_1);
  wire finished = &count;
  
  always @(posedge clk)
  begin
    if (idle) begin
      count <= 0;
    end else begin
      count <= count + 1;
      if (finished) begin
        state <= ~state;
      end
    end
  end
  
  assign down = ~idle & finished & ~state;
  assign up = ~idle & finished & state;
  
endmodule
