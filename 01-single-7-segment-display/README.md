# Alchitry Project 1 - 7 Segment Displays

First project with Alchitry Au FPGA board

Inspired by Alchitry Verilog tutorial: https://alchitry.com/blogs/tutorials/creating-a-vivado-project-for-the-au

- dip switches 0..3 - active (low) digit displays
- dip switches 8..11 - 4 bit hex number to display on active digits

# Modules

- au_top.v - entry point
- segment_display.v - convert 4 bit number to 7 segment display

# Constraints

- alchitry_au_and_io.acf - Includes definitions for Alchitry AU + IO board - inspired by: https://eprebys.faculty.ucdavis.edu/alchitry-notes/



