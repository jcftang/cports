# $Id: prg.perl.mk,v 1.4 2001/10/23 13:09:52 abo Exp $

# This file should be included in the makefile for Perl
# distributions. It defines a do-install that first installs perl
# using do-instal% and then installs all modules by iterating over the
# list PERL_MODULES and calls make with the arguments PERL_PREFIX and
# PERL_VERSION. There is also a do-clean that removes all the files
# for the modules as well as the perl distribution itself.

# Iterate over all the modules. The modules are located in
# ../modules/MODULENAME/VERSION.  The most current version should
# be used except when a specific version number is given by the
# makefile for perl.

do-install:	do-instal%
ifdef PERL_MODULES
	$(QUIET) \
	for PMOD in $(PERL_MODULES); do \
		PMOD_N=`echo $$PMOD | sed 's,/.*$$,,'` ; \
		if test ! -d ../modules/$$PMOD_N; then \
			echo "*** ERROR: Module $$PMOD_N does not exist." ; \
			echo "***        Aborting build."; \
			exit 1; \
		fi ; \
		PMOD_V=`echo $$PMOD | sed 's,^.*/,,'` ; \
		if test $$PMOD = $$PMOD_V; then \
			PMOD_V=`ls -1 ../modules/$$PMOD_N/ | grep -v CVS | sort -rn | head -1` ; \
		fi ; \
		if test X$$PMOD_V = X; then \
			echo "*** ERROR: Module $$PMOD_N has no versions installed." ; \
			echo "***        Aborting build."; \
			exit 1; \
		fi ; \
		if test ! -d ../modules/$$PMOD_N/$$PMOD_V; then \
			echo "*** ERROR: Module $$PMOD_N does not have a version $$PMOD_V. " ; \
			echo "***        Aborting build."; \
			exit 1; \
		fi ; \
		(cd ../modules/$$PMOD_N/$$PMOD_V && \
		 $(MAKE) DONT_CREATE_METAINFO=yes PERL_VERSION=$(VERSION) PERL_PREFIX=$(PROGRAM_PREFIX) install) ; \
	done ;
endif
	@: #no-op, avoid empty target

do-clean:	do-clea%
ifdef PERL_MODULES
	$(QUIET) \
	for PMOD in $(PERL_MODULES); do \
		PMOD_N=`echo $$PMOD | sed 's,/.*$$,,'` ; \
		if test ! -d ../modules/$$PMOD_N; then \
			echo "*** ERROR: Module $$PMOD_N does not exist." ; \
			echo "***        Aborting clean."; \
			exit 1; \
		fi ; \
		PMOD_V=`echo $$PMOD | sed 's,^.*/,,'` ; \
		if test $$PMOD = $$PMOD_V; then \
			PMOD_V=`ls -1 ../modules/$$PMOD_N/ | grep -v CVS | sort -rn | head -1` ; \
		fi ; \
		if test X$$PMOD_V = X; then \
			echo "*** ERROR: Module $$PMOD_N has no versions installed." ; \
			echo "***        Aborting clean."; \
			exit 1; \
		fi ; \
		if test ! -d ../modules/$$PMOD_N/$$PMOD_V; then \
			echo "*** ERROR: Module $$PMOD_N does not have a version $$PMOD_V. " ; \
			echo "***        Aborting clean."; \
			exit 1; \
		fi ; \
		(cd ../modules/$$PMOD_N/$$PMOD_V && \
		 $(MAKE) PERL_VERSION=$(VERSION) PERL_PREFIX=$(PROGRAM_PREFIX) clean) ; \
	done ;
endif
	@: #no-op, avoid empty target



