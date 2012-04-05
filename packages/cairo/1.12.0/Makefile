include ../../../mk/gnu.pre.mk

DISTNAME=	cairo
VERSION=	1.12.0
HOMEPAGE=	http://cairographics.org/
MASTER_SITES=	http://cairographics.org/releases
MAINTAINER=	darach@tchpc.tcd.ie
GNU_CONFIGURE=	yes

DEPENDS+="pixman/0.18.2 --build-env --lib"
DEPENDS+="fontconfig/2.8.0 --build-env --lib"
DEPENDS+="poppler/0.14.1 --build-env --lib"
DEPENDS+="libpng/1.2.42 --build-env --lib"
DEPENDS+="freetype/2.4.2 --build-env --lib"
DEPENDS+="zlib/1.2.5 --build-env --lib"

DESCRIPTION=	"cairo"

CONFIGURE_ARGS+=

include ../../../mk/gnu.post.mk
