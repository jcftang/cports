include ../../../mk/gnu.pre.mk

DISTNAME=	atlas
VERSION=	3.8.3
CATEGORIES=	numerical
HOMEPAGE=	http://math-atlas.sourceforge.net/
MASTER_SITES=	http://heanet.dl.sourceforge.net/project/math-atlas/Stable/3.8.3/
MAINTAINER=	darach@tchpc.tcd.ie
HAS_CONFIGURE = no
DISTFILES = $(DISTNAME)$(VERSION).tar.bz2

EXTRAVERSION=

#DEPENDS+="gcc/4.5.0 --build-env gcc/4.5.0 --run-env"

DESCRIPTION=	"The ATLAS (Automatically Tuned Linear Algebra Software) project is an ongoing research effort focusing on applying empirical techniques in order to provide portable performance."

#CONFIGURE_ARGS +=

do-build:
# gcc/gfortran, default is the gnu compiler
ifeq ("$(COMPILERS)","gnu")
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	gcc --version;                    \
	./preconfig.sh;                   \
	./lapackconfig.sh;                
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd work; mkdir -p build;cd build;    \
	../ATLAS/configure --prefix=$(PROGRAM_PREFIX) -Fa alg -fPIC --with-netlib-lapack=../lapackdir/lapackinst/lapack_LINUX.a; \
	cd build;  \
	make 2>&1 | tee makelog; \
	cd lib; make shared; cd .. \
	make check 2>&1 | tee checklog;  \
	make ptcheck 2>&1 | tee ptchecklog;  \
	make time 2>&1 | tee timelog
endif

# icc/ifort specific
	
ifeq ("$(COMPILERS)","intel11.0")
	$(MODULE_ADD) $(BUILD_DEPENDS) ;\
	icc --version;                    \
	./preconfig.$(COMPILERS).sh;                   \
	./lapackconfig.$(COMPILERS).sh;                
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd work; mkdir -p build;cd build;    \
	../ATLAS/configure --prefix=$(PROGRAM_PREFIX) --with-netlib-lapack=../lapackdir/lapackinst/lapack_LINUX.a -C if ifort -F if '-O2' -C ic icc -F ic '-O2' -Fa al -fPIC ;\
	cd build;  \
	make 2>&1 | tee makelog; \
	cd lib; make shared; cd .. \
	make check 2>&1 | tee checklog;  \
	make ptcheck 2>&1 | tee ptchecklog;  \
	make time 2>&1 | tee timelog

endif

do-install:
	cd work/build; \
	make install; \
	cd lib; \
	cp *.so  $(PROGRAM_PREFIX)/lib

include ../../../mk/gnu.post.mk


