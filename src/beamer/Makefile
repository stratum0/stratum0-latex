include ../Makefile.include


STYLIST = beamercolorthemestratum0.sty beamerfontthemestratum0.sty beamerinnerthemestratum0.sty beamerouterthemestratum0.sty beamerthemestratum0.sty stratum0beamersizes.sty
DTXLIST = beamercolorthemestratum0.dtx beamerfontthemestratum0.dtx beamerinnerthemestratum0.dtx beamerouterthemestratum0.dtx beamerthemestratum0.dtx stratum0beamersizes.dtx
INSFILE = stratum0beamer.ins
TEXDOCFILE = stratum0beamerdoc.tex

all: $(STYLIST)

$(STYLIST): $(DTXLIST)
	$(LATEX_SILENT) $(INSFILE)

doc: $(DTXLIST:$(SRCDIR)/%.dtx=%.pdf) $(TEXDOCFILE:%.tex=%.pdf) cleantemp

$(TEXDOCFILE:%.tex=%.pdf): $(TEXDOCFILE)
	$(ECHO)  'Generating main documentation $<...'
	$(PDFLATEX_SILENT) $(TEXDOCFILE) $(SILENT)
	$(MAKEINDEX) -q -s gind.ist -o stratum0beamerdoc.ind stratum0beamerdoc.idx $(SILENT)
	$(PDFLATEX_SILENT) $(TEXDOCFILE) $(SILENT)
	$(ECHO) -e '$(DONE_STRING)'

%.pdf: $(SRCDIR)/%.dtx
	$(PDFLATEX_SILENT) $< $(SILENT)
	$(PDFLATEX_SILENT) $< $(SILENT)

cleantemp:
	$(RM) -f *~ *.aux *.log *.glo *.idx *.out *.ilg *.ind *.toc *.backup

clean: cleantemp
	$(RM) -f *.sty *.pdf