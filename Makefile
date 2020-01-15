MAINFILE = test
SRC = $(shell pwd)
BUILD_DIR = _build
FINAL_DIR = final
SOLUTION_DIR = solution


# ***********************************************************
# ****** MAIN

all:  # all do nothing by default

pdf: pdf1  # default
pdf1: pdflatex bib pdflatex
pdf2: pdfdocker

prettify: backup tabs2spaces rmTrailingSpaces

final: copyFinalPdf
solution: copySolutionPdf

.PHONY: all pdf pdf1 pdf2 prettify final solution


# ***********************************************************
# ****** BUILD RECIPES

# build using docker
pdfdocker:
	docker pull dxjoke/tectonic-docker
	docker run --mount src=$(SRC),target=/usr/src/tex,type=bind dxjoke/tectonic-docker /bin/sh -c "tectonic --keep-intermediates --reruns 0 $MAINFILE.tex; biber $MAINFILE; tectonic $MAINFILE.tex"

# build using pdflatex
pdflatex: 
	pdflatex $(MAINFILE)
bib:
	biber $(MAINFILE)

# read
read:
	evince $(MAINFILE).pdf &

# edit
edit:
	emacs ${MAINFILE}.tex

# backup
backup:
	cp ${MAINFILE}.tex ${MAINFILE}.tex.bak
restore:
	cp ${MAINFILE}.tex.bak ${MAINFILE}.tex

# convert a tab to 4 spaces 
tabs2spaces:
	expand -t 4 ${MAINFILE}.tex > ${MAINFILE}.tex.tmp
	mv ${MAINFILE}.tex.tmp ${MAINFILE}.tex

# remove trailing spaces
rmTrailingSpaces:
# do nothing for now
# FIXME: the $ si interpreted in bash end cause the sed command to fail!
# sed --in-place "s/[[:space:]]\+$//" ${MAINFILE}.tex

# copy final pdf
copyFinalPdf:
	cp --force "${MAINFILE}.pdf" "${FINAL_DIR}/${MAINFILE}.pdf"

# copy solution pdf
copySolutionPdf:
	cp --force "${MAINFILE}.pdf" "${SOLUTION_DIR}/${MAINFILE}.pdf"

.PHONY: pdfdocker pdflatex bib read edit backup restore tabs2spaces
	rmTrailingSpaces copyFinalPdf copySolutionPdf


# ***********************************************************
# ****** CLEAN RECIPES
.PHONY: clean
clean:
	-rm -f *.aux
	-rm -f *.log
	-rm -f *.toc
	-rm -f *.bbl
	-rm -f *.blg
	-rm -f *.out
	-rm -f make/bib

.PHONY: cleanall
cleanall: clean
	-rm -f *.pdf
	-rm -f *.ps
	-rm -f *.dvi
	-rm -rf ./make
	-rm -f *.mtc*
	-rm -f *.maf
	-rm -f *.listing
	-rm -f *.loa
	-rm -f *.lof
	-rm -f *.lot
	-rm -f *.bcf
	-rm -f *.fls
	-rm -f *.pyg
	-rm -f *.run.xml
	-rm -rf $(BUILD_DIR)
