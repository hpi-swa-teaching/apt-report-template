
REPORT_FILE=report

PANDOC=pandoc

PANDOC_OPTIONS=--from markdown --template ./eisvogel.tex --listings --bibliography=bibliography.bib --biblatex

PDFLATEX=pdflatex -output-directory=output


tex : 
	$(PANDOC) $(REPORT_FILE).md -o $(REPORT_FILE).tex $(PANDOC_OPTIONS)

pdf : tex
	$(PDFLATEX) $(REPORT_FILE).tex

full-pdf : tex
	$(PDFLATEX) $(REPORT_FILE).tex
	biber $(REPORT_FILE)
	$(PDFLATEX) $(REPORT_FILE).tex
	$(PDFLATEX) $(REPORT_FILE).tex

all : tex pdf full_pdf
.PHONY: full_pdf
