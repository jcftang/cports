include ../../../mk/gnu.pre.mk

DISTNAME=	qtoctave
VERSION=	0.9.1
CATEGORIES=	utilities
HOMEPAGE=	http://qtoctave.wordpress.com/
MASTER_SITES=	http://forja.rediris.es/frs/download.php/1760/
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	yes
DISTFILES = $(DISTNAME)-$(VERSION).tar.bz2

EXTRAVERSION=

DEPENDS+=	"octave/3.2.4 --build-env --lib --run-env"
DEPENDS+=       "qt/4.6.3 --build-env --lib --run-env"
DEPENDS+=       "cmake/2.8.2 --build-env"

DEPENDS+=       "fontconfig/2.8.0 --lib --build-env"
DEPENDS+=       "libjpeg/8b --lib --build-env"
DEPENDS+=       "libpng/1.2.42 --lib --build-env"
DEPENDS+=       "libtiff/3.9.4 --lib --build-env"
DEPENDS+=       "pango/1.28.1 --build-env --lib"
DEPENDS+=       "cairo/1.8.10 --build-env --lib"
DEPENDS+=       "sqlite/3.6.23.1 --build-env --lib"
DEPENDS+=       "freetype/2.4.2 --build-env --lib"
DEPENDS+=       "openssl/0.9.8o --build-env --lib"
DEPENDS+=       "libiconv/1.13 --build-env --lib"
DEPENDS+=       "gettext/0.18.1.1 --build-env --lib"
DEPENDS+=       "zlib/1.2.5 --build-env --lib"
DEPENDS+=       "glib/2.24.1 --build-env --lib"


DESCRIPTION=    "QtOctave is a front-end user interface for the Octave high-level language,"
DESCRIPTION+=    "primarily intended for numerical computations similar to Matlab."
DESCRIPTION+=    "It simplifies the use of Octave for user who are not familiar with the"
DESCRIPTION+=    "original, command line based version of Octave."

do-configure:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	$(MKDIR) BUILD ;\
	cd BUILD ;\
	cmake "-DCMAKE_INSTALL_PREFIX=$(PROGRAM_PREFIX)" \
	../
	cd $(WRKSRC); \
	$(SED) -i s,/opt/qtoctave-0.8.2,$(PROGRAM_PREFIX),g qtoctave/src/configure.h

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
