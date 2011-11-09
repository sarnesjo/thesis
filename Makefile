GNUPLOT_TEX_FILES = so_program_length.tex

all: spec.pdf thesis.pdf

spec.pdf: spec.tex thesis.bib
	rubber --pdf spec.tex

thesis.pdf: thesis.tex thesis.bib $(GNUPLOT_TEX_FILES)
	rubber --pdf thesis.tex

$(GNUPLOT_TEX_FILES): %.tex: %.gpi
	gnuplot -e 'set terminal tikz createstyle; set output "$@";' $<

.PHONY: clean
clean:
	rubber --pdf --clean spec.tex
	rubber --pdf --clean thesis.tex
	rm -f $(GNUPLOT_TEX_FILES)
	rm -f gnuplot-lua-tikz.sty
