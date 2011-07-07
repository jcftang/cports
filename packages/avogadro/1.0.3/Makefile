include ../../../mk/gnu.pre.mk

DISTNAME=	avogadro
VERSION=	1.0.3
CATEGORIES=	utilities
HOMEPAGE=	http://sourceforge.net/projects/avogadro/
MASTER_SITES=	http://sourceforge.net/projects/avogadro/files/avogadro/$(VERSION)
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	no
HAS_CONFIGURE=	no
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

EXTRAVERSION=

DEPENDS+=	"cmake/2.8.2 --build-env"
DEPENDS+=	"libxml2/2.7.7 --build-env --lib"
DEPENDS+=	"eigen/2.0.16 --build-env --lib"
DEPENDS+=	"Python/2.6.5 --build-env --lib --run-env"
DEPENDS+=	"zlib/1.2.5 --build-env --lib"
DEPENDS+=	"openbabel/2.2.3 --build-env --run-env"
DEPENDS+=	"qt/4.6.3 --build-env --lib --run-env"
DEPENDS+=	"fontconfig/2.8.0 --build-env --lib"

DESCRIPTION=    "Avogadro is an advanced molecular editor designed for cross-platform"
DESCRIPTION+=    "use in computational chemistry, molecular modeling, bioinformatics,"
DESCRIPTION+=    "materials science and related areas. It offers a flexible rendering"
DESCRIPTION+=    "framework and a powerful plugin architecture."

do-configure:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	$(MKDIR) BUILD ;\
	cd BUILD ;\
	cmake "-DCMAKE_INSTALL_PREFIX=$(PROGRAM_PREFIX)" \
	"-DEIGEN2_INCLUDE_DIR=$(PREFIX_eigen)/include/eigen2" \
	../

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
