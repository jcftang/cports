include ../../../mk/gnu.pre.mk

DISTNAME=	ImageMagick
VERSION=	6.6.7-1
HOMEPAGE=	http://www.imagemagick.org/script/index.php
MASTER_SITES=	http://image_magick.veidrodis.com/image_magick/
MAINTAINER=	neil@tchpc.tcd.ie
GNU_CONFIGURE=	yes
DISTFILES=	$(DISTNAME).tar.gz


DESCRIPTION=	"Create, edit, compose, or convert bitmap images"

DEPENDS+=       "libungif/4.1.4 --lib --build-env"
DEPENDS+=       "libjpeg/8b --lib --build-env"
DEPENDS+=       "libpng/1.2.42 --lib --build-env"
DEPENDS+=       "libtiff/3.9.4 --lib --build-env"
DEPENDS+=	"ghostscript/9.00 --lib --build-env"
DEPENDS+=	"perl/5.10.1 --lib --build-env"


CONFIGURE_ARGS+= "--with-perl"




include ../../../mk/gnu.post.mk
