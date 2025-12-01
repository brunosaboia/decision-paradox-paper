# Makefile for LaTeX compilation

# File name without extension
TARGET = decision-paradox-paper

# LaTeX compiler command
LATEX  = pdflatex -synctex=1 -interaction=nonstopmode
BIBTEX = bibtex

# Default rule to build the PDF
all: $(TARGET).pdf

# Rule to compile the LaTeX file with bibliography
$(TARGET).pdf: $(TARGET).tex $(TARGET).bib
	$(LATEX) $(TARGET).tex       # 1st run: write .aux
	$(BIBTEX) $(TARGET)          # BibTeX: read .aux → write .bbl
	$(LATEX) $(TARGET).tex       # 2nd run: read .bbl
	$(LATEX) $(TARGET).tex       # 3rd run: fix cross-refs

# Clean auxiliary files
clean:
	rm -f $(TARGET).aux $(TARGET).log $(TARGET).synctex.gz $(TARGET).out $(TARGET).toc \
	      $(TARGET).bbl $(TARGET).blg $(TARGET).fdb_latexmk $(TARGET).fls

# Clean everything including the PDF
cleanall: clean
	rm -f $(TARGET).pdf

# Phony targets
.PHONY: all clean cleanall
