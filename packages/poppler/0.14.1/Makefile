include ../../../mk/gnu.pre.mk

DISTNAME=	poppler
VERSION=	0.14.1
HOMEPAGE=	http://poppler.freedesktop.org/
MASTER_SITES=	http://poppler.freedesktop.org/
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	yes

#Commented out, because it will try to use the db-1.85-compat mode of db,
#which wont work if you have /usr/lib/libdb1.*
DEPENDS+="pixman/0.18.2 --build-env --lib"
DEPENDS+="fontconfig/2.8.0 --build-env --lib"
DEPENDS+="zlib/1.2.5 --build-env --lib"
DEPENDS+="glib/2.24.1 --build-env --lib"
DEPENDS+="curl/7.21.0 --build-env --lib"
DEPENDS+="libpng/1.2.42 --build-env --lib"
DEPENDS+="libjpeg/8b --build-env --lib"

DESCRIPTION=	"Poppler is a PDF rendering library based on the xpdf-3.0 code base."

CONFIGURE_ARGS+= --enable-zlib --enable-libcurl

include ../../../mk/gnu.post.mk
