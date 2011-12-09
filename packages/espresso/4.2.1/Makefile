include ../../../mk/gnu.pre.mk

DISTNAME=       espresso
VERSION=        4.2.1
CATEGORIES=     numerical
HOMEPAGE=       http://www.pwscf.org/
MASTER_SITES=   http://qe-forge.org/frs/download.php/114/espresso-4.2.1.tar.gz
MAINTAINER=     jtang@tchpc.tcd.ie
GNU_CONFIGURE=  yes

DEPENDS+=       "openmpi/1.4.3 --run-env --build-env"
DEPENDS+=       "scalapack/1.8.0_openmpi_1.4.3 --lib --build-env"
DEPENDS+=	"fftw/3.2.2 --lib --build-env"
DEPENDS+=	"atlas/3.8.3 --lib --build-env"


DESCRIPTION=    "ESPRESSO: opEn-Source Package for Research in Electronic Structure, Simulation, and Optimization"

CONFIGURE_ENV+=	BLAS_LIBS="-lf77blas -lcblas -latlas" LAPACK_LIBS="-llapack"
#MAKE_FLAGS+= 	DFLAGS="-D__GFORTRAN -D__STD_F95 -D__FFTW3 -D__MPI -D__PARA -DEXX"

do-install:
	$(INSTALL) -d $(PROGRAM_PREFIX)/bin
	$(INSTALL) -t $(PROGRAM_PREFIX)/bin $(WRKSRC)/bin/*

include ../../../mk/gnu.post.mk

