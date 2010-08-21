include ../../../mk/gnu.pre.mk

DISTNAME=	libidn
VERSION=	1.19
CATEGORIES=	devel
HOMEPAGE=	http://www.gnu.org/software/libidn
MASTER_SITES=	ftp://ftp.gnu.org/gnu/libidn
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	yes
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

DEPENDS+=	"libiconv/1.13 --build-env --lib"
DEPENDS+=	"gettext/0.17 --build-env --lib"

EXTRAVERSION=

DESCRIPTION=	"GNU Libidn is a fully documented implementation of the Stringprep, Punycode and IDNA specifications."

include ../../../mk/gnu.post.mk
