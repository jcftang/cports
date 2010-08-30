include ../../../mk/gnu.pre.mk

DISTNAME=	wgs
VERSION=	6.1
EXTRAVERSION=	
CATEGORIES=	bio
HOMEPAGE=	https://sourceforge.net/projects/wgs-assembler
MASTER_SITES=	http://heanet.dl.sourceforge.net/project/wgs-assembler/wgs-assembler/wgs-$(VERSION)
MAINTAINER=	jtang@tchpc.tcd.ie
HAS_CONFIGURE=	no
DISTFILES = $(DISTNAME)-$(VERSION).tar.bz2

DESCRIPTION=	"Celera Assembler (CA) is a whole-genome shotgun (WGS) assembler for the reconstruction of genomic DNA sequence from WGS sequencing data."

DEPENDS+=	""

do-configure:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC)/kmer; \
	sh configure.sh
	
do-build:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC)/kmer; \
	$(MAKE) install
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC)/src; \
	$(MAKE)

do-install:

ifeq ("$(SYSTEM_TYPE_CPU)", "x86_64")
	$(INSTALL) -d $(PROGRAM_PREFIX)/bin
	$(INSTALL) -d $(PROGRAM_PREFIX)/bin/spec
	$(INSTALL) -d $(PROGRAM_PREFIX)/bin/TIGR
	$(INSTALL) -d $(PROGRAM_PREFIX)/lib
### need to clean the rest of this up, it's not the best way of doing things
	-$(INSTALL) -t $(PROGRAM_PREFIX)/bin $(WRKSRC)/Linux-amd64/bin/*
	-$(INSTALL) -t $(PROGRAM_PREFIX)/bin/spec $(WRKSRC)/Linux-amd64/bin/spec/*
	-$(INSTALL) -t $(PROGRAM_PREFIX)/bin/TIGR $(WRKSRC)/Linux-amd64/bin/TIGR/*
	-$(INSTALL) -t $(PROGRAM_PREFIX)/lib $(WRKSRC)/Linux-amd64/lib/*
endif

include ../../../mk/gnu.post.mk
