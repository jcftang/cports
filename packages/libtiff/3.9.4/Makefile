include ../../../mk/gnu.pre.mk

DISTNAME=	libtiff
VERSION=	3.9.4
PKGNAME=	tiff-$(VERSION)
CATEGORIES=	graphics lib
HOMEPAGE=	http://www.libtiff.org/
MASTER_SITES=	http://www.libtiff.org/
MASTER_SITES+=	http://download.osgeo.org/libtiff/
MASTER_SITES+=	ftp://ftp.remotesensing.org/pub/libtiff/
MAINTAINER=	jtang@tchpc.tcd.ie
HAS_CONFIGURE=	yes
GNU_CONFIGURE=	yes

DEPENDS+=	"gawk --build-env"
DEPENDS+=	"libjpeg --lib --build-env"
DEPENDS+=	"zlib --lib"

LINK_PATHS+=	$(PROGRAM_PREFIX)/lib

DESCRIPTION=	"This software provides support for the Tag Image File Format"
DESCRIPTION+=	"(TIFF), a widely used format for storing image data."
DESCRIPTION+=	"Included in this software distribution is a library, libtiff,"
DESCRIPTION+=	"for reading and writing TIFF, a small collection of tools for"
DESCRIPTION+=	"doing simple manipulations of TIFF images on UNIX systems,"
DESCRIPTION+=	"and documentation on the library and tools."

# Libtiff's own install target do strange things with shared libs
#do-install:	do-instal%
#	for lib in $(WRKSRC)/libtiff/libtiff.* ; do \
#	$(INSTALL) -m 755 $$lib $(PROGRAM_PREFIX)/lib; done

include ../../../mk/gnu.post.mk
