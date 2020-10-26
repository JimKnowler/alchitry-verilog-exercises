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
    
    //////////////////////////////////////////////////////    
    // 1 bit half-adder

    wire hq;
    wire hc;
        
    half_adder half(
      .a(io_dip[0]),
      .b(io_dip[1]),
      .q(hq),
      .c(hc)
    );
    
    assign io_led[0] = hq;
    assign io_led[1] = hc;
    
    
    //////////////////////////////////////////////////////
    // 8 bit ripple addition with full-adder
    
    ripple_adder ripple(
      .a(io_dip[23:16]),
      .b(io_dip[15:8]),
      .q(io_led[15:8]),
      .c(io_led[16])
    );   
    
endmodule
