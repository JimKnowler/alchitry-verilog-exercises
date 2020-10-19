module multi_segment_display (
    input clk,
    input [15:0] value,           // 4 digit HEX or BCD value to display
    output [7:0] io_seg,
    output [3:0] io_sel
  );

    // iterate through the 4 7-seg displays
    wire clk_digit_select;
    clock_divider #(.DIV(10)) clk_divider_digit_select(.clock_in(clk), .clock_out(clk_digit_select));
    
    reg [1:0] digit_select;      

    always @(posedge clk_digit_select) begin
      digit_select = digit_select + 1;
    end
    
    // io_sel - select which digit to display (one cold)
    assign io_sel[3:0] = ~(1 << digit_select);
    
    // display 4bit digit to currently selected digit
    reg [3:0] digit_value;
    
    always @(*) begin
      case (digit_select)
        0: digit_value[3:0] = value[3:0];
        1: digit_value[3:0] = value[7:4];
        2: digit_value[3:0] = value[11:8];
        3: digit_value[3:0] = value[15:12];
        default: digit_value[3:0] = 0;
      endcase
    end

    wire [7:0] digit_segments;  // segments of active segment display
    
    segment_display display(.digit_value(digit_value), .digit_segments(digit_segments));
    assign io_seg[7:0] = digit_segments;
  
endmodule
