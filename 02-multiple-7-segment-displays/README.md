# Alchitry Project 2 - Multiple 7 Segment Displays

Second project with Alchitry Au FPGA board

Inspired by Alchitry Verilog tutorial: https://alchitry.com/blogs/tutorials/creating-a-vivado-project-for-the-au

Use dip switches to select value displayed on each 7-seg display

- dip switches 0..3 - value 0 (right most digit)
- dip switches 4..7 - value 1 (middle right digit)
- dip switches 8..11 - value 2 (middle left digit)
- dip switches 12.15 - value 3 (far left digit)

# Modules

- au_top.v - entry point
- segment_display.v - convert 4 bit number to 7 segment display
- clock_divider.v - convert Au's onboard 100MHz clock to approx 16kHz

# Constraints

- alchitry_au_and_io.acf - Includes definitions for Alchitry AU + IO board - inspired by: https://eprebys.faculty.ucdavis.edu/alchitry-notes/



