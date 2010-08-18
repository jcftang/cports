#VERSION=HEAD
VERSION=$(shell git describe)
DISTNAME=cports
DISTFILE=$(DISTNAME)-$(VERSION)

default: check-environment

dist: $(DISTNAME).tar $(DISTFILE).tar.bz2.sha1sum

$(DISTNAME).tar:
	@mkdir -p releases
	@git archive --format tar --prefix $(DISTFILE)/ -o releases/$(DISTFILE).tar $(VERSION)
	@bzip2 releases/$(DISTFILE).tar

clean:
	#@-rm $(DISTFILE).tar

whatchanged:
	(git whatchanged  `git tag -l | tail -1`..HEAD  | git shortlog)

$(DISTFILE).tar.bz2.sha1sum:
	@cd releases && openssl sha1 $(DISTFILE).tar.bz2 > $(DISTFILE).tar.bz2.sha1sum

.PHONY: whatchanged

# Bootstrapping it all on machines without some basic software.

all: bootstrap

dummy:
	@echo ""

bootstrap: wget gcc patch texinfo gtar
	@echo ""
	@echo "Bootstrap done."
	@echo "Now: "
	@echo " > cd packages"
	@echo " > $(MAKE) install"
	@echo "...to build everything."

check-environment:
	@echo "Checking your kit."
	@if $(MAKE) dummy --version | grep "GNU"; then \
	  echo "Ok, GNU make."; \
	  echo "Let's hope it is not too old."; \
	  echo "You need GNU Make version 3.79.1 or later."; \
	else \
	  echo "Sorry, you need GNU make version 3.79.1 or later."; \
	  exit 1; \
	fi; \
	if type cc || type gcc; then \
	  echo "Ok, you have a C compiler."; \
	else \
	  echo "Sorry, you you need a C compiler."; \
	  exit 1; \
	fi; \
	if type gunzip; then \
	  echo "Ok, you have GNU gunzip."; \
	else \
	  echo "Sorry, you need the gunzip program from the GNU gzip package."; \
	  exit 1; \
	fi; \
	if type tar; then \
	  echo "Ok, you have some kind of tar program."; \
	else \
	  echo "Sorry, you need some kind of tar program."; \
	  exit 1; \
	fi

wget: check-environment
	@if type wget || test -f $(PREFIX)/bootstrap/gnu/wget/current/bin/wget; then \
	: no-op; \
	else \
	echo "--- Making wget."; \
	cd packages/wget/1.9.1; \
	mkdir $(PREFIX)/bootstrap; \
	$(MAKE) \
	PREFIX=$(PREFIX)/bootstrap \
	PATCH="echo BOOTSTRAP: Ignoring patch: " \
	INSTALL_INFO="echo BOOTSTRAP: Ignoring install-info: " \
	BOOTSTRAP=yes install clean; \
	cd $(PREFIX)/bootstrap/gnu/wget; \
	ln -s 1.9.1 current; \
	fi

gcc: wget check-environment
	@if type gcc || test -f $(PREFIX)/bootstrap/gnu/gcc/current/bin/gcc; then \
	: no-op; \
	else \
	echo "--- Making gcc."; \
	cd packages/gcc/2.95.3; \
	mkdir $(PREFIX)/bootstrap; \
	export PREFIX INSTALL_INFO PATCH; \
	$(MAKE) \
	PREFIX=$(PREFIX)/bootstrap \
	PATCH="echo BOOTSTRAP: Ignoring patch: " \
	INSTALL_INFO="echo BOOTSTRAP: Ignoring install-info: " \
	BOOTSTRAP=yes install clean; \
	cd $(PREFIX)/bootstrap/gnu/gcc; \
	ln -s 2.95.3 current; \
	fi

patch:
	# gcc wget check-environment
	@patch=no; \
	if type patch; then \
	patch=patch; \
	fi; \
	if test -f $(PREFIX)/bootstrap/gnu/patch/current/bin/patch; then \
	patch=$(PREFIX)/bootstrap/gnu/patch/current/bin/patch; \
	else \
	if test -f $(PREFIX)/patch/current/bin/patch; then \
	patch=$(PREFIX)/patch/current/bin/patch; \
	fi; \
	fi; \
	if test "X$$patch" = "Xno"; then \
	: no-op; \
	else \
	if $$patch -v 2>/dev/null | grep >/dev/null "Free Software Foundation"; then \
	: no-op; \
	else \
	patch=no; \
	fi; \
	fi; \
	if test "X$$patch" = "Xno"; then \
	echo "--- Making patch."; \
	cd packages/patch/2.6.1; \
	mkdir $(PREFIX)/bootstrap; \
	$(MAKE) \
	PREFIX=$(PREFIX)/bootstrap \
	INSTALL_INFO="echo BOOTSTRAP: Ignoring install-info: " \
	CC=$(BOOTSTRAP_GCC) \
	BOOTSTRAP=yes install clean; \
	cd $(PREFIX)/bootstrap/gnu/patch; \
	ln -s 2.6.1 current; \
	fi

texinfo: patch gcc wget check-environment
	@if type install-info && \
	   (install-info --version | grep " 3." || \
	    install-info --version | grep " 2." || \
	    install-info --version | grep " 1."); then \
	: no-op; \
	else \
	if test -f $(PREFIX)/bootstrap/gnu/texinfo/current/bin/install-info; then \
	: no-op; \
	else \
	echo "--- Making texinfo."; \
	cd packages/texinfo/4.13; \
	mkdir $(PREFIX)/bootstrap; \
	$(MAKE) CC=$(BOOTSTRAP_GCC) PREFIX=$(PREFIX)/bootstrap \
	install clean; \
	cd $(PREFIX)/bootstrap/gnu/texinfo; \
	ln -s 4.13 current; \
	fi; \
	fi

gtar: texinfo patch gcc wget check-environment
	@if ( tar --version 2>&1 | grep GNU) ; then \
	: no-op; \
	else \
	if type gtar; then \
	: no-op; \
	else \
	if test -f $(PREFIX)/bootstrap/gnu/gtar/current/bin/gtar; then \
	: no-op; \
	else \
	echo "--- Making gtar."; \
	cd packages/gtar/1.23; \
	$(MAKE) install; \
	fi; \
	fi; \
	fi

install: all
	cd packages && $(MAKE) all
