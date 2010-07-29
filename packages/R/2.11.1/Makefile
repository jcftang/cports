include ../../../mk/gnu.pre.mk

DISTNAME=	R
VERSION=	2.11.1
CATEGORIES=	numerical
HOMEPAGE=	http://www.r-project.org/
MASTER_SITES=	http://ftp.heanet.ie/mirrors/cran.r-project.org/src/base/R-2
GNU_CONFIGURE = yes
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

EXTRAVERSION=

DEPENDS+="atlas/3.8.3 --build-env atlas/3.8.3 --run-env"
#DEPENDS+="openmpi/1.4.2 --build-env openmpi/1.4.2 --run-env" 

DESCRIPTION=  "R is a free software environment for statistical computing and graphics."

CONFIGURE_ARGS +=  --with-blas="-L$(PREFIX_atlas)/lib -lf77blas -latlas"
CONFIGURE_ARGS +=  --with-lapack="-L$(PREFIX_atlas)/lib -llapack -lcblas"

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

R_MODULES+=	outliers rbugs Rmpi

include ../../../mk/prg.R.mk
include ../../../mk/gnu.post.mk


