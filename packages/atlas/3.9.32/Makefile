include ../../../mk/gnu.pre.mk

DISTNAME=	atlas
VERSION=	3.9.32
CPRT_NETLIB_LAPACK_VERSION= 3.3.0
CATEGORIES=	numerical
HOMEPAGE=	http://math-atlas.sourceforge.net/
MAINTAINER=	darach@tchpc.tcd.ie
PKGFILENAME = $(DISTNAME)$(VERSION)/download
MASTER_SITES = http://www.netlib.org/lapack  http://sourceforge.net/projects/math-atlas/files/Developer%20%28unstable%29/$(VERSION)
EXTRACT_ONLY=atlas$(VERSION).tar.bz2 
HAS_CONFIGURE = no
DISTFILES = lapack-$(CPRT_NETLIB_LAPACK_VERSION).tgz $(DISTNAME)$(VERSION).tar.bz2 

PKGSUBDIR = ATLAS

PATCH_STRIP=		-p1
PATCH_ARGS=		-d $(CURDIR)/work/$(PKGSUBDIR) -N -E $(PATCH_STRIP)

$(info workdir $(CURDIR))

EXTRAVERSION=

DESCRIPTION=	"The ATLAS (Automatically Tuned Linear Algebra Software) project is an ongoing research effort focusing on applying empirical techniques in order to provide portable performance."

#CONFIGURE_ARGS +=

DEPENDS += "gcc/4.2.3 --build-env"

CPRT_COMPILER_CLASS=$(strip \
	$(if \
	$(or \
	$(findstring gnu, $(COMPILERS)), \
	$(findstring intel, $(COMPILERS)) \
	), \
	gnu, \
	intel))

CPRT_ATLAS_INTERFACE_C_COMPILER=$(strip \
	$(if \
	$(or \
	$(findstring gnu, $(COMPILERS)), \
	$(findstring intel, $(COMPILERS)) \
	), \
	gcc, \
	icc))

CPRT_ATLAS_INTERFACE_FORTRAN_COMPILER=$(strip \
	$(if \
	$(or \
	$(findstring gnu, $(COMPILERS)), \
	$(findstring intel, $(COMPILERS)) \
	), \
	gfortran, \
	ifort))

$(info compiler type  $(CPRT_COMPILER_CLASS))
$(info interface C compiler type $(CPRT_ATLAS_INTERFACE_C_COMPILER) )
$(info interface fortran compiler type $(CPRT_ATLAS_INTERFACE_FORTRAN_COMPILER) )

ifndef COMPILERS
COMPILERS?=gnu
endif

do-configure:
	$(MODULE_ADD) $(BUILD_DEPENDS); \
	cd $(WORKDIR); \
	mv $(PKGSUBDIR) ATLAS-$(VERSION)-srcdir; \
	mkdir ATLAS-build-$(SYSTEM_TYPE); \
	cd ATLAS-build-$(SYSTEM_TYPE); \
	gcc -v 2>&1 | grep 'version'; \
	../ATLAS-$(VERSION)-srcdir/configure  --shared --prefix=$(PROGRAM_PREFIX) --with-netlib-lapack-tarfile=$(DISTDIR)/$(DISTNAME)/lapack-$(CPRT_NETLIB_LAPACK_VERSION).tgz 2>&1 | tee $(WORKDIR)/configlog

do-build:
	$(MODULE_ADD) $(BUILD_DEPENDS); \
	cd $(WORKDIR)/ATLAS-build-$(SYSTEM_TYPE); \
	gcc -v 2>&1 | grep 'version'> $(WORKDIR)/alleged_gcc_version; \
	make build 2>&1 | tee $(WORKDIR)/buildlog; \
	make check 2>&1 | tee $(WORKDIR)/checklog; \
	make ptcheck 2>&1 | tee $(WORKDIR)/ptchecklog; \
	make time 2>&1 | tee $(WORKDIR)/timelog;

do-install:
	$(MODULE_ADD) $(BUILD_DEPENDS); \
	cd $(WORKDIR)/ATLAS-build-$(SYSTEM_TYPE); \
	make install

include ../../../mk/gnu.post.mk
