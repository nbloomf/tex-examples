pdfs: $(patsubst tex/%.tex,pdf/%.pdf,$(wildcard tex/*.tex))

pdf/%.pdf: tex/%.tex .that.tickles
	@echo 'building $*.pdf' | doppler lightgreen
	@pdflatex -interaction=batchmode tex/$*.tex > /dev/null
	@pdflatex -interaction=batchmode tex/$*.tex > /dev/null
	@mv $*.pdf pdf/
	@rm -f $*.aux $*.log $*.toc $*.out texput.log

.that.tickles: tickle.me
	@touch .that.tickles
