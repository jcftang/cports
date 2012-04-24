include ../../../mk/gnu.pre.mk

DISTNAME=	gd
VERSION=	2.0.36RC1
CATEGORIES=	graphics
HOMEPAGE=	http:/www.libgd.org/
MASTER_SITES=	http://ring.nict.go.jp/archives/graphics/gd/
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	yes
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

EXTRAVERSION=

DEPENDS+=	"poppler/0.14.1 --build-env --lib"
DEPENDS+=	"libjpeg/8b --build-env --lib"
DEPENDS+=       "libpng/1.2.42 --build-env --lib"
DEPENDS+=       "zlib/1.2.6 --build-env --lib"
DEPENDS+=       "freetype/2.4.2 --build-env --lib"
DEPENDS+=       "fontconfig/2.8.0 --build-env --lib"

CONFIGURE_ARGS+= CFLAGS="-O2" CXXFLAGS="-O2"

DESCRIPTION=	"GD is an open source code library for the dynamic creation of images by programmers."

include ../../../mk/gnu.post.mk
