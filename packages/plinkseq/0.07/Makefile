include ../../../mk/gnu.pre.mk

DISTNAME=       plinkseq
VERSION=        0.07
CATEGORIES=     utilities
HOMEPAGE=	http://atgu.mgh.harvard.edu/plinkseq/
MASTER_SITES=   http://atgu.mgh.harvard.edu/plinkseq/dist/
MAINTAINER=     jtang@tchpc.tcd.ie
HAS_CONFIGURE=  no
DISTFILES = $(DISTNAME)-$(VERSION)-x86_64.tar.gz

PKGSUBDIR=$(DISTNAME)-$(VERSION)-x86_64

do-build:
	@

do-install:
	$(INSTALL) -d $(PROGRAM_PREFIX)/bin
	$(INSTALL) $(WRKSRC)/mongoose $(PROGRAM_PREFIX)/bin/mongoose
	$(INSTALL) $(WRKSRC)/pbrowse $(PROGRAM_PREFIX)/bin/pbrowse
	$(INSTALL) $(WRKSRC)/pbrowse.cgi $(PROGRAM_PREFIX)/bin/pbrowse.cgi
	$(INSTALL) $(WRKSRC)/pseq $(PROGRAM_PREFIX)/bin/pseq

include ../../../mk/gnu.post.mk
