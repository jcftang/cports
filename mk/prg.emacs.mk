# $Id: prg.emacs.mk,v 1.18 2001/10/24 17:11:44 abo Exp $

# XXX For some reason, if a module doesn't build, the installation
#     will continue anyway.

do-install: do-instal%
ifdef CONFIG_SITELISP_DIR
	-$(QUIET) $(MV) </dev/null $(PROGRAM_PREFIX)/share/emacs/site-lisp \
	      $(PROGRAM_PREFIX)/share/emacs/site-lisp.original
	$(QUIET) $(LN) $(CONFIG_SITELISP_DIR) $(PROGRAM_PREFIX)/share/emacs/site-lisp
else
	$(QUIET) $(CP) site-lisp/*.el $(PROGRAM_PREFIX)/share/emacs/$(VERSION)/site-lisp/
endif
ifdef EMACS_MODULES
	$(QUIET) \
	: XXX This is a kludge.; \
	$(MAKE) do-module; \
	$(MKDIR) $(PROGRAM_PREFIX)/modulefiles ; \
	$(MODULE_ADD) $(DISTNAME)/$(VERSION); \
	for module in $(EMACS_MODULES); do \
		module_name=`echo $$module | sed 's,/.*$$,,'`; \
		if test ! -d ../modules/$$module_name; then \
			echo "*** ERROR: Module $$module_name does not exist."; \
			echo "***        Aborting install."; \
			exit 1; \
		fi; \
		module_version=`echo $$module | sed 's,^.*/,,'`; \
		if test "$$module" = "$$module_version"; then \
			module_version=`ls -1 ../modules/$$module_name/*/Makefile | sed "s,../modules/$$module_name/,," | sed 's,/Makefile,,' | sort -rn | head -1`; \
		fi; \
		if test X$$module_version = X; then \
			echo "*** ERROR: Module $$module_name has no versions defined."; \
			echo "***        Aborting install."; \
			exit 1; \
		fi; \
		if test ! -d ../modules/$$module_name/$$module_version; then \
			echo "*** ERROR: Module $$module_name does not have a version $$module_version."; \
			echo "***        Aborting install."; \
			exit 1; \
		fi; \
		echo "Installing module $$module_name-$$module_version:"; \
		(cd ../modules/$$module_name/$$module_version && \
		 $(MAKE) PARENT_MPKG_DEPENDS=$(MPKG_DEPENDS) \
		 PREFIX=$(PROGRAM_PREFIX) \
		 PREFIX_PATH="$(PROGRAM_PREFIX) $(PREFIX_PATH)" \
		 WORKDIR=$(WORKDIR)/modules/$$module_name-$$module_version \
		install || exit 1) ; \
	done;
endif
