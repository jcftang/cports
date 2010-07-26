# $Id: prg.emacsmod.mk,v 1.2 2001/02/21 16:15:38 abo Exp $

# This file should be included in the makefile for emacs modules. It
# defines a do-configure that that refuses to build the module unless
# the two variables EMACS_PREFIX and EMACS_VERSION have been set. It
# also redefines the WORKDIR to include the version of emacs the
# module is being built for (EMACS_VERSION) so that one can
# concurrently build the same module for several different versions of
# emacs.

ifeq ($(MAKELEVEL),0)
$(warning ******************************************)
$(warning You are not expected to install this)
$(warning module manually. Invoke it from the emacs)
$(warning Makefile by setting EMACS_MODULES.)
$(warning ******************************************)
endif

# We might need the PREFIX_* variables of other packages.
# $(MPKG_DEPENDS) is already included in gnu.mpkg.mk, and will point
# to emacs packages (modules), because we have a PREFIX of
# "/mpkg/emacs/20.7" or whereever you keep your installation.

MODULELINES?=	"prepend-path	EMACSLOADPATHLOCAL	$(PROGRAM_PREFIX)/share/emacs/site-lisp" \

sinclude $(PARENT_MPKG_DEPENDS)
