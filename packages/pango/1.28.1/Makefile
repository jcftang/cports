include ../../../mk/gnu.pre.mk

DISTNAME=	pango
VERSION=	1.28.1
HOMEPAGE=	http://www.pango.org/
MASTER_SITES=	http://ftp.gnome.org/pub/gnome/sources/pango/1.28
MAINTAINER=	darach@tchpc.tcd.ie
GNU_CONFIGURE=	yes

DEPENDS+="glib/2.24.1 --build-env --lib"
DEPENDS+="fontconfig/2.8.0 --build-env --lib"
DEPENDS+="pixman/0.18.2 --build-env --lib"
DEPENDS+="cairo/1.8.10  --build-env --lib"
DEPENDS+="freetype/2.4.2 --build-env --lib"
DEPENDS+="poppler/0.14.1 --build-env --lib"
DEPENDS+="libpng/1.2.42 --build-env --lib"
DEPENDS+="autoconf/2.67 --build-env"
DEPENDS+="automake/1.11 --build-env"

DESCRIPTION=	"Pango is a library for laying out and rendering of text, with an emphasis on internationalization."

CONFIGURE_ARGS+=

include ../../../mk/gnu.post.mk
