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
    
    // incremental hex counter
    wire clk_counter;
    clock_divider #(.DIV(20)) clk_divider_counter(.clock_in(clk), .clock_out(clk_counter));
    
    reg [15:0] counter;
    
    always @(posedge clk_counter) begin
      if (counter == 9999) begin
        counter = 0;
      end else begin
        counter = counter + 1;
      end
    end
        
    // convert from raw counter to 4-bit decimal digits
    wire [15:0] counter_decimal;
    binary_to_decimal decimal_conversion(.in_binary(counter), .out_decimal(counter_decimal));    
    
    // dislpay decimal counter on multiple segment displays
    multi_segment_display display(.clk(clk), .value(counter_decimal), .io_seg(io_seg), .io_sel(io_sel));
endmodule
