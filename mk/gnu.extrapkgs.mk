# $Id: gnu.extrapkgs.mk,v 1.8 2002/01/24 15:53:23 abo Exp $

# XXX For some reason, if a package doesn't build, the installation
#     will continue anyway.

ifdef EXTRA_PACKAGES
ifdef EXTRA_PACKAGES_IN_SUBDIRS
MODULELINES+=	"module use		$(PROGRAM_PREFIX)/modulefiles"
else
UPDATE_PROGRAMS_DB=	if $(TEST) ! -f $(PROGRAM_PREFIX)/.installed_programs || $(GREP) -v >/dev/null "^$$package" $(PROGRAM_PREFIX)/.installed_programs; then $(ECHO) >>$(PROGRAM_PREFIX)/.installed_programs $$package; fi;
endif
MODULELINES+=	"prepend-path PATH	$(PROGRAM_PREFIX)/bin"
MODULELINES+=	"prepend-path MANPATH	$(PROGRAM_PREFIX)/man"
MODULELINES+=	"prepend-path INFOPATH	$(PROGRAM_PREFIX)/info"
endif

# Override this if you need to. Possible other values are for example
# . or ../.. or ../../emacs/modules.
EXTRA_PACKAGES_DIR?=	../extra

ifdef EXTRA_PACKAGES_IN_SUBDIRS
# In this mode an extra package cannot DEPENDS on a normal package.
# (But it will inherit its parent package's DEPENDS environment.)
EXTRA_PACKAGE_ENV+=	PREFIX=$(PROGRAM_PREFIX)
EXTRA_PACKAGE_ENV+=	PREFIX_PATH="$(PROGRAM_PREFIX) $(PREFIX_PATH)"
else
# In this mode everyting will be installed in the same dir.
# No extra modules will be created.
EXTRA_PACKAGE_ENV+=	PROGRAM_PREFIX=$(PROGRAM_PREFIX)
EXTRA_PACKAGE_ENV+=	DONT_CREATE_METAINFO=yes
EXTRA_PACKAGE_ENV+=	PREFIX_PATH="$(PROGRAM_PREFIX)/.installed_programs $(PREFIX_PATH)"
endif

EXTRA_PACKAGE_ENV+=	\
		PARENT_MPKG_DEPENDS=$(MPKG_DEPENDS) \
		WORKDIR=$(WORKDIR)/packages/$$package_name-$$package_version

do-extrapkg-install:
ifdef EXTRA_PACKAGES
	$(QUIET) \
	: XXX This is a kludge.; \
	$(MAKE) do-module;
ifdef EXTRA_PACKAGES_IN_SUBDIRS
	$(QUIET) $(MKDIR) $(PROGRAM_PREFIX)/modulefiles ;
endif
	$(QUIET) $(MODULE_ADD) $(DISTNAME)/$(VERSION);	\
	for package in $(EXTRA_PACKAGES); do \
		package_name=`echo $$package | sed 's,/.*$$,,'`; \
		if test ! -d $(EXTRA_PACKAGES_DIR)/$$package_name; then \
			echo "*** ERROR: Package $$package_name does not exist."; \
			echo "***        Aborting install."; \
			exit 1; \
		fi; \
		package_version=`echo $$package | sed 's,^.*/,,'`; \
		if test "$$package" = "$$package_version"; then \
			package_version=`ls -1 $(EXTRA_PACKAGES_DIR)/$$package_name/*/Makefile | sed "s,$(EXTRA_PACKAGES_DIR)/$$package_name/,," | sed 's,/Makefile,,' | sort -rn | head -1`; \
		fi; \
		if test X$$package_version = X; then \
			echo "*** ERROR: Package $$package_name has no versions defined."; \
			echo "***        Aborting install."; \
			exit 1; \
		fi; \
		if test ! -d $(EXTRA_PACKAGES_DIR)/$$package_name/$$package_version; then \
			echo "*** ERROR: Package $$package_name does not have a version $$package_version."; \
			echo "***        Aborting install."; \
			exit 1; \
		fi; \
		echo "Installing package $$package_name-$$package_version:"; \
		(cd $(EXTRA_PACKAGES_DIR)/$$package_name/$$package_version && \
		 $(MAKE) $(EXTRA_PACKAGE_ENV) install-program || exit 1) || exit 1 ; \
		test -d $(PROGRAM_PREFIX)/lib && test -x /sbin/ldconfig && \
		    /sbin/ldconfig -n $(PROGRAM_PREFIX)/lib; \
		test -d $(PREFIX)/lib && test -x /sbin/ldconfig && \
		    /sbin/ldconfig -n $(PREFIX)/lib; \
		$(UPDATE_PROGRAMS_DB) \
		test -f $(WORKDIR)/packages/$$package_name-$$package_version/.install_done || exit 1; \
	done;
endif
