include ../../../mk/gnu.pre.mk

DISTNAME=	samtools
VERSION=	0.1.6
EXTRAVERSION=	
CATEGORIES=	bio
HOMEPAGE=	http://maq.sourceforge.net
MASTER_SITES=	http://heanet.dl.sourceforge.net/project/$(DISTNAME)/$(DISTNAME)/$(VERSION)
MAINTAINER=	jtang@tchpc.tcd.ie
HAS_CONFIGURE=	no
DISTFILES = $(DISTNAME)-$(VERSION).tar.bz2

DEPENDS=	"zlib/1.2.5 --lib --build-env"
DEPENDS+=	"ncurses/5.7 --lib --build-env"

DESCRIPTION=	"SAM (Sequence Alignment/Map) is a flexible generic format for storing nucleotide sequence alignment. SAM tools provide efficient utilities on manipulating alignments in the SAM format."

do-build:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	$(MAKE) 'CFLAGS=-g -Wall -O2 -fPIC'; \
	$(MAKE) 'CFLAGS=-g -Wall -O2 -fPIC' razip;\
	$(MAKE) 'CFLAGS=-g -Wall -O2 -fPIC' libbam.so.1-local

do-install:
	$(INSTALL) -d $(PROGRAM_PREFIX)/bin
	$(INSTALL) $(WRKSRC)/samtools $(PROGRAM_PREFIX)/bin
	$(INSTALL) $(WRKSRC)/razip $(PROGRAM_PREFIX)/bin

	$(INSTALL) -d $(PROGRAM_PREFIX)/share/man/man1
	$(INSTALL) $(WRKSRC)/samtools.1 $(PROGRAM_PREFIX)/share/man/man1

	$(INSTALL) -d $(PROGRAM_PREFIX)/share/$(DISTNAME)-$(VERSION)/examples
	cd $(WRKSRC); \
	tar -cpf - . | (cd $(PROGRAM_PREFIX)/share/$(DISTNAME)-$(VERSION)/examples && tar -xpf - )

	$(INSTALL) $(WRKSRC)/misc/*.pl $(PROGRAM_PREFIX)/bin
	$(INSTALL) $(WRKSRC)/misc/{md5sum-lite,md5fa,maq2sam-short,maq2sam-long,wgsim} $(PROGRAM_PREFIX)/bin
	
	$(INSTALL) -d $(PROGRAM_PREFIX)/lib
	$(INSTALL) $(WRKSRC)/lib* $(PROGRAM_PREFIX)/lib/
	$(LN) -sf $(PROGRAM_PREFIX)/lib/libbam.so.1 $(PROGRAM_PREFIX)/lib/libbam.so
	$(INSTALL) -d $(PROGRAM_PREFIX)/include
	$(INSTALL) $(WRKSRC)/*.h $(PROGRAM_PREFIX)/include

include ../../../mk/gnu.post.mk
