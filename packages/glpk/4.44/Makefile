include ../../../mk/gnu.pre.mk

DISTNAME=	glpk
VERSION=	4.44
CATEGORIES=	numerical
MAINTAINER=     darach@tchpc.tcd.ie
HOMEPAGE=       http://www.gnu.org/software/glpk/
MASTER_SITES=   http://ftp.gnu.org/gnu/glpk
GNU_CONFIGURE = yes
#HAS_CONFIGURE = yes
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

EXTRAVERSION=

DEPENDS+="gmp/5.0.1 --lib"
#DEPENDS+="SuiteSparse/3.4.0 --build-env --lib"
#DEPENDS+="fftw/3.2.2_float --build-env --lib"
#DEPENDS+="pcre/8.10 --build-env --lib"
#DEPENDS+="openmpi/1.4.2 --build-env openmpi/1.4.2 --run-env" 

DESCRIPTION=  "The GLPK (GNU Linear Programming Kit) package is intended for solving large-scale linear programming (LP), mixed integer programming (MIP), and other related problems."

CONFIGURE_ARGS += 

#do-configure:
#	$(MODULE_ADD) $(BUILD_DEPENDS); \
#	cd $(WRKSRC); \
#	./configure --prefix=$(PROGRAM_PREFIX) --with-gmp 
#
#do-build:
#	 $(MODULE_ADD) $(BUILD_DEPENDS); \
#        cd $(WRKSRC); \
#	make

do-install:
	 $(MODULE_ADD) $(BUILD_DEPENDS); \
	cd $(WRKSRC); \
	make install; \
	echo $(PROGRAM_PREFIX); \
	$(MKDIR) $(PROGRAM_PREFIX)/include/glpk; \
	ln -s $(PROGRAM_PREFIX)/include/glpk.h $(PROGRAM_PREFIX)/include/glpk/glpk.h

do-test:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	make check 2>&1 | tee testlog;                                                                                                                                  

include ../../../mk/gnu.post.mk


