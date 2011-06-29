include ../../../mk/gnu.pre.mk

DISTNAME=	nifticlib
VERSION=	2.0.0
HOMEPAGE=	http://sourceforge.net/projects/niftilib
MASTER_SITES=	http://sourceforge.net/projects/niftilib/files/nifticlib/nifticlib_2_0_0
MAINTAINER=	jtang@tchpc.tcd.ie
HAS_CONFIGURE=	no

DEPENDS+=	"zlib/1.2.5 --lib --build-env"
DEPENDS+=	"cmake/2.8.3 --build-env"

DESCRIPTION=	"niftilib is a collection of i/o routines for the nifti1 neuroimage data format."

#CONFIGURE_ARGS+= "--enable-minimal"

do-configure:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	$(MKDIR) BUILD ;\
	cd BUILD ;\
	cmake -DBUILD_SHARED_LIBS=ON -DCMAKE_INSTALL_PREFIX=$(PROGRAM_PREFIX) -DNIFTI_INSTALL_INCLUDE_DIR=$(PROGRAM_PREFIX)/include/nifti  ../

do-build:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	cd BUILD ;\
	$(MAKE)

do-install:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	cd BUILD ;\
	$(MAKE) install



include ../../../mk/gnu.post.mk
