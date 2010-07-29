include ../../../mk/gnu.pre.mk

DISTNAME=	pango
VERSION=	1.28.1
HOMEPAGE=	http://www.pango.org/
MASTER_SITES=	http://ftp.gnome.org/pub/gnome/sources/pango/1.28
MAINTAINER=	darach@tchpc.tcd.ie
GNU_CONFIGURE=	yes

#Commented out, because it will try to use the db-1.85-compat mode of db,
#which wont work if you have /usr/lib/libdb1.*
DEPENDS+="glib/2.24.1 --build-env"
DEPENDS+="fontconfig/2.8.0 --build-env"
DEPENDS+="cairo/1.8.10 --build-env"

DESCRIPTION=	"pango"

CONFIGURE_ARGS+=

include ../../../mk/gnu.post.mk
