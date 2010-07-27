# $Id: prg.r.mk,v 1.4 2001/10/23 13:09:52 abo Exp $

# This file should be included in the makefile for R
# distributions. It defines a do-install that first installs R
# using do-instal% and then installs all modules by iterating over the
# list R_MODULES and calls make with the arguments R_PREFIX and
# R_VERSION. There is also a do-clean that removes all the files
# for the modules as well as the R distribution itself.

# Iterate over all the modules. The modules are located in
# ../modules/MODULENAME/VERSION.  The most current version should
# be used except when a specific version number is given by the
# makefile for R.

do-install:	do-instal%
ifdef R_MODULES
	$(QUIET) \
	for RMOD in $(R_MODULES); do \
		RMOD_N=`echo $$RMOD | sed 's,/.*$$,,'` ; \
		if test ! -d ../modules/$$RMOD_N; then \
			echo "*** ERROR: Module $$RMOD_N does not exist." ; \
			echo "***        Aborting build."; \
			exit 1; \
		fi ; \
		RMOD_V=`echo $$RMOD | sed 's,^.*/,,'` ; \
		if test $$RMOD = $$RMOD_V; then \
			RMOD_V=`ls -1 ../modules/$$RMOD_N/ | grep -v CVS | sort -rn | head -1` ; \
		fi ; \
		if test X$$RMOD_V = X; then \
			echo "*** ERROR: Module $$RMOD_N has no versions installed." ; \
			echo "***        Aborting build."; \
			exit 1; \
		fi ; \
		if test ! -d ../modules/$$RMOD_N/$$RMOD_V; then \
			echo "*** ERROR: Module $$RMOD_N does not have a version $$RMOD_V. " ; \
			echo "***        Aborting build."; \
			exit 1; \
		fi ; \
		(cd ../modules/$$RMOD_N/$$RMOD_V && \
		 $(MAKE) DONT_CREATE_METAINFO=yes R_VERSION=$(VERSION) R_PREFIX=$(PROGRAM_PREFIX) install) ; \
	done ;
endif
	@: #no-op, avoid empty target

do-clean:	do-clea%
ifdef R_MODULES
	$(QUIET) \
	for RMOD in $(R_MODULES); do \
		RMOD_N=`echo $$RMOD | sed 's,/.*$$,,'` ; \
		if test ! -d ../modules/$$RMOD_N; then \
			echo "*** ERROR: Module $$RMOD_N does not exist." ; \
			echo "***        Aborting clean."; \
			exit 1; \
		fi ; \
		RMOD_V=`echo $$RMOD | sed 's,^.*/,,'` ; \
		if test $$RMOD = $$RMOD_V; then \
			RMOD_V=`ls -1 ../modules/$$RMOD_N/ | grep -v CVS | sort -rn | head -1` ; \
		fi ; \
		if test X$$RMOD_V = X; then \
			echo "*** ERROR: Module $$RMOD_N has no versions installed." ; \
			echo "***        Aborting clean."; \
			exit 1; \
		fi ; \
		if test ! -d ../modules/$$RMOD_N/$$RMOD_V; then \
			echo "*** ERROR: Module $$RMOD_N does not have a version $$RMOD_V. " ; \
			echo "***        Aborting clean."; \
			exit 1; \
		fi ; \
		(cd ../modules/$$RMOD_N/$$RMOD_V && \
		 $(MAKE) R_VERSION=$(VERSION) R_PREFIX=$(PROGRAM_PREFIX) clean) ; \
	done ;
endif
	@: #no-op, avoid empty target
