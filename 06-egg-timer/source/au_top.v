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
    
    // up / down - to increase timer
    // play/pause - to start/stop timer
    // counter - count down to zero
    // counter = 0 - switch to pause state + show alarm (flash all the LEDs + 7 seg displays)   
    
    // debounce RESET and PAUSE buttons    
    wire button_inc_down;
    wire button_dec_down;
    wire button_play_down;
    
    wire button_inc_state;
    wire button_dec_state;
    wire button_play_state;
    
    localparam BUTTON_UP = 0;
    localparam BUTTON_CENTER = 1;
    localparam BUTTON_DOWN = 2;
    
    button_debounce debounce_inc(.clk(clk), .switch_input(io_button[BUTTON_UP]), .down(button_inc_down), .state(button_inc_state));
    button_debounce debounce_dec(.clk(clk), .switch_input(io_button[BUTTON_DOWN]), .down(button_dec_down), .state(button_dec_state));
    button_debounce debounce_play(.clk(clk), .switch_input(io_button[BUTTON_CENTER]), .down(button_play_down), .state(button_play_state));
    
    // counter that increments while stopwatch is RUNNING
    reg [15:0] counter;
    
    // manage state with button presses                
    reg state;
    
    localparam STATE_PAUSED = 1'b0;
    localparam STATE_RUNNING = 1'b1;
    
    reg alarm;
    
    // decrement counter while state is RUNNING
    wire clk_counter;
    clock_divider #(.DIV(20)) clk_divider_counter(.clock_in(clk), .clock_out(clk_counter));
    
    wire clk_counter_positive_edge;
    positive_edge_detector edge_detector(.clk(clk), .sig(clk_counter), .pe(clk_counter_positive_edge));
                
    always @(posedge clk) begin    
      if (button_inc_down) begin
         alarm <= 0;
         counter <= counter + 500;
      end else if (button_dec_down) begin
         alarm <= 0;
         if (counter >= 500)
           counter <= counter - 500;
         else
           counter <= 0;
      end else if (button_play_down) begin
        alarm <= 0;
        state <= ~state;
      end else if ((state == STATE_RUNNING) && (1 == clk_counter_positive_edge)) begin
        if (counter == 0) begin
          alarm <= 1;
          state <= STATE_PAUSED;
        end else begin
          counter <= counter - 1;
        end
      end
    end
    
    // clock for flashing segment display when alarm is active
    wire clk_alarm;
    clock_divider #(.DIV(25)) clk_divider_alarm(.clock_in(clk), .clock_out(clk_alarm));
                
    // convert from raw counter to 4-bit decimal digits
    wire [15:0] counter_decimal;
    binary_to_decimal decimal_conversion(.in_binary(counter), .out_decimal(counter_decimal));
    
    // display decimal counter on multiple segment displays
    wire [7:0] io_seg_pre_alarm;
    multi_segment_display display(.clk(clk), .value(counter_decimal), .io_seg(io_seg_pre_alarm), .io_sel(io_sel));
    
    assign io_seg[7:0] = alarm ? (clk_alarm ? io_seg_pre_alarm[7:0] : 8'hff) : io_seg_pre_alarm[7:0];
    
    // printf debugging
    assign io_led[0] = button_inc_state;
    assign io_led[1] = button_play_state;
    assign io_led[2] = button_dec_state;
    assign io_led[3] = alarm;
    assign io_led[4] = state;
endmodule
