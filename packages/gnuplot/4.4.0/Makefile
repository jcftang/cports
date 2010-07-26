include ../../../mk/gnu.pre.mk

DISTNAME=	gnuplot
VERSION=	4.4.0
CATEGORIES=	utilities
HOMEPAGE=	http://www.gnuplot.info/
MASTER_SITES=	http://downloads.sourceforge.net/project/gnuplot/gnuplot/4.4.0/
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	yes
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

EXTRAVERSION=

CONFIGURE_ARGS+= CFLAGS="-O2" CXXFLAGS="-O2"

DESCRIPTION=	"Gnuplot is a portable command-line driven graphing utility for linux, OS/2, MS Windows, OSX, VMS, and many other platforms."

include ../../../mk/gnu.post.mk
