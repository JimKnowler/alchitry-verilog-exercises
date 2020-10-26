# Alchitry Project 8 - Arbiter

Learning project with Alchitry Au FPGA board

Inspired by Alchitry Verilog tutorial: https://alchitry.com/blogs/tutorials/creating-a-vivado-project-for-the-au

Implement an Arbiter module - when given an 8bit input, then it outputs the most significant active bit as a one-hot.

All 24 dip switches on the Alchitry Io board are used as input, and the one-hot output appears on the Alchitry Io board LEDs.

# Modules

- au_top.v - entry point
- arbiter.v - output the most significant bit from input
- arbiter_bit.v - handle a single bit for the arbiter

# Constraints

- alchitry_au_and_io.acf - Includes definitions for Alchitry AU + IO board - inspired by: https://eprebys.faculty.ucdavis.edu/alchitry-notes/



