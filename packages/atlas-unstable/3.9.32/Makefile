include ../../../mk/gnu.pre.mk

DISTNAME=	atlas-unstable
VERSION=	3.9.32
CPRT_NETLIB_LAPACK_VERSION= 3.2.2
CATEGORIES=	numerical
HOMEPAGE=	http://math-atlas.sourceforge.net/
MAINTAINER=	darach@tchpc.tcd.ie
PKGFILENAME = atlas$(VERSION)/download
MASTER_SITES = http://www.netlib.org/lapack  http://sourceforge.net/projects/math-atlas/files/Developer%20%28unstable%29/$(VERSION)
EXTRACT_ONLY=atlas$(VERSION).tar.bz2 
HAS_CONFIGURE = no
DISTFILES = lapack-$(CPRT_NETLIB_LAPACK_VERSION).tgz atlas$(VERSION).tar.bz2 

PKGSUBDIR = ATLAS

CPRT_ATLAS_NUM_THREADS?= -1
# PATCH_STRIP=		-p1
# PATCH_ARGS=		-d $(CURDIR)/work/$(PKGSUBDIR) -N -E $(PATCH_STRIP)

$(info workdir $(CURDIR))

EXTRAVERSION?=

DESCRIPTION=	"The ATLAS (Automatically Tuned Linear Algebra Software) project \
is an ongoing research effort focusing on applying empirical \
techniques in order to provide portable performance."

CPRT_ATLAS_COMPILER_CLASS := nocompiler
CPRT_ATLAS_COMPILER_CLASS:=$(strip $(if $(findstring intel, $(COMPILERS)),intel,$(CPRT_ATLAS_COMPILER_CLASS)))
CPRT_ATLAS_COMPILER_CLASS:=$(strip $(if $(findstring gnu, $(COMPILERS)),gnu,$(CPRT_ATLAS_COMPILER_CLASS)))
CPRT_ATLAS_COMPILER_CLASS:=$(strip $(if $(findstring open, $(COMPILERS)),open64,$(CPRT_ATLAS_COMPILER_CLASS)))

CPRT_ATLAS_INTERFACE_CONFIG_FLAGS?=
ifeq ($(CPRT_ATLAS_COMPILER_CLASS),intel)
CPRT_ATLAS_INTERFACE_CONFIG_FLAGS+=  -C ic icc -F ic '-O3 -fPIC ' 
CPRT_ATLAS_INTERFACE_CONFIG_FLAGS+=  -C if ifort -F if '-O3 -fPIC ' 
endif
ifeq ($(CPRT_ATLAS_COMPILER_CLASS),open64)
CPRT_ATLAS_INTERFACE_CONFIG_FLAGS+=  -C ic opencc -F ic '-O3 -fPIC ' 
CPRT_ATLAS_INTERFACE_CONFIG_FLAGS+=  -C if openf90 -F if '-O3 -fPIC '
endif
$(info interface compiler config flags $(CPRT_ATLAS_INTERFACE_CONFIG_FLAGS))

## defined for benefit of module file generator
DESCRIPTION += " "
DESCRIPTION += "configuration args: --shared -C dk 'gcc -fPIC ' -C sk 'gcc -fPIC '  $(CPRT_ATLAS_INTERFACE_CONFIG_FLAGS)  --prefix=<install dir> --with-netlib-lapack-tarfile=$(DISTDIR)/$(DISTNAME)/lapack-$(CPRT_NETLIB_LAPACK_VERSION).tgz"

do-configure:
	$(MODULE_ADD) $(BUILD_DEPENDS); \
	cd $(WORKDIR); \
	mv $(PKGSUBDIR) ATLAS-$(VERSION)-srcdir; \
	mkdir ATLAS-build-$(SYSTEM_TYPE); \
	cd ATLAS-build-$(SYSTEM_TYPE); \
	../ATLAS-$(VERSION)-srcdir/configure  --shared -C dk 'gcc -fPIC ' -C sk 'gcc -fPIC '  $(CPRT_ATLAS_INTERFACE_CONFIG_FLAGS)  --prefix=$(PROGRAM_PREFIX) --with-netlib-lapack-tarfile=$(DISTDIR)/$(DISTNAME)/lapack-$(CPRT_NETLIB_LAPACK_VERSION).tgz -t $(CPRT_ATLAS_NUM_THREADS) 2>&1 | tee $(WORKDIR)/configlog

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
	make install; \
        cp $(WORKDIR)/buildlog $(PROGRAM_PREFIX); \
        cp $(WORKDIR)/checklog $(WORKDIR)/ptchecklog $(PROGRAM_PREFIX); \
        cp $(WORKDIR)/timelog $(PROGRAM_PREFIX);

include ../../../mk/gnu.post.mk
