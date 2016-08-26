pdfs: \
  $(patsubst tex/%.bib,%.aux,$(wildcard tex/*.bib)) \
  $(patsubst tex/%.tex,pdf/%.pdf,$(wildcard tex/*.tex))

%.aux: tex/%.bib .that.tickles
	@echo 'processing $*.bib' | doppler lightblue
	@pdflatex -interaction=batchmode tex/$*.tex > /dev/null
	@bibtex $*

pdf/%.pdf: tex/%.tex .that.tickles
	@echo 'building $*.pdf' | doppler lightgreen
	@pdflatex -interaction=batchmode tex/$*.tex > /dev/null
	@pdflatex -interaction=batchmode tex/$*.tex > /dev/null
	@mv $*.pdf pdf/
	@rm -f $*.aux $*.log $*.toc $*.out $*.blg $*.bbl $*.nav $*.snm texput.log

.that.tickles: tickle.me
	@touch .that.tickles
