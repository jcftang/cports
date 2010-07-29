include ../../../mk/gnu.pre.mk

DISTNAME=	gtk+
VERSION=	2.20.1
HOMEPAGE=	http://www.gtk.org/index.php
MASTER_SITES=	http://ftp.gnome.org/pub/gnome/sources/gtk+/2.20
MAINTAINER=	darach@tchpc.tcd.ie
GNU_CONFIGURE=	yes

#Commented out, because it will try to use the db-1.85-compat mode of db,
#which wont work if you have /usr/lib/libdb1.*
DEPENDS+="glib/2.24.1 --build-env"
DEPENDS+="atk/1.30.0 --build-env"
DEPENDS+="pango/1.28.1 --build-env"
DEPENDS+="cairo/1.8.10 --build-env"

DESCRIPTION=	"gtk+"

CONFIGURE_ARGS+=

include ../../../mk/gnu.post.mk
