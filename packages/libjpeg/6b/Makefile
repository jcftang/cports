# $Id: Makefile,v 1.7 2002/02/06 17:07:17 eskil Exp $

include ../../../mk/gnu.pre.mk

DISTNAME=       libjpeg
PKGNAME=	jpeg-6b
VERSION= 	6b
CATEGORIES=	graphics lib
HOMEPAGE=	http://www.ijg.org/
MASTER_SITES=	ftp://ftp.uni-leipzig.de/pub/linux/ftp:robot.informatik.uni-leipzig.de/Sources/System/Libs/
MASTER_SITES+=	ftp://ftp.uu.net/graphics/jpeg/
DISTFILES=	jpegsrc.v6b.tar.gz
MAINTAINER=	mpkg@e.kth.se
GNU_CONFIGURE=	yes
USE_LIBTOOL=	yes

INSTALL_TARGET=	install install-lib install-headers  

PRECREATE_DIRS=	bin man/man1 include lib

CONFIGURE_ARGS=	--enable-shared --enable-static

ifneq (,$(findstring osf,$(SYSTEM_TYPE_OS)))
CONFIGURE_ENV+=	CC="cc -std1 -w1"
else
#DEPENDS+=	"gcc --build-env"
endif

DESCRIPTION=	"This package contains C software to implement JPEG image"
DESCRIPTION+=	"compression and decompression. JPEG is a standardized"
DESCRIPTION+=	"compression method for full-color and gray-scale images."

include ../../../mk/gnu.post.mk
