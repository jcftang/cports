include ../../../mk/gnu.pre.mk

DISTNAME=	R
VERSION=	2.14.0
CATEGORIES=	numerical
HOMEPAGE=	http://www.r-project.org/
MASTER_SITES=	http://ftp.heanet.ie/mirrors/cran.r-project.org/src/base/R-2
GNU_CONFIGURE = yes
MAINTAINER=	darach@tchpc.tcd.ie
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

EXTRAVERSION?=

DEPENDS+="atlas/3.8.3 --lib"
DEPENDS+="openmpi/1.4.4 --build-env openmpi/1.4.4 --run-env"
DEPENDS+="ncurses/5.7 --lib --build-env"
DEPENDS+="readline/6.1 --lib --build-env"
DEPENDS+="pcre/8.12 --lib --build-env"
DEPENDS+="zlib/1.2.5 --lib --build-env"
DEPENDS+="bzip2/1.0.5 --lib --build-env"
DEPENDS+="libpng/1.5.6 --lib --build-env"
DEPENDS+="libjpeg/8b --lib --build-env"
DEPENDS+="libtiff/3.9.4 --lib --build-env"
DEPENDS+="libiconv/1.13 --lib --build-env"
DEPENDS+="gettext/0.18.1.1 --lib --build-env"

DESCRIPTION=  "R is a free software environment for statistical computing and graphics."

CONFIGURE_ARGS +=  --with-blas="-L$(PREFIX_atlas)/lib -lptf77blas -lpthread -latlas"
CONFIGURE_ARGS +=  --with-lapack="-L$(PREFIX_atlas)/lib -llapack -lptcblas"

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
R_MODULES+=	outliers rbugs rlecuyer Rmpi snow snowfall haplo.stats

include ../../../mk/prg.R.mk
include ../../../mk/gnu.post.mk


