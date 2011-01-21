include ../../../mk/gnu.pre.mk

DISTNAME=	pgplot
VERSION=	5.2
CATEGORIES=	development
HOMEPAGE=	http://www.astro.caltech.edu/~tjp/pgplot/
MASTER_SITES=	ftp://ftp.astro.caltech.edu/pub/pgplot/
MAINTAINER=	jtang@tchpc.tcd.ie
HAS_CONFIGURE=	no
DISTFILES = $(DISTNAME)$(VERSION).tar.gz

PKGSUBDIR=	$(DISTNAME)
MAKEFILE=	makefile

DESCRIPTION=	"The PGPLOT Graphics Subroutine Library is a Fortran- or C-callable, device-independent graphics package for making simple scientific graphs."

do-configure:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
        cd $(WRKSRC); \
	$(INSTALL) -d $(PROGRAM_PREFIX)/lib ;\
	$(INSTALL) -d $(PROGRAM_PREFIX)/include ;\
	tar -cpf - . | (cd $(PROGRAM_PREFIX)/ && tar -xpf - ) ;\
	cd $(PROGRAM_PREFIX) ;\
	$(PROGRAM_PREFIX)/makemake $(PROGRAM_PREFIX) linux g77_gcc ;\
	$(SED) -i 's,FCOMPL=g77,FCOMPL=gfortran,g' $(PROGRAM_PREFIX)/makefile ;\
	$(SED) -i 's,FFLAGC=-u -Wall -fPIC -O,FFLAGC=-ff2c -ffixed-form -ffixed-line-length-none -u -Wall -fPIC -O,g' $(PROGRAM_PREFIX)/makefile

do-build:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(PROGRAM_PREFIX) ;\
	$(MAKE) clean ;\
	$(MAKE) ;\
	$(MAKE) cpg

do-install:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(PROGRAM_PREFIX) ;\
	$(LN) -f $(PROGRAM_PREFIX)/libpgplot.a $(PROGRAM_PREFIX)/lib/ ;\
	$(LN) -f $(PROGRAM_PREFIX)/libpgplot.so $(PROGRAM_PREFIX)/lib/ ;\
	$(LN) -f $(PROGRAM_PREFIX)/libcpgplot.a $(PROGRAM_PREFIX)/lib/ ;\
	$(LN) -f $(PROGRAM_PREFIX)/cpgplot.h $(PROGRAM_PREFIX)/include/

include ../../../mk/gnu.post.mk
