include ../../../mk/gnu.pre.mk

DISTNAME=	openmotif
VERSION=	2.3.2
CATEGORIES=	utilities
HOMEPAGE=	http://www.motifzone.org/
MASTER_SITES=	http://www.motifzone.org/files/public_downloads/openmotif/2.3/$(VERSION)
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	yes
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

EXTRAVERSION=


DEPENDS=	"autoconf/2.67 --build-env"
DEPENDS+=	"automake/1.11 --build-env"
DEPENDS+=	"libpng/1.4.3 --lib --build-env"
DEPENDS+=	"libjpeg/8b --lib --build-env"
DEPENDS+=	"freetype/2.4.2 --lib --build-env"
DEPENDS+=	"xbitmaps/1.1.0 --lib --build-env"
DEPENDS+=	"flex/2.5.35 --build-env" 
DEPENDS+=	"bison/2.4.3 --build-env"
DEPENDS+=	"zlib/1.2.5 --lib --build-env"

DESCRIPTION=	"Open Motif (or, unofficially, OpenMotif) is a source code release of the Motif computer programming toolkit by The Open Group, the current owners of Motif."

include ../../../mk/gnu.post.mk
