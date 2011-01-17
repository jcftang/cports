EMACS:=$(shell \
	if qemacs --version >/dev/null; then \
		echo emacs;\
		touch .docs-available; \
	else \
		echo "Warning: emacs not installed; can't generate html output." >&2; \
		echo '@echo Skipping: emacs'; \
		rm -f .docs-available; \
	fi)

#EMACS=$(shell echo /opt/local/bin/emacs)

default: all

all: html

html: $(patsubst %.org,%.html,$(wildcard *.org))

%.html: %.org Makefile
	$(EMACS) --batch -q --no-site-file --visit $< --funcall org-export-as-html-batch 

.PRECIOUS: %.org Makefile

clean:
	rm -f *~ .*~ *.[0-9] *.new *.tmp *.html .docs-available
