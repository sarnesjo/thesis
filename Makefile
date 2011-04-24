all: spec.pdf thesis.pdf

spec.pdf: spec.tex thesis.bib
	rubber --pdf spec.tex

thesis.pdf: thesis.tex thesis.bib
	rubber --pdf thesis.tex

.PHONY: clean
clean:
	rubber --pdf --clean spec.tex
	rubber --pdf --clean thesis.tex
