include ../../../mk/gnu.pre.mk

DISTNAME=	ghc
VERSION=	6.12.3
EXTRAVERSION=	-i386
CATEGORIES=	devel
HOMEPAGE=	http://haskell.org/ghc/
MASTER_SITES=	http://darcs.haskell.org/download/dist/6.12.3/
MAINTAINER=	jtang@tchpc.tcd.ie
DISTFILES = $(DISTNAME)-$(VERSION)$(EXTRAVERSION)-unknown-linux-n.tar.bz2
GNU_CONFIGURE=	yes

DEPENDS+=	"gmp/4.3.2 --build-env --lib --run-env"
DEPENDS+=	"zlib/1.2.5 --build-env --lib --run-env"

DESCRIPTION=	"GHC is a state-of-the-art, open source, compiler and interactive environment for the functional language Haskell. "

do-build:
	# no-op since it's a binary package
	@:

include ../../../mk/gnu.post.mk
