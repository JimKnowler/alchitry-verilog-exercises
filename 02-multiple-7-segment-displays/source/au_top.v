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

    wire clk_digit_select;
    clock_divider clk_divider(.clock_in(clk), .clock_out(clk_digit_select));
    
    reg [1:0] digit_select;      // iterate through digits

    always @(posedge clk_digit_select) begin
      digit_select = digit_select + 1;
    end

    // io_sel - select which digit to display (one hot - active low)
    assign io_sel[3:0] = ~(1 << digit_select);
    
    // display 4bit digit to currently selected digit
    reg [3:0] value;
    
    always @(*) begin
      case (digit_select)
        0: value[3:0] = io_dip[3:0];
        1: value[3:0] = io_dip[7:4];
        2: value[3:0] = io_dip[11:8];
        3: value[3:0] = io_dip[15:12];
        default: value[3:0] = 0;
      endcase
    end

    wire [7:0] digit_segments;  // segments of active segment display
    
    segment_display display(.value(value), .digit_segments(digit_segments));
    assign io_seg[7:0] = digit_segments;
endmodule
