include ../../../mk/gnu.pre.mk

DISTNAME=       gotoblas2
EXTRAVERSION=
VERSION=        1.13_bsd
PKGFILENAME=    GotoBLAS2-$(VERSION)
PKGSUBDIR=      GotoBLAS2
CATEGORIES=     test
HOMEPAGE=       http://www.tacc.utexas.edu/tacc-projects/gotoblas2/
MASTER_SITES=   http://www.tacc.utexas.edu/fileadmin/images/
MAINTAINER=     darach@tchpc.tcd.ie
GNU_CONFIGURE=  no
CONFIGURE_ARGS +=  $(OPT)
DESCRIPTION=    "Optimised BLAS.  Currently not in development.  Moved to BSD license in 2010"

do-configure:
	echo "configure dummy"

do-build:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	make

do-install:
	$(MKDIR) $(PROGRAM_PREFIX)/lib;
	cd $(WRKSRC); \
	cp *.a *.so $(PROGRAM_PREFIX)/lib


include ../../../mk/gnu.post.mk



