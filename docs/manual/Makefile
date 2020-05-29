############################################################
# Makefile for building documentation
############################################################

# make target for generating the pdf manual.
conman.pdf: conman.tex ConMan.bib
	@if test -x "`which pdflatex`" \
                 -a -x "`which bibtex`"; then \
	   (rm -f conman.{aux,bbl,blg,log,out,pdf,toc,lof}; \
		pdflatex --interaction=batchmode conman.tex;      \
		bibtex conman                                  && \
		pdflatex --interaction=batchmode conman.tex    && \
		pdflatex --interaction=batchmode conman.tex    && \
		pdflatex --interaction=batchmode conman.tex); \
         else \
	  echo "------------------------------------------------------" ; \
	  echo "Can't find either 'pdflatex', or 'bibtex'." ; \
	  echo "------------------------------------------------------" ; \
	  false ; \
	 fi

clean:
	rm -f conman.{aux,bbl,blg,log,out,toc,lof};
