include ../../../mk/gnu.pre.mk

DISTNAME=	cairo
VERSION=	1.8.10
HOMEPAGE=	http://cairographics.org/
MASTER_SITES=	http://cairographics.org/releases
MAINTAINER=	darach@tchpc.tcd.ie
GNU_CONFIGURE=	yes

#Commented out, because it will try to use the db-1.85-compat mode of db,
#which wont work if you have /usr/lib/libdb1.*
DEPENDS+="pixman/0.18.2 --build-env --lib"
DEPENDS+="fontconfig/2.8.0 --build-env --lib"

DESCRIPTION=	"cairo"

CONFIGURE_ARGS+=

include ../../../mk/gnu.post.mk
