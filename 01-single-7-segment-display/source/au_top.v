module au_top(
    input clk,              // 100MHz clock
    input rst_n,            // reset button (active low)
    output [7:0] led,       // 8 user controllable LEDs
    input usb_rx,           // USB->Serial input
    output usb_tx,           // USB->Serial output,
    input [4:0] io_button,
    input [23:0] io_dip,
    output [23:0] io_led,
    output [7:0] io_seg,
    output [3:0] io_sel
    );
    
    wire [7:0] digit_segments;
    
    segment_display display(.value(io_dip[11:8]), .digit_segments(digit_segments));
    
    // io_sel = (multiple) one hot (set the selected position(s) low)
    // io_seg = (multiple) one hot (set the selected bits low)
    //    - 0: TOP
    //    - 1: TOP-RIGHT
    //    - 2: BOTTOM-RIGHT
    //    - 3: BOTTOM
    //    - 4: BOTTOM-LEFT
    //    - 5: TOP-LEFT
    //    - 6: MIDDLE
    //    - 7: DECIMAL
    // io_led = binary digit - least significant bit on right hand side
    // io_button 
    //    - 0: UP
    //    - 1: CENTER
    //    - 2: DOWN
    //    - 3: LEFT
    //    - 4: RIGHT
        
    assign led = 8'h00;      // turn LEDs off

    assign usb_tx = usb_rx;  // echo the serial data
    
    assign io_sel[3:0] = io_dip[3:0];      
    assign io_seg[7:0] = digit_segments;
    assign io_led[4:0] = io_button[4:0];
    
endmodule