include ../../../mk/gnu.pre.mk

DISTNAME=	bamtools
VERSION=	1.0.2
EXTRAVERSION=	
CATEGORIES=	bio
HOMEPAGE=	https://github.com/pezmaster31/bamtools
#MASTER_SITES=	http://heanet.dl.sourceforge.net/project/$(DISTNAME)/$(DISTNAME)/$(DISTNAME)-v$(VERSION)
MASTER_SITES=	https://github.com/downloads/pezmaster31/bamtools/bamtools-1.0.2.tar.gz
MAINTAINER=	jtang@tchpc.tcd.ie
HAS_CONFIGURE=	no
#DISTFILES = BamTools-v$(VERSION).tar.gz

DESCRIPTION=	"BamTools provides a fast, flexible C++ API & toolkit for reading, writing, and manipulating BAM files. See our GitHub repo (link below) for the most up-to-date, active version. As of May 2010, we will be using SF to host major updates only."

#PKGSUBDIR=	BamTools-v$(VERSION)
DEPENDS+=	"cmake/2.8.3 --lib --build-env --run-env"

do-build:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	mkdir build; \
	cd build; \
	cmake ..; \
	$(MAKE); \

do-install:
	$(INSTALL) -d $(PROGRAM_PREFIX)/bin
	$(INSTALL) -d $(PROGRAM_PREFIX)/lib
	$(INSTALL) -d $(PROGRAM_PREFIX)/include
	cd $(WRKSRC); \
	cp -r ./include/* $(PROGRAM_PREFIX)/include; \
	cp -r ./bin/* $(PROGRAM_PREFIX)/bin; \
	cp -r ./lib/* $(PROGRAM_PREFIX)/lib;

# BamConversion  BamDump                BamReader.cpp    BamTrim 

include ../../../mk/gnu.post.mk
