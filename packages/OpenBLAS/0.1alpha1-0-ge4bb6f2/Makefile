include ../../../mk/gnu.pre.mk

DISTNAME=       OpenBLAS
VERSION=        0.1alpha1-0-ge4bb6f2
CATEGORIES=     system
HOMEPAGE=       https://github.com/xianyi/OpenBLAS/
MASTER_SITES=	https://github.com/xianyi/OpenBLAS/tarball/v0.1alpha1
MASTER_SITES+=   http://download.github.com
MAINTAINER=     jtang@tchpc.tcd.ie
DISTFILES=	xianyi-$(DISTNAME)-v$(VERSION).tar.gz
HAS_CONFIGURE=  no

PKGSUBDIR=xianyi-OpenBLAS-31dbda0

DESCRIPTION=    "OpenBLAS is an optimized BLAS library based on GotoBLAS2 1.13 BSD version."

do-build:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	$(MAKE) DESTDIR=$(PROGRAM_PREFIX) all

do-install:
	$(MODULE_ADD) $(BUILD_DEPENDS);		\
	$(MKDIR) $(PROGRAM_PREFIX)/lib;		\
        cd $(WRKSRC); 				\
        cp *.a *.so $(PROGRAM_PREFIX)/lib

include ../../../mk/gnu.post.mk

