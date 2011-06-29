include ../../../mk/gnu.pre.mk

DISTNAME=	gnutls
VERSION=	2.10.0
HOMEPAGE=	http://www.gnu.org/software/gnutls/
MASTER_SITES=	ftp://ftp.esat.net/pub/gnu/gnutls
MAINTAINER=	darach@tchpc.tcd.ie
GNU_CONFIGURE=	yes
DISTFILES = $(DISTNAME)-$(VERSION).tar.bz2

DEPENDS+= "libgpg-error/1.9 --build-env"
DEPENDS+= "libgcrypt/1.4.6 --build-env"

DESCRIPTION=	"GnuTLS is a project that aims to develop a library which provides a secure layer, over a reliable transport layer."

CONFIGURE_ARGS+=  --with-libgcrypt-prefix=$(PREFIX_libgcrypt)

include ../../../mk/gnu.post.mk
