include ../../../mk/gnu.pre.mk

DISTNAME=	fontconfig
VERSION=	2.8.0
HOMEPAGE=	http://www.fontconfig.org/
MASTER_SITES=	http://www.fontconfig.org/release
MAINTAINER=	darach@tchpc.tcd.ie
GNU_CONFIGURE=	yes

#Commented out, because it will try to use the db-1.85-compat mode of db,
#which wont work if you have /usr/lib/libdb1.*
DEPENDS+=	"freetype/2.4.2 --lib --build-env"
DEPENDS+=	"libxml2/2.7.7 --lib --build-env"
DEPENDS+=	"zlib/1.2.5 --lib --build-env"

DESCRIPTION=	"Fontconfig is a library for font customization and configuration."

CONFIGURE_ARGS+=

include ../../../mk/gnu.post.mk
