include ../../../mk/gnu.pre.mk

LANG=           en
DISTNAME=	aspell-$(LANG)
VERSION=	6.0
PKGNAME=        aspell6-$(LANG)-$(VERSION)-0
CATEGORIES=	authoring
HOMEPAGE=	http://www.aspell.net
MASTER_SITES=	ftp://ftp.gnu.org/gnu/aspell/dict/en/
MAINTAINER=	gmk@caoslinux.org
DISTFILES=      $(PKGNAME).tar.bz2
DESCRIPTION=	"English dictionary for GNU Aspell"

DONT_CREATE_METAINFO = yes
HAS_CONFIGURE=  YES
CONFIGURE_SCRIPT= $(SRCDIR)/configure

DEPENDS += "aspell/current --build-env"

include ../../../mk/gnu.post.mk

