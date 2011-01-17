include ../../../mk/gnu.pre.mk

DISTNAME=	bamtools
VERSION=	0.7.47
EXTRAVERSION=	
CATEGORIES=	bio
HOMEPAGE=	https://sourceforge.net/projects/bamtools/
MASTER_SITES=	http://heanet.dl.sourceforge.net/project/$(DISTNAME)/$(DISTNAME)/$(DISTNAME)-v$(VERSION)
MAINTAINER=	jtang@tchpc.tcd.ie
HAS_CONFIGURE=	no
DISTFILES = BamTools-v$(VERSION).tar.gz

DESCRIPTION=	"BamTools provides a fast, flexible C++ API & toolkit for reading, writing, and manipulating BAM files. See our GitHub repo (link below) for the most up-to-date, active version. As of May 2010, we will be using SF to host major updates only."

PKGSUBDIR=	BamTools-v$(VERSION)

do-build:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	$(MAKE); \
	$(MAKE) clean

do-install:
	$(INSTALL) -d $(PROGRAM_PREFIX)/bin
	cd $(WRKSRC); \
	$(INSTALL) BamConversion $(PROGRAM_PREFIX)/bin ;\
	$(INSTALL) BamDump $(PROGRAM_PREFIX)/bin ;\
	$(INSTALL) BamTrim $(PROGRAM_PREFIX)/bin ;\
	tar -cpf - . | (cd $(PROGRAM_PREFIX)/ && tar -xpf - )

# BamConversion  BamDump                BamReader.cpp    BamTrim 

include ../../../mk/gnu.post.mk
