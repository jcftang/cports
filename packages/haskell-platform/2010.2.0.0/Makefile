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

ifeq ("$(SYSTEM_TYPE_CPU)", "x86_64")
DEPENDS+=	"ghc/6.12.3-x86_64 --build-env --run-env --lib"
else
DEPENDS+=	"ghc/6.12.3-i386 --build-env --run-env --lib"
endif
DEPENDS+=	"gmp/4.3.2 --build-env --lib --run-env"
DEPENDS+=	"ncurses/5.7 --build-env --lib --run-env"
DEPENDS+=	"zlib/1.2.5 --build-env --lib --run-env"
DEPENDS+=	"gettext/0.18.1.1 --build-env --lib --run-env"
DEPENDS+=	"libiconv/1.13 --build-env --lib --run-env"

ALL_TARGET=	default

DESCRIPTION=	"The Haskell Platform is a comprehensive, robust development environment for programming in Haskell."

include ../../../mk/gnu.post.mk
