include ../../../mk/gnu.pre.mk

DISTNAME=       espresso
VERSION=        4.1.2
CATEGORIES=     numerical
HOMEPAGE=       http://www.pwscf.org/
MASTER_SITES=   https://www.pwscf.org/downloads/PWversion/$(VERSION)/
DISTFILE=	$(DISTNAME)-$(VERSION).tar.gz
MAINTAINER=     jtang@tchpc.tcd.ie
GNU_CONFIGURE=  yes

DEPENDS+=       "openmpi/1.4.2 --run-env --build-env"
DEPENDS+=       "scalapack/1.8.0_openmpi_1.4.2 --lib --build-env"
DEPENDS+=	"fftw/3.2.2 --lib --build-env"
DEPENDS+=       "atlas/3.8.3 --lib --build-env"

DESCRIPTION=    "ESPRESSO: opEn-Source Package for Research in Electronic Structure, Simulation, and Optimization"
CONFIGURE_ENV+= BLAS_LIBS="-lf77blas -lcblas -latlas" LAPACK_LIBS="-llapack"
CONFIGURE_ARGS+= --enable-parallel

do-install:
	$(INSTALL) -d $(PROGRAM_PREFIX)/bin
	$(INSTALL) -t $(PROGRAM_PREFIX)/bin $(WRKSRC)/bin/*


include ../../../mk/gnu.post.mk


