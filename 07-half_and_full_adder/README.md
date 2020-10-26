# Alchitry Project 7 - Half and Full Adder

Learning project with Alchitry Au FPGA board

Inspired by Alchitry Verilog tutorial: https://alchitry.com/blogs/tutorials/creating-a-vivado-project-for-the-au

First use of 'generate' blocks in verilog to instantiate 'n' instances of a module:
https://www.chipverify.com/verilog/verilog-generate-block


Implement Half Adder circuit
- RHS dip switches - bits 0 + 1 can be toggled on and off, circuit will add them together
- RHS LEDs - bit 0 = sum, bit 1 = carry

Implement Full Adder circuit
- Left and Middle Dip switches - all 8 bits in each dip switch represent a value
- Middle LEDs - display Sum of Left and Middle Dip switches
- Left LEDs - display carry (i.e. the carry bit from the most significant bit)

# Modules

- au_top.v - entry point
- half_adder.v - implementation of half-adder circuit
- full_adder.v - implementation of full-adder circuit

# Constraints

- alchitry_au_and_io.acf - Includes definitions for Alchitry AU + IO board - inspired by: https://eprebys.faculty.ucdavis.edu/alchitry-notes/



