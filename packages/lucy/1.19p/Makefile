include ../../../mk/gnu.pre.mk

DISTNAME=	lucy
VERSION=	1.19p
EXTRAVERSION=	
CATEGORIES=	bio
HOMEPAGE=	http://www.complex.iastate.edu/download/Lucy2
MASTER_SITES=	ftp://ftp.tigr.org/pub/software/Lucy
MAINTAINER=	jtang@tchpc.tcd.ie
HAS_CONFIGURE=	no
DISTFILES=	$(DISTNAME)-$(VERSION).tar.gz

DESCRIPTION=	"Lucy1 was originally designed for high-throughput DNA sequencing centers to easily plug-in to their data streams; therefore it is operated exclusively through a command-line syntax."

do-install:
	$(INSTALL) -d $(PROGRAM_PREFIX)/bin
	$(INSTALL) $(WRKSRC)/lucy $(PROGRAM_PREFIX)/bin
	$(INSTALL) -d $(PROGRAM_PREFIX)/share/man/man1
	$(INSTALL) $(WRKSRC)/lucy.1 $(PROGRAM_PREFIX)/share/man/man1

include ../../../mk/gnu.post.mk
