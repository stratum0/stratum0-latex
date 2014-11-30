include ../Makefile.include

SRCDIR = src
OTFSRCDIR = otf-src
BUILDDIR = build

# Files
STYLIST := yanonekaffeesatzzerohack.sty
DTXLIST = yanonekaffeesatzzerohack.dtx
INSFILE = yanonekaffeesatzzerohack.ins

FONTBASE = YanoneKaffeesatzZeroHack

OTFDEFAULT = --warn-missing
OTFDEFAULT += --encoding=texnansx
OTFDEFAULT += --feature=kern
OTFDEFAULT += --feature=liga
OTFDEFAULT += --force
OTFDEFAULT += --tfm-directory=fonts/tfm/$(FONTBASE)/
OTFDEFAULT += --vf-directory=fonts/vf/$(FONTBASE)/ 
OTFDEFAULT += --type1-directory=fonts/type1/$(FONTBASE)/
OTFDEFAULT += --encoding-directory=fonts/enc/dvips/Fontshop/


SANS_OPTS = --map-file=fonts/map/dvips/$(FONTBASE).map


# For (not-hanging) lined figures
LNUMFEATURE = --feature=lnum
# For small caps
SMCPFEATURE = --feature=smcp

.PHONY: cleantemp clean

# TODO: make fonts, too?
all: fonts src cleantemp


src: $(STYLIST)

doc: $(DTXLIST:%.dtx=%.pdf)

$(STYLIST): $(DTXLIST)
	$(ECHO) -n 'Generating LaTeX-files for $<'...
	$(LATEX) $(INSFILE) $(SILENT)
	$(ECHO) -e '$(DONE_STRING)'

%.pdf: %.dtx
	$(ECHO) -n 'Compiling doc for $<'...
	$(PDFLATEX_SILENT) $< $(SILENT)
	$(PDFLATEX_SILENT) $< $(SILENT)
	$(ECHO) -e '$(DONE_STRING)'

fonts:
	$(ECHO) -en 'Generating font files...'
	$(MKDIR) -p fonts/enc/dvips/Fontshop/
	$(MKDIR) -p fonts/map/dvips/
	$(MKDIR) -p fonts/tfm/$(FONTBASE)/
	$(MKDIR) -p fonts/vf/$(FONTBASE)/
	$(MKDIR) -p fonts/type1/$(FONTBASE)/
	# Serif
	$(OTFTOTFM) --no-updmap --vendor=Fontshop --name=$(FONTBASE)-Regular $(OTFDEFAULT) $(SANS_OPTS) $(OTFSRCDIR)/$(FONTBASE)-Regular.otf $(SILENT)
	$(OTFTOTFM) --no-updmap --vendor=Fontshop --name=$(FONTBASE)-SmallCaps $(OTFDEFAULT) --feature=smcp $(SANS_OPTS) $(OTFSRCDIR)/$(FONTBASE)-Regular.otf $(SILENT)
	$(OTFTOTFM) --no-updmap --vendor=Fontshop --name=$(FONTBASE)-Slanted $(OTFDEFAULT) --slant=.167 $(SANS_OPTS) $(OTFSRCDIR)/$(FONTBASE)-Regular.otf $(SILENT)
	$(OTFTOTFM) --no-updmap --vendor=Fontshop --name=$(FONTBASE)-Italic $(OTFDEFAULT) --slant=.167 $(SANS_OPTS) $(OTFSRCDIR)/$(FONTBASE)-Regular.otf $(SILENT)
	
	$(OTFTOTFM) --no-updmap --vendor=Fontshop --name=$(FONTBASE)-Light $(OTFDEFAULT) $(SANS_OPTS) $(OTFSRCDIR)/$(FONTBASE)-Light.otf $(SILENT)
	$(OTFTOTFM) --no-updmap --vendor=Fontshop --name=$(FONTBASE)-Light-SmallCaps $(OTFDEFAULT) --feature=smcp $(SANS_OPTS) $(OTFSRCDIR)/$(FONTBASE)-Light.otf $(SILENT)
	$(OTFTOTFM) --no-updmap --vendor=Fontshop --name=$(FONTBASE)-Light-Slanted $(OTFDEFAULT) --slant=.167 $(SANS_OPTS) $(OTFSRCDIR)/$(FONTBASE)-Light.otf $(SILENT)
	$(OTFTOTFM) --no-updmap --vendor=Fontshop --name=$(FONTBASE)-Light-Italic $(OTFDEFAULT) --slant=.167 $(SANS_OPTS) $(OTFSRCDIR)/$(FONTBASE)-Light.otf $(SILENT)

	$(OTFTOTFM) --no-updmap --vendor=Fontshop --name=$(FONTBASE)-Bold $(OTFDEFAULT) $(SANS_OPTS) $(OTFSRCDIR)/$(FONTBASE)-Bold.otf $(SILENT)
	$(OTFTOTFM) --no-updmap --vendor=Fontshop --name=$(FONTBASE)-Bold-SmallCaps $(OTFDEFAULT) --feature=smcp $(SANS_OPTS) $(OTFSRCDIR)/$(FONTBASE)-Bold.otf $(SILENT)
	$(OTFTOTFM) --no-updmap --vendor=Fontshop --name=$(FONTBASE)-Bold-Slanted $(OTFDEFAULT) --slant=.167 $(SANS_OPTS) $(OTFSRCDIR)/$(FONTBASE)-Bold.otf $(SILENT)
	$(OTFTOTFM) --no-updmap --vendor=Fontshop --name=$(FONTBASE)-Bold-Italic $(OTFDEFAULT) --slant=.167 $(SANS_OPTS) $(OTFSRCDIR)/$(FONTBASE)-Bold.otf
	
	$(ECHO) -e '$(OK_STRING)'

cleantemp:
	$(ECHO) -n "Clean temporary files..."
	$(RM) -f *~ build/*~ *.aux *.log *.glo *.idx *.out *.toc *.backup
	$(ECHO) -e '$(OK_STRING)'

clean: cleantemp
	$(ECHO) -n "Clean build files..."
	$(RM) -rf *.sty *.pdf
	$(RM) -rf fonts
	$(ECHO) -e '$(OK_STRING)'
