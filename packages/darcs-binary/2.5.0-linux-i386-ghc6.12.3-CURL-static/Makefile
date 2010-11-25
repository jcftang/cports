include ../../../mk/gnu.pre.mk

DISTNAME=	darcs
VERSION=	2.5.0-linux-i386-ghc6.12.3-CURL-static
EXTRAVERSION=	
CATEGORIES=	devel
HOMEPAGE=	http://www.darcs.net/
MASTER_SITES=	http://teratorn.org/code/
MAINTAINER=	jtang@tchpc.tcd.ie
HAS_CONFIGURE=	no
DISTFILES = $(DISTNAME)-$(VERSION).bin.bz2

DESCRIPTION=	"Darcs is a distributed, advanced revision control system written in Haskell."
#PKGSUBDIR=	$(DISTNAME)_$(VERSION)

do-build:
	#no-op don't need to build this
	@:

do-install:
	$(INSTALL) -d $(PROGRAM_PREFIX)/bin
	cd $(WORKDIR); \
	pwd ;\
	install -m755 $(DISTNAME)-$(VERSION).bin  $(PROGRAM_PREFIX)/bin/darcs ;

include ../../../mk/gnu.post.mk
