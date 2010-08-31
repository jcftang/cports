include ../../../mk/gnu.pre.mk

DISTNAME=	bwa
VERSION=	0.5.0
EXTRAVERSION=	
CATEGORIES=	bio
HOMEPAGE=	http://maq.sourceforge.net
MASTER_SITES=	http://heanet.dl.sourceforge.net/project/maq/$(DISTNAME)/$(VERSION)
MAINTAINER=	jtang@tchpc.tcd.ie
HAS_CONFIGURE=	no
DISTFILES = $(DISTNAME)-$(VERSION).tar.bz2

DESCRIPTION=	"bwa - Burrows-Wheeler Alignment Tool"

DEPENDS=	"samtools/0.1.8 --run-env"

do-build:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	$(MAKE)

do-install:
	$(INSTALL) -d $(PROGRAM_PREFIX)/bin
	$(INSTALL) $(WRKSRC)/bwa $(PROGRAM_PREFIX)/bin
	$(INSTALL) $(WRKSRC)/solid2fastq.pl $(PROGRAM_PREFIX)/bin
	$(INSTALL) -d $(PROGRAM_PREFIX)/share/man/man1
	$(INSTALL) $(WRKSRC)/bwa.1 $(PROGRAM_PREFIX)/share/man/man1

include ../../../mk/gnu.post.mk
