## tarballs are free but require registration/login when downloaded
## the tarballs must be placed in the acml subdir of the cports
## sources tree

include ../../../mk/gnu.pre.mk

DISTNAME=	CASAVA
VERSION=	1.8.1
CATEGORIES=	bio
MASTER_SITES=
MAINTAINER=	paddy@tchpc.tcd.ie
GNU_CONFIGURE=	no
HAS_CONFIGURE=	no
DISTFILES = $(DISTNAME)_v$(VERSION).tar
HAVE_SOFTWARE=  true

EXTRAVERSION=

PKGSUBDIR=	$(DISTNAME)_v$(VERSION)

DEPENDS+=       "cmake/2.8.2 --build-env"
DEPENDS+=	"boost/1_44_0_openmpi_1.4.2 --build-env --lib"
DEPENDS+=	"bzip2/1.0.6 --build-env --lib"
DEPENDS+=	"zlib/1.2.5 --build-env --lib"
DEPENDS+=	"libxml2/2.7.7  --build-env --lib"

DESCRIPTION=    "CASAVA pipeline"

do-configure:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	$(MKDIR) BUILD ;\
	cd BUILD ;\
	BOOST_ROOT=$(PREFIX_boost) ../src/configure --prefix=$(PROGRAM_PREFIX) --with-cmake=$(PREFIX_cmake)/bin/cmake 
	#cmake "-DCMAKE_INSTALL_PREFIX=$(PROGRAM_PREFIX)" \
	#../src

do-build:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	cd BUILD ;\
	$(MAKE)

do-install:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	cd BUILD ;\
	touch opt/samtools-0.1.8/samtools ;\
	$(MAKE) install


include ../../../mk/gnu.post.mk
