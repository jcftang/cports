# R version of prg.perlmod.mk

# $Id: prg.Rmod.mk,v 1.10 2001/11/29 15:19:32 eskil Exp $

# This file should be included in the makefile for R modules. It
# defines a do-configure that that refuses to build the module unless
# the two variables R_PREFIX and R_VERSION have been set. It
# also specifies where to fetch CRAN modules from and redefines the
# WORKDIR to include the version of r the module is being built for
# (R_VERSION) so that one can concurrently build the same module
# for several different versions of r.

# A module can define R_DEPENDS to tell us that it depend on other
# r modules. Note that you can also use DEPENDS to depend on normal
# mpkg packages (like DBD::Pg depends on Postgresql for example).

ifeq ($(MAKELEVEL),0)
$(warning ******************************************)
$(warning You are not expected to install this)
$(warning module manually. Invoke it from the r)
$(warning Makefile by setting R_MODULES.)
$(warning ******************************************)
endif

ifeq "$(origin R_VERSION)" "undefined"
$(warning ******************************************)
$(warning Make variables needed to compile r)
$(warning modules were not correctly set. Aborting)
$(warning build.)
$(warning ******************************************)
$(error No R_VERSION set!)
endif

ifeq "$(origin R_PREFIX)" "undefined"
$(warning ******************************************)
$(warning Make variables needed to compile r)
$(warning modules were not correctly set. Aborting)
$(warning build.)
$(warning ******************************************)
$(error No R_PREFIX set!)
endif

# Don't create modulefiles for the r modules!
DONT_CREATE_METAINFO=yes

RMODSITE?=	http://cran.r-project.org/src/contrib/
ifndef WORKDIRPREFIX
WORKDIR?=	$(CURDIR)/work.$(SYSTEM_ID)_$(R_VERSION)
else
WORKDIR?=	$(WORKDIRPREFIX)_$(R_VERSION)
endif

MASTER_SITES+=	$(RMODSITE)/$(CRAN_CATEGORY)/

R_BINARY=	$(R_PREFIX)/bin/R

# unset the R_LIBS directory so modules install into default location
R_LIBS=


# redefine some variables in the format that CRAN packages are laid out as
PKGSUBDIR=	$(DISTNAME)
DISTFILES=	$(DISTNAME)_$(VERSION).tar.gz


ifeq "$(shell test -x $(R_BINARY) || echo 'false')" "false"
$(warning ******************************************)
$(warning Binary $(R_BINARY) as specified)
$(warning by R_PREFIX does not exist or is)
$(warning not executable.)
$(warning ******************************************)
$(error Unable to continue build.)
endif

# Check dependencies and do the r way of configuring things.

# In the next version R_MODULES should be exported from the r
# main distribution makefile so that the modules themselves can
# resolve dependencies and build the version, r requests, of the
# module the depend upon. If there is a dependency upon a module which
# is not listed there should be a warning that we should add the
# module to the R_MODULES. We should also warn that the order is
# incorrect and say that module XXX depends on module YYY and they
# should swap places.

do-configure:
ifdef R_DEPENDS
	$(QUIET) \
	for R_DEP in $(R_DEPENDS) ; do \
		grep -E >/dev/null "^$$R_DEP/" $(R_PREFIX)/.installed_modules || \
		(echo "*** ERROR: Prerequisite module $$R_DEP not installed." && \
		exit 1); \
	done 
endif
# left over from perl version
#	$(QUIET) \
#	cd $(WRKSRC) ; $(CONFIGURE_ENV) $(R_BINARY) Makefile.PL $(R_MAKEOPTS)

# Tell the world that we installed the module. We do not wish to do
# the do-instal% stuff since that also creates directories that we do
# not wish to have. Thus the first two lines are ripped directly from
# gnu.mpkg.mk

do-build:
# no-op
	@:

do-install:
	$(QUIET) \
	$(MODULE_ADD) $(BUILD_DEPENDS); \
        cd $(WRKSRC) && $(SETENV) $(R_BINARY) CMD INSTALL $(CPRT_R_INSTARGS) $(WRKSRC)  && \
	echo "$(DISTNAME)/$(VERSION)/" >> $(R_PREFIX)/.installed_modules

