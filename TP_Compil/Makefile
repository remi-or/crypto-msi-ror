# $Id: Makefile.to_nasm 556 2022-08-26 09:24:40Z hermant $
# compilation d'un compilateur

# executables
GHC	= ghc
GHCI	= ghci

JLEX	= happy
JCUP	= alex

# compilation & execution chain
PASCAL  = ./Main
ASM     = ./asm.py
RUN     = ./mach.py
TO_NASM = ./to_nasm.py

NASM    = nasm
NASM_FLAGS = -felf64

GCC     = gcc
GCC_ARG = -fno-pie -no-pie

# source files
F.jlex	= $(wildcard *.y)
F.cup	= $(wildcard *.x)
F.p	= $(wildcard *.p)

default: help

help:
	@echo "help: this small help"
	@echo "clean: clean generated files"
	@echo "compile: compile the compiler"

clean:
	$(RM) *~ *.i *.o *.a *.ex *.hi .compile Main *.obj *.asm $(F.p:%.p=%)

compile: .compile
.compile: $(F.cup) $(F.jlex) Main.hs
	$(JCUP) $(F.cup)
	$(JLEX) $(F.jlex)
	$(GHC) Main.hs
	touch $@

# disable all default rules
.SUFFIXES:

# pascal compilation
%.i: %.p; $(PASCAL) < $< > $@
# Show generated code
%.s: %.i; cat $<
# assembler
%.a: %.i; $(ASM) < $< > $@
# EXecution
%.ex: %.a; $(RUN) $<
# generate x86 asm
%.asm: %.i; $(TO_NASM) < $< > $@
# assemble x86 asm
%.obj: %.asm; $(NASM) $(NASM_FLAGS) -o $@ $<
# link executable
% : %.obj; $(GCC) $(GCC_ARG) $< -o $@

F.p	= $(wildcard *.p)
F.i	= $(F.p:%.p=%.i)
$(F.i): .compile Main.hs
F.a	= $(F.i:%.i=%.a)
$(F.a): $(ASM)
F.ex	= $(F.a:%.a=%.ex)
$(F.ex): $(RUN)

# distribution tar
.PHONY: tgz zip
tgz:
	tar -chvzf pascal.tgz Makefile *.py PascaLex.x PascalParser.y Main.hs test_00.p README

zip:
	zip pascal.zip Makefile *.py PascaLex.x PascalParser.y Main.hs test_00.p README
