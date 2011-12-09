include ../../../mk/gnu.pre.mk

DISTNAME=	octave
VERSION=	3.2.4
CATEGORIES=	numerical
MAINTAINER=     darach@tchpc.tcd.ie
HOMEPAGE=       http://www.gnu.org/software/octave/	
MASTER_SITES=   http://ftp.octave.org/pub/gnu/octave/
GNU_CONFIGURE = yes
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

EXTRAVERSION=

DO_RUN_TESTS=yes

DEPENDS+="atlas/3.8.3 --lib"
DEPENDS+="SuiteSparse/3.4.0 --build-env --lib"
#DEPENDS+="glpk/4.44 --build-env --lib"
DEPENDS+="hdf5/1.8.5-patch1 --build-env --lib"
DEPENDS+="fftw/3.2.2 --build-env --lib"
DEPENDS+="fftw/3.2.2_float --build-env --lib"
DEPENDS+="pcre/8.10 --build-env --lib"
#DEPENDS+="openmpi/1.4.2 --build-env openmpi/1.4.2 --run-env" 
DEPENDS+="gnuplot/4.4.0 --build-env --run-env"
DEPENDS+="ncurses/5.7 --build-env --lib"
DEPENDS+="readline/6.1 --build-env --lib"
DEPENDS+="texinfo/4.13 --build-env"

DESCRIPTION=  "GNU Octave is a high-level language, primarily intended for numerical computations."

CONFIGURE_ARGS += --enable-shared --enable-static
CONFIGURE_ARGS += --with-blas=$(PREFIX_atlas)/lib/libf77blas.a --with-lapack=$(PREFIX_atlas)/lib/liblapack.a
CONFIGURE_ARGS += --with-atlas=yes

CPPFLAGS+= -I$(PREFIX_SuiteSparse)/include/suitesparse 
LDFLAGS += -lmetis 

include ../../../mk/gnu.post.mk


