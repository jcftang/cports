include ../../../mk/gnu.pre.mk

DISTNAME=	atlas
VERSION=	3.8.3
## version 3.3.0 has repeat definitions of some functions (spotrf??);
## needs to be sorted out. In meantime revert to fixed older version
CPRT_NETLIB_LAPACK_VERSION= 3.2.2
CATEGORIES=	numerical
HOMEPAGE=	http://math-atlas.sourceforge.net/
MAINTAINER=	darach@tchpc.tcd.ie
PKGFILENAME = $(DISTNAME)$(VERSION)/download
MASTER_SITES = http://www.netlib.org/lapack  http://heanet.dl.sourceforge.net/project/math-atlas/Stable/$(VERSION) http://math-atlas.sourceforge.net/fixes/
EXTRACT_ONLY=atlas$(VERSION).tar.bz2  lapack-$(CPRT_NETLIB_LAPACK_VERSION).tgz
HAS_CONFIGURE = no
DISTFILES = lapack-$(CPRT_NETLIB_LAPACK_VERSION).tgz $(DISTNAME)$(VERSION).tar.bz2 AMD64K10h64SSE3.tgz

PKGSUBDIR = ATLAS

PATCH_STRIP=		-p2
PATCH_ARGS=		-d $(CURDIR)/work/$(PKGSUBDIR) -N -E $(PATCH_STRIP)

EXTRAVERSION=

#DEPENDS+= "gcc/4.2.3 --build-env"

DESCRIPTION=	"The ATLAS (Automatically Tuned Linear Algebra Software) project is an ongoing research effort focusing on applying empirical techniques in order to provide portable performance."

ifndef COMPILERS
COMPILERS?=gnu
endif

CPRT_COMPILER_CLASS=$(strip \
	$(if \
	$(or \
	$(findstring gnu, $(COMPILERS)), \
	$(findstring intel, $(COMPILERS)) \
	), \
	gnu, \
	intel))

$(info compiler type  $(CPRT_COMPILER_CLASS))

CPRT_ATLAS_CONFIG_ARGS =  -Fa alg -fPIC --with-netlib-lapack=../lapack-$(CPRT_NETLIB_LAPACK_VERSION)/lapack_LINUX.a
ifeq ($(CPRT_COMPILER_CLASS),gnu)
CPRT_ATLAS_CONFIG_ARGS +=
endif
ifeq ("$(CPRT_COMPILER_CLASS)","intel")
CPRT_ATLAS_CONFIG_ARGS +=  --cc=icc -C if ifort -F if '-O2 -fPIC' -C ic icc -F ic '-O2 -fPIC'
endif

do-configure:
	$(MODULE_ADD) $(BUILD_DEPENDS); \
	cd $(WORKDIR); \
	mv $(PKGSUBDIR) ATLAS-$(VERSION)-srcdir; \
	cp $(DISTDIR)/$(DISTNAME)/AMD64K10h64SSE3.tgz ATLAS-$(VERSION)-srcdir/CONFIG; \
	mkdir ATLAS-build-$(SYSTEM_TYPE); \
	cd ATLAS-build-$(SYSTEM_TYPE);  \
	../ATLAS-$(VERSION)-srcdir/configure -Fa alg -fPIC --prefix=$HOME/tmp/thisthat; \
	compflags=$$(grep 'F77FLAGS =' Make.inc  | sed -e 's/.* =[ \t]*//'); \
	cd ../lapack-$(CPRT_NETLIB_LAPACK_VERSION); \
	cp INSTALL/make.inc.gfortran ./make.inc.tmp; \
	cat make.inc.tmp | sed -e "s/^OPTS[ \t]*=.*/OPTS    = $$compflags/" | sed -e 's/^NOOPT[ \t]*=.*/NOOPT    = -O0 -fPIC /' > make.inc; \
	rm make.inc.tmp; \
	make lib; \
	cd ..; ls; \
	rm -rf ATLAS-build-$(SYSTEM_TYPE)

do-build:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WORKDIR); \
	mkdir ATLAS-build-$(SYSTEM_TYPE); \
	cd ATLAS-build-$(SYSTEM_TYPE);  \
	../ATLAS-$(VERSION)-srcdir/configure --prefix=$(PROGRAM_PREFIX) $(CPRT_ATLAS_CONFIG_ARGS); \
	make 2>&1 | tee $(WORKDIR)/buildlog; \
	cd lib; make shared; cd ..; \
	make check 2>&1 | tee $(WORKDIR)/checklog;  \
	make ptcheck 2>&1 | tee $(WORKDIR)/ptchecklog;  \
	make time 2>&1 | tee $(WORKDIR)/timelog

do-install:
	cd $(WORKDIR)/ATLAS-build-$(SYSTEM_TYPE); \
	make install; \
	cd lib; \
	cp *.so  $(PROGRAM_PREFIX)/lib

include ../../../mk/gnu.post.mk
