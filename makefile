ORG_FILES := $(wildcard *.org)
TEX_FILES := $(ORG_FILES:.org=.tex)

all: texConvert

texConvert: $(TEX_FILES)

EFLAGS := --eval="(package-initialize)" --eval="(require 'org-ref)" --eval='(org-latex-export-to-latex nil nil nil t)'

%.tex: %.org
	emacs -batch $< $(EFLAGS)
  
clean:
	rm -f $(TEX_FILES)
