targetinfo = \
	@dashes=`echo "$@" | tr '[:print:]' '-'`; \
	echo ; \
	echo  +-$${dashes}-+ ; \
	echo \| $@ \| ; \
	echo  +-$${dashes}-+ ; \

DESTDIR?=$(shell kpsewhich --var-value TEXMFLOCAL)
STRATUM0_LATEX=tex/latex/stratum0

all: YanoneKaffeesatzZeroHack.all beamer.all
	$(call targetinfo)
	mkdir -p texmf/tex/latex/stratum0/img texmf/fonts

	cp -r src/YanoneKaffeesatzZeroHack/fonts/* texmf/fonts/
	cp src/YanoneKaffeesatzZeroHack/*.fd texmf/$(STRATUM0_LATEX)
	cp src/YanoneKaffeesatzZeroHack/*.sty texmf/$(STRATUM0_LATEX)

	cp src/beamer/*.sty texmf/$(STRATUM0_LATEX)
	cp src/beamer/img/*.pdf texmf/$(STRATUM0_LATEX)/img

YanoneKaffeesatzZeroHack.%:
	$(call targetinfo)
	$(MAKE) -C src/YanoneKaffeesatzZeroHack/ -w $*

beamer.%:
	$(call targetinfo)
	$(MAKE) -C src/beamer -w $*

install-build: all
	$(call targetinfo)
	mkdir -p $(DESTDIR)
	cp -r texmf/* $(DESTDIR)

install: install-build
	mktexlsr
	updmap-sys --nomkmap --nohash --enable Map=YanoneKaffeesatzZeroHack.map
	updmap-sys
	mktexlsr

# YanoneKaffeesatzZeroHack uses itself in documentation, so needs to be
# installed first. However, tex does not find fonts unless they are in a
# system-wide texmf tree, so install needs root access, so don't depend on
# install for building the docs.
doc: YanoneKaffeesatzZeroHack.doc beamer.doc
	$(call targetinfo)
	mkdir -p doc
	cp -t doc/ src/beamer/stratum0beamerdoc.pdf src/YanoneKaffeesatzZeroHack/yanonekaffeesatzzerohack.pdf

dist stratum0beamer.zip: doc
	$(call targetinfo)
	zip -r stratum0beamer.zip texmf/* doc/* -x "*/\.*" -x "\.*"

clean: YanoneKaffeesatzZeroHack.clean beamer.clean
	$(call targetinfo)
	rm -rf texmf/ doc/

distclean: clean
	$(call targetinfo)
	rm -f stratum0beamer.zip

help:
	@echo 'Available targets:'
	@echo '  help      - show this help'
	@echo '  all       - build latex packages (excl. docs) to ./texmf/ (default target)'
	@echo '  install   - install into $$(DESTDIR)'
	@echo '  doc       - build documentation (needs install first)'
	@echo '  dist      - build .zip for distribution'
	@echo
	@echo '  clean     - clean all build and doc files'
	@echo "  distclean - clean and also remove files made by 'make dist'"
	@echo
	@echo 'Available variables:'
	@echo '  DESTDIR   - directory where the files are installed'
	@echo '              (default: $(DESTDIR))'

.PHONY: all build clean dist doc distclean help install
