# Alchitry Project 5 - Decimal Counter

Fifth project with Alchitry Au FPGA board

Inspired by Alchitry Verilog tutorial: https://alchitry.com/blogs/tutorials/creating-a-vivado-project-for-the-au

Implement a stop watch with:
 - CENTER button: start / pause / resume
 - DOWN button: reset to 0

# Modules

- au_top.v - entry point
- segment_display.v - convert 4 bit number to 7 segment display
- clock_divider.v - parameterised clock divider
- binary_to_decimal.v - convert binary to 4 digit BCD with combinational logic
- button_debounce.v - synchronize button to clock + debounce rapid changes in state
- multi_segment_display.v - display hex/BCD value across 4 x 7 segment display

# Constraints

- alchitry_au_and_io.acf - Includes definitions for Alchitry AU + IO board - inspired by: https://eprebys.faculty.ucdavis.edu/alchitry-notes/



