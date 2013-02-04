include ../../../mk/gnu.pre.mk

DISTNAME=       OpenBLAS
VERSION=        0.2.5
CATEGORIES=     system
HOMEPAGE=       https://github.com/xianyi/OpenBLAS/
MASTER_SITES+=   http://github.com/xianyi/OpenBLAS/tarball/v$(VERSION)/
MAINTAINER=     jtang@tchpc.tcd.ie
DISTFILES=	xianyi-$(DISTNAME)-v$(VERSION).tar.gz
HAS_CONFIGURE=  no
CPRT_OPENBLAS_GIT_SHORTVERSION=93dd133

PKGSUBDIR=xianyi-$(DISTNAME)-$(CPRT_OPENBLAS_GIT_SHORTVERSION)

CPRT_OPENBLAS_ARCH_TARGET?=
CPRT_OPENBLAS_DEBUG?=
CPRT_OPENBLAS_BINARY?=64

CPRT_OPENBLAS_MAKE_ARGS=

## PROGRAM_PREFIX is defined using PREFIX, so there were recursion
## problems with make install PREFIX=$PROGRAM_PREFIX) below
CPRT_OPENBAS_DESTDIR = $(PROGRAM_PREFIX)

CPRT_OPENBLAS_MAKE_ARGS+= BINARY=$(CPRT_OPENBLAS_BINARY) 

ifneq ($(CPRT_OPENBLAS_ARCH_TARGET),)
CPRT_OPENBLAS_MAKE_ARGS+= TARGET=$(CPRT_OPENBLAS_ARCH_TARGET) 
endif

ifeq ("$(CPRT_OPENBLAS_DEBUG)","1")
CPRT_OPENBLAS_MAKE_ARGS+= DEBUG=1 
endif

DESCRIPTION=    "OpenBLAS is an optimized BLAS library based on GotoBLAS2 1.13 BSD version."

## insert PREFIX into Makefile.rule because passing PREFIX on command
## line in make install below causes make recursion problems
do-configure:
	cd $(WRKSRC); \
	$(SED) -i -e "s,^#[ \t]*PREFIX.*=.*,PREFIX=$(PROGRAM_PREFIX)," Makefile.rule

do-build:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	$(MAKE) $(CPRT_OPENBLAS_MAKE_ARGS)

do-install:
	$(MODULE_ADD) $(BUILD_DEPENDS);		\
	cd $(WRKSRC); \
	pwd; \
	echo "prefix: $(PREFIX)"; \
	echo "program prefix: $(PROGRAM_PREFIX)"; \
	make  install PREFIX=$(CPRT_OPENBAS_DESTDIR)

include ../../../mk/gnu.post.mk

