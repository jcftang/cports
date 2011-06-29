# $Id: prg.perlmod.mk,v 1.10 2001/11/29 15:19:32 eskil Exp $

# This file should be included in the makefile for Perl modules. It
# defines a do-configure that that refuses to build the module unless
# the two variables PERL_PREFIX and PERL_VERSION have been set. It
# also specifies where to fetch CPAN modules from and redefines the
# WORKDIR to include the version of perl the module is being built for
# (PERL_VERSION) so that one can concurrently build the same module
# for several different versions of perl.

# A module can define PERL_DEPENDS to tell us that it depend on other
# perl modules. Note that you can also use DEPENDS to depend on normal
# mpkg packages (like DBD::Pg depends on Postgresql for example).

ifeq ($(MAKELEVEL),0)
$(warning ******************************************)
$(warning You are not expected to install this)
$(warning module manually. Invoke it from the perl)
$(warning Makefile by setting PERL_MODULES.)
$(warning ******************************************)
endif

ifeq "$(origin PERL_VERSION)" "undefined"
$(warning ******************************************)
$(warning Make variables needed to compile perl)
$(warning modules were not correctly set. Aborting)
$(warning build.)
$(warning ******************************************)
$(error No PERL_VERSION set!)
endif

ifeq "$(origin PERL_PREFIX)" "undefined"
$(warning ******************************************)
$(warning Make variables needed to compile perl)
$(warning modules were not correctly set. Aborting)
$(warning build.)
$(warning ******************************************)
$(error No PERL_PREFIX set!)
endif

# Don't create modulefiles for the perl modules!
DONT_CREATE_METAINFO=yes

PERLMODSITE?=	ftp://ftp.sunet.se/pub/lang/perl/CPAN/modules/by-module
ifndef WORKDIRPREFIX
WORKDIR?=	$(CURDIR)/work.$(SYSTEM_ID)_$(PERL_VERSION)
else
WORKDIR?=	$(WORKDIRPREFIX)_$(PERL_VERSION)
endif

MASTER_SITES+=	$(PERLMODSITE)/$(CPAN_CATEGORY)/

PERL_BINARY=	$(PERL_PREFIX)/bin/perl

ifeq "$(shell test -x $(PERL_BINARY) || echo 'false')" "false"
$(warning ******************************************)
$(warning Binary $(PERL_BINARY) as specified)
$(warning by PERL_PREFIX does not exist or is)
$(warning not executable.)
$(warning ******************************************)
$(error Unable to continue build.)
endif

# Check dependencies and do the perl way of configuring things.

# In the next version PERL_MODULES should be exported from the perl
# main distribution makefile so that the modules themselves can
# resolve dependencies and build the version, perl requests, of the
# module the depend upon. If there is a dependency upon a module which
# is not listed there should be a warning that we should add the
# module to the PERL_MODULES. We should also warn that the order is
# incorrect and say that module XXX depends on module YYY and they
# should swap places.

do-configure:
ifdef PERL_DEPENDS
	$(QUIET) \
	for PERL_DEP in $(PERL_DEPENDS) ; do \
		grep -E >/dev/null "^$$PERL_DEP/" $(PERL_PREFIX)/.installed_modules || \
		(echo "*** ERROR: Prerequisite module $$PERL_DEP not installed." && \
		exit 1); \
	done 
endif
	$(QUIET) \
	cd $(WRKSRC) ; $(CONFIGURE_ENV) $(PERL_BINARY) Makefile.PL $(PERL_MAKEOPTS)

# Tell the world that we installed the module. We do not wish to do
# the do-instal% stuff since that also creates directories that we do
# not wish to have. Thus the first two lines are ripped directly from
# gnu.mpkg.mk

do-install:
	$(QUIET) \
	$(MODULE_ADD) $(BUILD_DEPENDS); \
        cd $(WRKSRC) && $(SETENV) $(MAKE_ENV) $(MAKE_PROGRAM) $(MAKE_FLAGS) -f $(MAKEFILE) $(INSTALL_TARGET) && \
	echo "$(DISTNAME)/$(VERSION)/" >> $(PERL_PREFIX)/.installed_modules







