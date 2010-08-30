include ../../../mk/gnu.pre.mk

DISTNAME=	aria2
VERSION=	1.10.1
CATEGORIES=	utilities
HOMEPAGE=	http://aria2.sourceforge.net/
MASTER_SITES=	http://downloads.sourceforge.net/project/aria2/stable/aria2-$(VERSION)/
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	yes
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

EXTRAVERSION=

DEPENDS+="sqlite/3.6.23.1 --lib --build-env"
DEPENDS+="libxml2/2.7.7 --lib --build-env"
DEPENDS+="c-ares/1.7.3 --lib --build-env"
DEPENDS+="openssl/1.0.0a --lib --build-env"

CONFIGURE_ARGS+=         --with-openssl --without-gnutls

DESCRIPTION=	"aria2 is a multi-protocol & multi-source, cross platform download utility."

include ../../../mk/gnu.post.mk
