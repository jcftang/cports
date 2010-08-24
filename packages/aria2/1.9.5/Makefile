include ../../../mk/gnu.pre.mk

DISTNAME=	aria2
VERSION=	1.9.5
CATEGORIES=	utilities
HOMEPAGE=	http://aria2.sourceforge.net/
MASTER_SITES=	http://downloads.sourceforge.net/project/aria2/stable/aria2-1.9.5/
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	yes
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

EXTRAVERSION=

DEPENDS+="sqlite/3.6.23.1 --lib"
DEPENDS+="libxml2/2.7.7 --lib"
DEPENDS+="c-ares/1.7.3 --lib"
DEPENDS+="openssl/1.0.0a --lib"

CONFIGURE_ARGS+=	--with-openssl --without-gnutls 

DESCRIPTION=	"aria2 is a multi-protocol & multi-source, cross platform download utility."

include ../../../mk/gnu.post.mk
