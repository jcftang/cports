include ../../../mk/gnu.pre.mk

DISTNAME=	bwa
VERSION=	0.5.9rc1
EXTRAVERSION=	
CATEGORIES=	bio
HOMEPAGE=	http://bio-bwa.sourceforge.net
MASTER_SITES=	http://heanet.dl.sourceforge.net/project/bio-bwa
MAINTAINER=	jtang@tchpc.tcd.ie
HAS_CONFIGURE=	no
DISTFILES = $(DISTNAME)-$(VERSION).tar.bz2

DESCRIPTION=	"BWA is a program for aligning sequencing reads against a large reference genome (e.g. human genome). It has two major components, one for read shorter than 150bp and the other for longer reads."

DEPENDS=	"samtools/0.1.8 --run-env"

do-build:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	$(MAKE)

do-install:
	$(INSTALL) -d $(PROGRAM_PREFIX)/bin
	$(INSTALL) $(WRKSRC)/bwa $(PROGRAM_PREFIX)/bin
	$(INSTALL) $(WRKSRC)/solid2fastq.pl $(PROGRAM_PREFIX)/bin
	$(INSTALL) $(WRKSRC)/qualfa2fq.pl $(PROGRAM_PREFIX)/bin
	$(INSTALL) -d $(PROGRAM_PREFIX)/share/man/man1
	$(INSTALL) $(WRKSRC)/bwa.1 $(PROGRAM_PREFIX)/share/man/man1

include ../../../mk/gnu.post.mk
