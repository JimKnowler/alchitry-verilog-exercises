// module for displaying 4 bit value on 8 segment display on Alchitry io board

module segment_display (
    input [3:0] digit_value,
    output reg [7:0] digit_segments
  );

  localparam io_seg_top = 1;
  localparam io_seg_topright = 2;
  localparam io_seg_bottomright = 4;
  localparam io_seg_bottom = 8;
  localparam io_seg_bottomleft = 16;
  localparam io_seg_topleft = 32;
  localparam io_seg_middle = 64;
  localparam io_seg_decimal = 128;
  
  localparam [7:0] io_seg_0 = ~(io_seg_top | io_seg_topright | io_seg_bottomright | io_seg_bottom | io_seg_bottomleft | io_seg_topleft);
  localparam [7:0] io_seg_1 = ~(io_seg_topright | io_seg_bottomright);
  localparam [7:0] io_seg_2 = ~(io_seg_top | io_seg_topright | io_seg_bottom | io_seg_bottomleft | io_seg_middle);
  localparam [7:0] io_seg_3 = ~(io_seg_top | io_seg_topright | io_seg_bottomright | io_seg_bottom | io_seg_middle);
  localparam [7:0] io_seg_4 = ~(io_seg_topright | io_seg_bottomright | io_seg_middle | io_seg_topleft);
  localparam [7:0] io_seg_5 = ~(io_seg_top | io_seg_bottomright | io_seg_bottom | io_seg_topleft | io_seg_middle);
  localparam [7:0] io_seg_6 = ~(io_seg_top | io_seg_middle | io_seg_bottomright | io_seg_bottom | io_seg_bottomleft | io_seg_topleft);
  localparam [7:0] io_seg_7 = ~(io_seg_top | io_seg_topright | io_seg_bottomright);
  localparam [7:0] io_seg_8 = ~(io_seg_top | io_seg_topright | io_seg_bottomright | io_seg_bottom | io_seg_bottomleft | io_seg_topleft | io_seg_middle);
  localparam [7:0] io_seg_9 = ~(io_seg_top | io_seg_topright | io_seg_bottomright | io_seg_bottom | io_seg_topleft | io_seg_middle);
  localparam [7:0] io_seg_A = ~(io_seg_top | io_seg_topright | io_seg_bottomright | io_seg_bottomleft | io_seg_topleft | io_seg_middle);
  localparam [7:0] io_seg_B = ~(io_seg_bottomright | io_seg_bottom | io_seg_bottomleft | io_seg_topleft | io_seg_middle);
  localparam [7:0] io_seg_C = ~(io_seg_bottom | io_seg_bottomleft | io_seg_topleft | io_seg_top );
  localparam [7:0] io_seg_D = ~(io_seg_topright | io_seg_bottomright | io_seg_bottom | io_seg_bottomleft | io_seg_middle);
  localparam [7:0] io_seg_E = ~(io_seg_top | io_seg_bottom | io_seg_bottomleft | io_seg_topleft | io_seg_middle);
  localparam [7:0] io_seg_F = ~(io_seg_top | io_seg_bottomleft | io_seg_topleft | io_seg_middle);
  
  always @(*)
  begin
    case (digit_value[3:0])
      4'h0: digit_segments = io_seg_0;
      4'h1: digit_segments = io_seg_1;
      4'h2: digit_segments = io_seg_2;
      4'h3: digit_segments = io_seg_3;
      4'h4: digit_segments = io_seg_4;
      4'h5: digit_segments = io_seg_5;
      4'h6: digit_segments = io_seg_6;
      4'h7: digit_segments = io_seg_7;
      4'h8: digit_segments = io_seg_8;
      4'h9: digit_segments = io_seg_9;
      4'ha: digit_segments = io_seg_A;
      4'hb: digit_segments = io_seg_B;
      4'hc: digit_segments = io_seg_C;
      4'hd: digit_segments = io_seg_D;
      4'he: digit_segments = io_seg_E;
      4'hf: digit_segments = io_seg_F;
      default: digit_segments = 7'b1111111;      // turn off all segments
    endcase
  end
  
endmodule
