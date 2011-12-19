GNUPLOT_TEX_FILES = \
	performance_mul.tex \
	performance_mul2.tex \
	so_program_length.tex \
	so_program_length_1.tex \
	so_program_length_2.tex \
	so_program_length_3.tex

TIKZ_TEX_FILES = \
	bdd_add1.tex \
	bdd_add2.tex \
	bdd_add_sep.tex \
	bdd_add_shared.tex \
	bdd_c1.tex \
	bdd_c1_1.tex \
	bdd_c1_1a.tex \
	bdd_c1_1b.tex \
	bdd_c1_2.tex \
	bdd_c1_2a.tex \
	bdd_c1_3.tex \
	bdd_c1_3a.tex \
	bdd_c1_4.tex \
	bdd_c1_4a.tex \
	bdd_c1_5.tex \
	bdd_c1_6.tex \
	bdd_c2_bad.tex \
	long_multiplication.tex

all: spec.pdf thesis.pdf pres.pdf

spec.pdf: spec.tex thesis.bib
	rubber --pdf spec.tex

thesis.pdf: thesis.tex thesis.bib $(GNUPLOT_TEX_FILES) $(TIKZ_TEX_FILES)
	rubber --pdf thesis.tex

pres.pdf: pres.tex $(GNUPLOT_TEX_FILES) $(TIKZ_TEX_FILES)
	rubber --pdf pres.tex

$(GNUPLOT_TEX_FILES): %.tex: %.gpi
	gnuplot -e 'set terminal tikz createstyle; set output "$@";' $<

.PHONY: clean
clean:
	rubber --pdf --clean spec.tex
	rubber --pdf --clean thesis.tex
	rubber --pdf --clean pres.tex
	rm -f $(GNUPLOT_TEX_FILES)
	rm -f gnuplot-lua-tikz.sty
