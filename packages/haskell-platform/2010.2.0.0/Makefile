include ../../../mk/gnu.pre.mk

DISTNAME=	haskell-platform
VERSION=	2010.2.0.0
CATEGORIES=	devel
HOMEPAGE=	http://hackage.haskell.org/
MASTER_SITES=	http://hackage.haskell.org/platform/$(VERSION)
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	yes
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

EXTRAVERSION=

DEPENDS+=	"ghc/6.12.3-$(SYSTEM_TYPE_CPU) --build-env --run-env --lib"
DEPENDS+=	"gmp/4.3.2 --build-env --lib"

ALL_TARGET=	default

DESCRIPTION=	"The Haskell Platform is a comprehensive, robust development environment for programming in Haskell."

include ../../../mk/gnu.post.mk
