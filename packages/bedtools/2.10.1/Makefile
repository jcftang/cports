include ../../../mk/gnu.pre.mk

DISTNAME=	bedtools
VERSION=	2.10.1
CATEGORIES=	bio
HOMEPAGE=	http://code.google.com/p/bedtools/
MASTER_SITES=	http://bedtools.googlecode.com/files/
MAINTAINER=	jtang@tchpc.tcd.ie
HAS_CONFIGURE=	no
DISTFILES = 	BEDTools.v$(VERSION).tar.gz

EXTRAVERSION=

PKGSUBDIR=	BEDTools-Version-$(VERSION)

DESCRIPTION=	"The BEDTools utilities allow one to address common genomics tasks such as finding feature overlaps and computing coverage."

DEPENDS+=       "zlib/1.2.5 --lib --build-env"

do-install:
	$(INSTALL) -d $(PROGRAM_PREFIX)/
	cd $(WRKSRC); \
	tar -cpf - . | (cd $(PROGRAM_PREFIX)/ && tar -xpf - )

include ../../../mk/gnu.post.mk
