deliv: clean generate-parts pdf
generate-parts:
pdf: check generate-parts
	latexmk -pdf thesis
realtime:
	latexmk -pvc -pdf thesis
check: spellcheck
	# grep -i fixxme thesis.tex thesis.bib acronyms.tex | grep -v %
clean:
	latexmk -C
fullclean: clean
	rm -f *.dvi *.ps *.pdf *.url *.bak *.lol *.bbl
spellcheck:
	aspell --mode=tex -l de_DE-neu check thesis.tex
	aspell --mode=tex -l de_DE-neu check acronyms.tex
	aspell --mode=tex -l de_DE-neu check thesis.bib
