include ../../../mk/gnu.pre.mk

DISTNAME=	gnuplot
VERSION=	4.6.0
CATEGORIES=	utilities
HOMEPAGE=	http://www.gnuplot.info/
MASTER_SITES=	http://heanet.dl.sourceforge.net/project/gnuplot/gnuplot/$(VERSION)
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	yes
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

EXTRAVERSION=

DEPENDS+=       "atk/1.30.0 --build-env --lib"
DEPENDS+=       "binutils/2.20 --build-env"
DEPENDS+=       "cairo/1.8.10 --build-env --lib"
DEPENDS+=       "coreutils/8.5 --build-env"
DEPENDS+=       "fontconfig/2.8.0 --lib --build-env"
DEPENDS+=	"gd/2.0.36RC1 --build-env --lib"
DEPENDS+=       "glib/2.24.1 --build-env --lib"
DEPENDS+=       "gtk+/2.20.1 --build-env --lib"
DEPENDS+=	"libjpeg/8b --build-env --lib"
DEPENDS+=	"libpng/1.2.42 --build-env --lib"
DEPENDS+=	"libtiff/3.9.4 --build-env --lib"
DEPENDS+=       "libungif/4.1.4 --lib --build-env"
DEPENDS+=       "libXaw/1.0.7 --lib --build-env"
DEPENDS+=       "libXpm/3.5.8 --lib --build-env"
DEPENDS+=       "ncurses/5.7 --lib --build-env"
DEPENDS+=       "netpbm/10.35.77 --build-env --lib"
DEPENDS+=       "pango/1.28.1 --build-env --lib"
DEPENDS+=       "pixman/0.18.2 --build-env --lib"
DEPENDS+=	"poppler/0.14.1 --build-env --lib"
DEPENDS+=       "texinfo/4.13 --build-env"


CONFIGURE_ARGS+= CFLAGS="-O2" CXXFLAGS="-O2"

DESCRIPTION=	"Gnuplot is a portable command-line driven graphing utility for linux, OS/2, MS Windows, OSX, VMS, and many other platforms."

include ../../../mk/gnu.post.mk
