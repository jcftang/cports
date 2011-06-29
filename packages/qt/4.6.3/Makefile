include ../../../mk/gnu.pre.mk

DISTNAME=	qt
VERSION=	4.6.3
CATEGORIES=	graphics
HOMEPAGE=	http://qt.nokia.com/
MASTER_SITES=	ftp://ftp.qt.nokia.com/qt/source/
MAINTAINER=	jtang@tchpc.tcd.ie
HAS_CONFIGURE=	no
DISTFILES = $(DISTNAME)-everywhere-opensource-src-$(VERSION).tar.gz

PKGSUBDIR= $(DISTNAME)-everywhere-opensource-src-$(VERSION)

EXTRAVERSION=

DESCRIPTION=	"Qt is a cross-platform application and UI framework."

DEPENDS+=       "fontconfig/2.8.0 --lib --build-env"
DEPENDS+=       "libjpeg/8b --lib --build-env"
DEPENDS+=       "libpng/1.2.42 --lib --build-env"
DEPENDS+=       "libtiff/3.9.4 --lib --build-env"
DEPENDS+=       "pango/1.28.1 --build-env --lib"
DEPENDS+=       "cairo/1.8.10 --build-env --lib"
DEPENDS+=       "sqlite/3.6.23.1 --build-env --lib"
DEPENDS+=	"freetype/2.4.2 --build-env --lib"
DEPENDS+=	"openssl/1.0.0a --build-env --lib"
DEPENDS+=	"libiconv/1.13 --build-env --lib"
DEPENDS+=	"gettext/0.18.1.1 --build-env --lib"
DEPENDS+=	"zlib/1.2.5 --build-env --lib"
DEPENDS+=	"glib/2.24.1 --build-env --lib"

do-configure:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	(echo y) | ./configure -opensource \
		-prefix $(PROGRAM_PREFIX) \
		-system-sqlite \
		-system-zlib \
		-system-libtiff \
		-system-libpng \
		-system-libjpeg 

include ../../../mk/gnu.post.mk
