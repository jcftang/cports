include ../../../mk/gnu.pre.mk

DISTNAME=	guile
VERSION=	1.8.7
CATEGORIES=	devel lib
MASTER_SITES=	$(MASTER_SITE_GNU:=$(DISTNAME)/)
HOMEPAGE=	http://www.gnu.org/software/guile/guile.html
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	yes
USE_LIBTOOL=	yes

DEPENDS=	"gawk --build-env"
DEPENDS+=	"gettext --build-env"
DEPENDS+=	"libiconv --build-env"
#DEPENDS+=	"glib --lib --build-env"
#DEPENDS+=	"gtk --lib --build-env"
#DEPENDS+=	"gnome-libs --lib --build-env"
DEPENDS+=	"texinfo --build-env"
DEPENDS+=	"ncurses --build-env"
DEPENDS+=	"readline --build-env"
DEPENDS+=	"libtool --build-env"

#CONFIGURE_ARGS=	--with-glib-prefix=$(PREFIX_glib)
#CONFIGURE_ARGS+=--with-gnome=$(PREFIX_gnome-libs)
#CONFIGURE_ARGS+=--with-libgtop-guile 
CONFIGURE_ARGS+= --with-x

INFO_FILE=	$(PROGRAM_PREFIX)/info/data-rep.info	# data-rep???

DESCRIPTION=	"Guile is a library designed to help programmers create"
DESCRIPTION+=	"flexible applications. Using Guile in an application allows"
DESCRIPTION+=	"programmers to write plug-ins, or modules and users to use"
DESCRIPTION+=	"them to have an application fit their needs."

include ../../../mk/gnu.post.mk
