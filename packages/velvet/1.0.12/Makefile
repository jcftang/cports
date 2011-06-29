include ../../../mk/gnu.pre.mk

DISTNAME=	velvet
VERSION=	1.0.12
EXTRAVERSION=	
CATEGORIES=	bio
HOMEPAGE=	http://www.ebi.ac.uk/~zerbino/velvet
MASTER_SITES=	http://www.ebi.ac.uk/~zerbino/velvet
MAINTAINER=	jtang@tchpc.tcd.ie
HAS_CONFIGURE=	no
DISTFILES = $(DISTNAME)_$(VERSION).tgz

DESCRIPTION=	"Velvet Sequence assembler for very short reads"
PKGSUBDIR=	$(DISTNAME)_$(VERSION)

do-build:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	$(MAKE); \
	$(MAKE) color

do-install:
	$(INSTALL) -d $(PROGRAM_PREFIX)/bin
	$(INSTALL) -d $(PROGRAM_PREFIX)/share/$(DISTNAME)_$(VERSION)
	cd $(WRKSRC); \
	$(MAKE) cleanobj; \
	tar -cpf - . | (cd $(PROGRAM_PREFIX)/share/$(DISTNAME)_$(VERSION) && tar -xpf - )
	-$(LN) $(PROGRAM_PREFIX)/share/$(DISTNAME)_$(VERSION)/velvet* $(PROGRAM_PREFIX)/bin/
	-$(LN) $(PROGRAM_PREFIX)/share/$(DISTNAME)_$(VERSION)/shuffleSequences_fast?.pl $(PROGRAM_PREFIX)/bin/

include ../../../mk/gnu.post.mk
