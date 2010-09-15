include ../../../mk/gnu.pre.mk

DISTNAME=	octave
VERSION=	3.2.4
CATEGORIES=	numerical
MAINTAINER=     darach@tchpc.tcd.ie
HOMEPAGE=       http://www.gnu.org/software/octave/	
MASTER_SITES=   ftp://ftp.octave.org/pub/octave
GNU_CONFIGURE = yes
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

EXTRAVERSION=

DEPENDS+="atlas/3.8.3 --lib"
DEPENDS+="SuiteSparse/3.4.0 --build-env --lib"
#DEPENDS+="glpk/4.44 --build-env --lib"
DEPENDS+="hdf5/1.8.5-patch1 --build-env --lib"
DEPENDS+="fftw/3.2.2 --build-env --lib"
DEPENDS+="fftw/3.2.2_float --build-env --lib"
DEPENDS+="pcre/8.10 --build-env --lib"
#DEPENDS+="openmpi/1.4.2 --build-env openmpi/1.4.2 --run-env" 

DESCRIPTION=  "GNU Octave is a high-level language, primarily intended for numerical computations."

CONFIGURE_ARGS += --enable-shared --enable-static
CONFIGURE_ARGS += --with-blas=$(PREFIX_atlas)/lib/libf77blas.a --with-lapack=$(PREFIX_atlas)/lib/liblapack.a
CONFIGURE_ARGS += --with-atlas=yes

CPPFLAGS+= -I$(PREFIX_SuiteSparse)/include/suitesparse 
LDFLAGS += -lmetis 

do-test:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	make check 2>&1 | tee testlog;                                                                                                                                  

include ../../../mk/gnu.post.mk


