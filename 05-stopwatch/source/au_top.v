module au_top(
    input clk,              // 100MHz clock
    input rst_n,            // reset button (active low)
    output [7:0] led,       // 8 user controllable LEDs
    input usb_rx,           // USB->Serial input
    output usb_tx,          // USB->Serial output,
    input [4:0] io_button,
    input [23:0] io_dip,
    output [23:0] io_led,
    output [7:0] io_seg,
    output [3:0] io_sel
    );

    assign led = 8'h00;     // turn LEDs off
    assign usb_tx = usb_rx; // echo the serial data
    
    // debounce RESET and PAUSE buttons    
    wire button_reset_down;
    wire button_play_down;
    
    wire button_reset_state;
    wire button_play_state;
    
    localparam BUTTON_CENTER = 1;
    localparam BUTTON_DOWN = 2;
    
    button_debounce debounce_reset(.clk(clk), .switch_input(io_button[BUTTON_DOWN]), .down(button_reset_down), .state(button_reset_state));
    button_debounce debounce_play(.clk(clk), .switch_input(io_button[BUTTON_CENTER]), .down(button_play_down), .state(button_play_state));
    
    // counter that increments while stopwatch is RUNNING
    reg [15:0] counter;
    
    // manage state with button presses                
    reg state;
    
    localparam STATE_PAUSED = 1'b0;
    localparam STATE_RUNNING = 1'b1;
                
    always @(posedge clk) begin
      if (button_reset_down) begin
        state <= STATE_PAUSED;
      end else if (button_play_down) begin
        state <= ~state;
      end
    end
    
    // increment counter while state is RUNNING
    wire clk_counter;
    clock_divider #(.DIV(20)) clk_divider_counter(.clock_in(clk), .clock_out(clk_counter));
       
    always @(posedge clk_counter) begin
      if (state == STATE_RUNNING) begin
        if (counter == 9999) begin
          counter <= 0;
        end else begin
          counter <= counter + 1;
        end
      end else begin
        counter <= 0;
      end
    end
        
    // convert from raw counter to 4-bit decimal digits
    wire [15:0] counter_decimal;
    binary_to_decimal decimal_conversion(.in_binary(counter), .out_decimal(counter_decimal));
    
    // display decimal counter on multiple segment displays
    multi_segment_display display(.clk(clk), .value(counter_decimal), .io_seg(io_seg), .io_sel(io_sel));
    
    // printf debugging
    assign io_led[0] = button_reset_state;
    assign io_led[1] = button_play_state;
    assign io_led[2] = state;
endmodule
