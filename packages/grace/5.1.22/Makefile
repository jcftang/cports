include ../../../mk/gnu.pre.mk

DISTNAME=	grace
VERSION=	5.1.22
EXTRAVERSION=	
CATEGORIES=	graphics
HOMEPAGE=	http://plasma-gate.weizmann.ac.il/Grace
MASTER_SITES=	ftp://plasma-gate.weizmann.ac.il/pub/grace/src/stable
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	yes
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

DESCRIPTION=	"Grace is a WYSIWYG 2D plotting tool for the X Window System and M*tif."

DEPENDS+=	"openmotif/2.3.2 --lib --build-env"
DEPENDS+=	"fftw/3.2.2 --lib --build-env"
DEPENDS+=	"freetype/2.4.2 --lib --build-env"
DEPENDS+=	"libjpeg/8b --lib --build-env"
DEPENDS+=	"libpng/1.4.3 --lib --build-env"
DEPENDS+=	"poppler/0.14.1 --lib --build-env"
DEPENDS+=	"xbitmaps/1.1.0 --lib"
DEPENDS+=	"zlib/1.2.5 --lib --build-env"

CONFIGURE_ARGS += --enable-grace-home=$(PROGRAM_PREFIX)

include ../../../mk/gnu.post.mk

