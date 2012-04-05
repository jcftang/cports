include ../../../mk/gnu.pre.mk

DISTNAME=	R
VERSION=	2.14.2
CATEGORIES=	numerical
HOMEPAGE=	http://www.r-project.org/
MASTER_SITES=	http://ftp.heanet.ie/mirrors/cran.r-project.org/src/base/R-2
GNU_CONFIGURE = yes
MAINTAINER=	darach@tchpc.tcd.ie
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

EXTRAVERSION?=

CPRT_R_BLAS?=$(CPRT_BLAS)
#CPRT_R_BLAS?=atlas

## some R tests fail with acml 4-4-0
ifeq ("$(CPRT_R_BLAS)","acml")
$(info install with acml BLAS)
DEPENDS+="acml-smp/4-4-0 --lib --build-env --run-env"
CONFIGURE_ARGS +=  --with-blas="-L$(PREFIX_acml-smp)/lib -lacml_mp"
CONFIGURE_ARGS +=  --with-lapack="-L$(PREFIX_acml-smp)/lib -lacml_mp"
endif

ifeq ("$(CPRT_R_BLAS)","atlas")
$(info install with atlas BLAS)
DEPENDS+="atlas/3.8.4 --lib --build-env"
CONFIGURE_ARGS +=  --with-blas-lapack-dir=$(PREFIX_atlas)
CONFIGURE_ARGS +=  --with-blas="-L$(PREFIX_atlas)/lib -lptf77blas -lpthread -latlas"
CONFIGURE_ARGS +=  --with-lapack="-L$(PREFIX_atlas)/lib -llapack -lptcblas"
endif

ifeq ("$(CPRT_R_BLAS)","mkl")
$(info install with mkl BLAS)
#DEPENDS+="l_mkl_p/10.2.2.025 --lib --build-env"
DEPENDS+="l_mkl/10.3.9.293 --lib --build-env --run-env"
CONFIGURE_ARGS +=  LDFLAGS="-L$(PREFIX_l_mkl)/mkl/lib/intel64"  --with-blas="-L$(PREFIX_l_mkl)/mkl/lib/intel64 -lmkl_gf_lp64 -lmkl_sequential -lmkl_lapack95_lp64 -lmkl_core"
CONFIGURE_ARGS +=  --with-lapack
endif

DEPENDS+="openmpi/1.4.4 --build-env openmpi/1.4.4 --run-env"
DEPENDS+="ncurses/5.9 --lib --build-env"
DEPENDS+="readline/6.1 --lib --build-env"
DEPENDS+="pcre/8.20 --lib --build-env"
DEPENDS+="zlib/1.2.6 --lib --build-env"
DEPENDS+="bzip2/1.0.6 --lib --build-env"
DEPENDS+="libpng/1.5.10 --lib --build-env"
DEPENDS+="libjpeg/8b --lib --build-env"
DEPENDS+="libtiff/3.9.4 --lib --build-env"
DEPENDS+="libiconv/1.13 --lib --build-env"
DEPENDS+="gettext/0.18.1.1 --lib --build-env"
DEPENDS+="cairo/1.8.10 --lib --build-env"

DESCRIPTION=  "R is a free software environment for statistical computing and graphics."

#do-build:
#	$(MODULE_ADD) $(BUILD_DEPENDS);   \
#	cd $(WRKSRC); \
#	make; \

do-test:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	make check 2>&1 | tee testlog;

#do-install:
#	$(MODULE_ADD) $(BUILD_DEPENDS);  \
#	cd $(WRKSRC); \
#       make install

#R_MODULES+=	outliers rbugs Rmpi
#R_MODULES+=	outliers rbugs rlecuyer Rmpi snow snowfall 

include ../../../mk/prg.R.mk
include ../../../mk/gnu.post.mk


