include ../../../mk/gnu.pre.mk

DISTNAME=	openbabel
VERSION=	2.2.3
CATEGORIES=	utilities
HOMEPAGE=	http://sourceforge.net/projects/openbabel/
MASTER_SITES=	http://sourceforge.net/projects/openbabel/files/openbabel/$(VERSION)
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

DESCRIPTION=    "Open Babel is a chemical toolbox designed to speak the many languages"
DESCRIPTION+=    "of chemical data. It's an open, collaborative project allowing anyone"
DESCRIPTION+=    "to search, convert, analyze, or store data from molecular modeling,"
DESCRIPTION+=    "chemistry, biochemistry, or related areas"

#do-configure:
#	$(MODULE_ADD) $(BUILD_DEPENDS);   \
#	cd $(WRKSRC); \
#	$(MKDIR) BUILD ;\
#	cd BUILD ;\
#	cmake "-DCMAKE_INSTALL_PREFIX=$(PROGRAM_PREFIX)" \
#	"-DEIGEN2_INCLUDE_DIR=$(PREFIX_eigen)/include" \
#	../
#
#do-build:
#	$(MODULE_ADD) $(BUILD_DEPENDS);   \
#	cd $(WRKSRC); \
#	cd BUILD ;\
#	$(MAKE)
#
#do-install:
#	$(MODULE_ADD) $(BUILD_DEPENDS);   \
#	cd $(WRKSRC); \
#	cd BUILD ;\
#	$(MAKE) install

include ../../../mk/gnu.post.mk
