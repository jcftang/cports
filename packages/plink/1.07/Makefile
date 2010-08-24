include ../../../mk/gnu.pre.mk

DISTNAME=	plink
VERSION=	1.07
CATEGORIES=	utilities
HOMEPAGE=	http://pngu.mgh.harvard.edu/~purcell/plink
MASTER_SITES=	http://pngu.mgh.harvard.edu/~purcell/plink/dist
MAINTAINER=	jtang@tchpc.tcd.ie
HAS_CONFIGURE=	no
DISTFILES = $(DISTNAME)-$(VERSION)-src.zip

PKGSUBDIR=$(DISTNAME)-$(VERSION)-src

DEPENDS=	"atlas/3.8.3 --lib --build-env"

EXTRAVERSION=

DESCRIPTION=	"PLINK is a free, open-source whole genome association"
DESCRIPTION=    "analysis toolset, designed to perform a range of basic, large-scale"
DESCRIPTION=    "analyses in a computationally efficient manner. "

MAKE_FLAGS+=	FORCE_DYNAMIC=1 WITH_LAPACK=1 LIB_LAPACK="-lgfortran -lf77blas -lcblas -latlas -llapack"

do-install:
	$(INSTALL) -d $(PROGRAM_PREFIX)/bin
	$(INSTALL) $(WRKSRC)/plink $(PROGRAM_PREFIX)/bin/plink
	$(INSTALL) $(WRKSRC)/gPLINK.jar $(PROGRAM_PREFIX)/bin/gPLINK.jar
	$(INSTALL) -d $(PROGRAM_PREFIX)/example
	$(INSTALL) $(WRKSRC)/test.map $(PROGRAM_PREFIX)/example/test.map
	$(INSTALL) $(WRKSRC)/test.ped $(PROGRAM_PREFIX)/example/test.ped

include ../../../mk/gnu.post.mk
