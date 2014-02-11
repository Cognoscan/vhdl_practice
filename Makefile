#
# Makefile for generating basic portion of boostlogic
#
# the basic folder should only contain entities that don't rely on anything else 
# in the library except for the utility packages. Their test benches should also 
# be included here.
#


VHDL = $(shell find -type f -name '*.vhd')

COMPILED = $(patsubst %.vhd, work/%/_primary.dat, $(VHDL))

all: $(COMPILED)

work/%/_primary.dat: %.vhd
	vcom -work work -2008 $<

init:
	vmap -c
	vlib work
	vmap work work

clean:
	rm -rf work/
