module binary_to_decimal 
  (
    input [15:0] in_binary,
    output reg [15:0] out_decimal          // 4 digits
  );
  
  localparam DIGITS = 4;  
  
  integer i;  
  integer scale;

  reg [15:0] remainder_after_thousands;
  reg [15:0] remainder_after_hundreds;
  reg [15:0] remainder_after_tens;
         
  /* Combinational Logic */
  
  
  always @* begin
    // thousands
    for (i=0; i<10; i = i + 1) begin
      scale = 1000;
      if (in_binary >= (i * scale)) begin
        out_decimal[15:12] = i;
        remainder_after_thousands = in_binary - (i*scale);
      end
    end
    
    
    // hundreds
    for (i=0; i<10; i = i + 1) begin
      scale = 100;
      if (remainder_after_thousands >= (i * scale)) begin
        out_decimal[11:8] = i;
        remainder_after_hundreds = remainder_after_thousands - (i*scale);
      end
    end
    
    // tens
    for (i=0; i<10; i = i + 1) begin
      scale = 10;
      if (remainder_after_hundreds >= (i * scale)) begin
        out_decimal[7:4] = i;
        remainder_after_tens = remainder_after_hundreds - (i*scale);
      end
    end
    
    
    // ones
    for (i=0; i<10; i = i + 1) begin
      scale = 1;
      if (remainder_after_tens >= (i * scale)) begin
        out_decimal[3:0] = i;
      end
    end
           
  end

endmodule
