# Makefile for LaTeX compilation

# File name without extension
TARGET = decision-paradox-paper

# LaTeX compiler command
LATEX = pdflatex -synctex=1 -interaction=nonstopmode

# Default rule to build the PDF
all: $(TARGET).pdf

# Rule to compile the LaTeX file
$(TARGET).pdf: $(TARGET).tex
	$(LATEX) $(TARGET).tex
	$(LATEX) $(TARGET).tex  # Run twice for proper references

# Clean auxiliary files
clean:
	rm -f $(TARGET).aux $(TARGET).log $(TARGET).synctex.gz $(TARGET).out $(TARGET).toc \
	      $(TARGET).bbl $(TARGET).blg $(TARGET).fdb_latexmk $(TARGET).fls

# Clean everything including the PDF
cleanall: clean
	rm -f $(TARGET).pdf

# Phony targets
.PHONY: all clean cleanall
