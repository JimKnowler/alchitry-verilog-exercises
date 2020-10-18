# Alchitry Project 3 - Hex Counter

Second project with Alchitry Au FPGA board

Inspired by Alchitry Verilog tutorial: https://alchitry.com/blogs/tutorials/creating-a-vivado-project-for-the-au

Use 2nd clock_divider to drive a hex counter.

# Modules

- au_top.v - entry point
- segment_display.v - convert 4 bit number to 7 segment display
- clock_divider.v - parameterised clock divider

# Constraints

- alchitry_au_and_io.acf - Includes definitions for Alchitry AU + IO board - inspired by: https://eprebys.faculty.ucdavis.edu/alchitry-notes/



