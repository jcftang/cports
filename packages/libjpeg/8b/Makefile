include ../../../mk/gnu.pre.mk

DISTNAME=       libjpeg
PKGNAME=	jpeg-8b
VERSION= 	8b
CATEGORIES=	graphics lib
HOMEPAGE=	http://www.ijg.org/
MASTER_SITES=	http://www.ijg.org/files/
DISTFILES=	jpegsrc.v8b.tar.gz
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	yes
USE_LIBTOOL=	yes

PRECREATE_DIRS=	bin man/man1 include lib

CONFIGURE_ARGS=	--enable-shared --enable-static

DESCRIPTION=	"This package contains C software to implement JPEG image"
DESCRIPTION+=	"compression and decompression. JPEG is a standardized"
DESCRIPTION+=	"compression method for full-color and gray-scale images."

include ../../../mk/gnu.post.mk
