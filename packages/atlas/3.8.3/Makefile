include ../../../mk/gnu.pre.mk

DISTNAME=	atlas
VERSION=	3.8.3
CATEGORIES=	numerical
HOMEPAGE=	http://math-atlas.sourceforge.net/
MASTER_SITES=	http://heanet.dl.sourceforge.net/project/math-atlas/Stable/3.8.3/   http://www.netlib.org/lapack/
MAINTAINER=	darach@tchpc.tcd.ie
HAS_CONFIGURE = no
DISTFILES = $(DISTNAME)$(VERSION).tar.bz2 lapack.tgz

EXTRAVERSION=

#DEPENDS+="gcc/4.5.0 --build-env gcc/4.5.0 --run-env"

DESCRIPTION=	"The ATLAS (Automatically Tuned Linear Algebra Software) project is an ongoing research effort focusing on applying empirical techniques in order to provide portable performance."

#CONFIGURE_ARGS +=

ifndef COMPILERS
COMPILERS?=gnu
endif

do-build:
# gcc/gfortran, default is the gnu compiler
ifeq ($(COMPILERS),gnu)
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	gcc --version;                    \
	./preconfig.sh;                   \
	cd $(WORKDIR);                    \
	optflags=`cat compflags`; rm compflags; \
	mkdir lapackdir;  \
	cd lapackdir; \
	cp $(_DISTDIR)/lapack.tgz .; \
	tar zxvf lapack.tgz; \
	lapv=`find . -maxdepth 1 -type d -printf '%f\n' | grep lapack | sed -e 's/^lapack-//'`; \
	if [[ $$lapv ]]; \
	then \
	mv lapack-$$lapv lapackinst; \
	else  \
	    exit 1; \
	fi;  \
	cd lapackinst; \
	cp INSTALL/make.inc.gfortran ./make.inc.tmp; \
	cat make.inc.tmp | sed -e "s/^OPTS[ \t]*=.*/OPTS    = $$optflags/" | sed -e 's/^NOOPT[ \t]*=.*/NOOPT    = -O0 -fPIC /' > make.inc; \
	make lib;
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd work; mkdir -p build;cd build;    \
	../ATLAS/configure --prefix=$(PROGRAM_PREFIX) -Fa alg -fPIC --with-netlib-lapack=../lapackdir/lapackinst/lapack_LINUX.a; \
	cd build;  \
	make 2>&1 | tee makelog; \
	cd lib; make shared; cd ..; \
	make check 2>&1 | tee $(WORKDIR)/checklog;  \
	make ptcheck 2>&1 | tee $(WORKDIR)/ptchecklog;  \
	make time 2>&1 | tee $(WORKDIR)/timelog
endif
ifeq ($(COMPILERS),gnu4.5.0)
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	gcc --version;                    \
	./preconfig.sh;                   \
	./lapackconfig.sh;                
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd work; mkdir -p build;cd build;    \
	../ATLAS/configure --prefix=$(PROGRAM_PREFIX) -Fa alg -fPIC --with-netlib-lapack=../lapackdir/lapackinst/lapack_LINUX.a; \
	cd build;  \
	make 2>&1 | tee makelog; \
	cd lib; make shared; cd ..; \
	make check 2>&1 | tee checklog;  \
	make ptcheck 2>&1 | tee ptchecklog;  \
	make time 2>&1 | tee timelog
endif
ifeq ($(COMPILERS),gnu4.5.1)
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	gcc --version;                    \
	./preconfig.sh;                   \
	./lapackconfig.sh;                
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd work; mkdir -p build;cd build;    \
	../ATLAS/configure --prefix=$(PROGRAM_PREFIX) -Fa alg -fPIC --with-netlib-lapack=../lapackdir/lapackinst/lapack_LINUX.a; \
	cd build;  \
	make 2>&1 | tee makelog; \
	cd lib; make shared; cd ..; \
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
	../ATLAS/configure --prefix=$(PROGRAM_PREFIX) --with-netlib-lapack=../lapackdir/lapackinst/lapack_LINUX.a --cc=icc -C if ifort -F if '-O2 -fPIC' -C ic icc -F ic '-O2 -fPIC' -Fa alg -fPIC ;\
	cd build;  \
	make 2>&1 | tee makelog; \
	cd lib; make shared; cd ..; \
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
