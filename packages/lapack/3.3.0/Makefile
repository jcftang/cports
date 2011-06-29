include ../../../mk/gnu.pre.mk

DISTNAME=	lapack
VERSION=	3.3.0
CATEGORIES=	numerical
HOMEPAGE=	http://www.netlib.org/lapack/
MASTER_SITES=	http://www.netlib.org/lapack/
MAINTAINER=	jtang@tchpc.tcd.ie
HAS_CONFIGURE=	no
DISTFILES = 	$(DISTNAME)-$(VERSION).tgz

DEPENDS=	"cmake/2.8.2 --build-env"

DESCRIPTION=	"LAPACK — Linear Algebra PACKage"

CPRT_LAPACK_COMPILER_CLASS := nocompiler
CPRT_LAPACK_COMPILER_CLASS:=$(strip $(if $(findstring intel, $(COMPILERS)),ifort,$(CPRT_LAPACK_COMPILER_CLASS)))
CPRT_LAPACK_COMPILER_CLASS:=$(strip $(if $(findstring gnu, $(COMPILERS)),gfortran,$(CPRT_LAPACK_COMPILER_CLASS)))
CPRT_LAPACK_COMPILER_CLASS:=$(strip $(if $(findstring open, $(COMPILERS)),open64,$(CPRT_LAPACK_COMPILER_CLASS)))

$(info lapack class: $(CPRT_LAPACK_COMPILER_CLASS) )

do-configure:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	$(MKDIR) BUILD ;\
	cd BUILD ;\
	cmake -DCMAKE_INSTALL_PREFIX=$(PROGRAM_PREFIX) \
	../
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	$(MKDIR) BUILD-shared ;\
	cd BUILD-shared ;\
	cmake -DCMAKE_INSTALL_PREFIX=$(PROGRAM_PREFIX) \
	-DBUILD_SHARED_LIBS=on \
	../



do-build:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	cd BUILD ;\
	$(MAKE)
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	cd BUILD-shared ;\
	$(MAKE)


do-install:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	cd BUILD ;\
	$(MAKE) install
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	cd BUILD-shared ;\
	$(MAKE) install

include ../../../mk/gnu.post.mk
