# Alchitry Project 4 - Decimal Counter

Fourth project with Alchitry Au FPGA board

Inspired by Alchitry Verilog tutorial: https://alchitry.com/blogs/tutorials/creating-a-vivado-project-for-the-au

Convert from binary to BCD (Binary Coded Decimal) so that counter appears as decimal.

 ![Decimal Counter demo](https://github.com/JimKnowler/alchitry-verilog-exercises/raw/main/04-decimal-counter/docs/decimal_counter.gif)

# Modules

- au_top.v - entry point
- segment_display.v - convert 4 bit number to 7 segment display
- clock_divider.v - parameterised clock divider
- binary_to_decimal.v - convert binary to 4 digit BCD with combinational logic

# Constraints

- alchitry_au_and_io.acf - Includes definitions for Alchitry AU + IO board - inspired by: https://eprebys.faculty.ucdavis.edu/alchitry-notes/



