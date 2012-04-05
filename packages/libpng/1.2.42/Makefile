include ../../../mk/gnu.pre.mk

DISTNAME=	libpng
VERSION=	1.2.42
CATEGORIES=	graphics lib
HOMEPAGE=	http://www.libpng.org/pub/png/libpng.html
#MASTER_SITES=	http://download.sourceforge.net/libpng12/
MASTER_SITES=   http://heanet.dl.sourceforge.net/project/libpng/libpng12/$(VERSION)/
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	yes
USE_LIBTOOL=	yes

# Should work for all platforms with gcc and shared libs with sonames

DEPENDS+=	"zlib/1.2.5 --lib"

DESCRIPTION=	"libpng is the official PNG reference library. It supports"
DESCRIPTION+=	"almost all PNG features, is extensible, and has been"
DESCRIPTION+=	"extensively tested for over five years."

include ../../../mk/gnu.post.mk
