##
## WARNING: 
##
## If you decide to change version on this _make sure_ that the patch
## in the patches dir is still valid.  This patch puts placeholder
## variables of the form @@FOO@@ into UFconfig.mk; These are sed'd in
## this makefile.  The insertion of placeholders is done using the
## patch; so the patch needs to be correct
##

include ../../../mk/gnu.pre.mk

DISTNAME=	SuiteSparse
VERSION=	3.4.0
METISNAME=	metis
METISVERSION=	4.0
CATEGORIES=	numerical
MAINTAINER=     darach@tchpc.tcd.ie
HOMEPAGE=       http://www.cise.ufl.edu/research/sparse/SuiteSparse/
MASTER_SITES=   http://www.cise.ufl.edu/research/sparse/SuiteSparse/  http://glaros.dtc.umn.edu/gkhome/fetch/sw/metis/
GNU_CONFIGURE = no
HAS_CONFIGURE = no
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

PKGSUBDIR = SuiteSparse

PATCH_STRIP=		-p1
PATCH_ARGS=		-d $(CURDIR)/work/SuiteSparse -N -s -E $(PATCH_STRIP)

EXTRAVERSION=

METISDIR= $(METISNAME)-$(METISVERSION)
DISTFILES += $(METISDIR).tar.gz

DEPENDS+="atlas/3.8.3 --build-env --lib"

DESCRIPTION=  "SuiteSparse is a single archive that contains a collection of sparse matrix packages authored/co-authored by Tim Davis of University of Florida"

do-configure:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(CURDIR)/work/SuiteSparse; \
	cd UFconfig; \
	cat UFconfig.mk |  $(SED) -e 's|\@\@CCOMPILER\@\@|gcc|' -e 's|\@\@CPPCOMPILER\@\@|g++|' \
	 -e 's|\@\@BLASFLAGS\@\@|-L$(PREFIX_atlas)lib -lblas -lcblas -latlas -lgfortran -lgfortranbegin|' \
	 -e 's|\@\@LAPACKFLAGS\@\@|-L$(PREFIX_atlas)/lib -llapack -latlas|' \
	 -e 's|\@\@CFLAGS\@\@|-O3 -fexceptions -fPIC|' -e 's|\@\@CXXFLAGS\@\@|-O3 -fexceptions -fPIC|' > ufconf.tmp.out; \
	mv ufconf.tmp.out  UFconfig.mk; \
	cd $(CURDIR)/work/SuiteSparse; \
	mv $(CURDIR)/work/$(METISDIR) .; \
	cat $(CURDIR)/metis-makefile.in |  $(SED) -e 's|\@\@CCOMPILER\@\@|gcc|' | \
	 $(SED) -e 's|\@\@OPTFLAGS\@\@| -O3 -fPIC |' > $(METISDIR)/Makefile.in;

do-build:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(CURDIR)/work/SuiteSparse/$(METISDIR) .; \
	make; \
	cd $(CURDIR)/work/SuiteSparse; \
	make 2>&1 | tee makelog;

do-install:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	$(MKDIR) $(PROGRAM_PREFIX)/lib; \
	$(MKDIR) $(PROGRAM_PREFIX)/include/suitesparse; \
	cd $(WRKSRC); \
	pwd; \
	install -m 755 -t $(PROGRAM_PREFIX)/lib $(shell cd $(WRKSRC);find . -name '*.a'); \
	install -m 755 $(METISDIR)/libmetis.a $(PROGRAM_PREFIX)/lib; \
 	install -m 755 ./UFconfig/UFconfig.h $(PROGRAM_PREFIX)/include/suitesparse; \
 	install -m 755 ./UFconfig/xerbla/xerbla.h $(PROGRAM_PREFIX)/include/suitesparse; \
	install -m 755 -t $(PROGRAM_PREFIX)/include/suitesparse $(shell cd $(WRKSRC);find . -name '*.h'|grep -v '/cs.h' | grep Include); \
 	install -m 755 ./CXSparse/Include/cs.h $(PROGRAM_PREFIX)/include/suitesparse; \
	install -m 755 ./UFconfig/UFconfig.h $(PROGRAM_PREFIX)/include/suitesparse;

do-install-info:
	echo "noop"

include ../../../mk/gnu.post.mk
