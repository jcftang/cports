include ../../../mk/gnu.pre.mk

DISTNAME=	oases
VERSION=	0.1.18
EXTRAVERSION=	
CATEGORIES=	bio
HOMEPAGE=	http://www.ebi.ac.uk/~zerbino/oases
MASTER_SITES=	http://www.ebi.ac.uk/~zerbino/oases
MAINTAINER=	jtang@tchpc.tcd.ie
HAS_CONFIGURE=	no
DISTFILES = $(DISTNAME)_$(VERSION).tgz

DESCRIPTION=	"Oases - De novo transcriptome assembler for very short reads "
PKGSUBDIR=	$(DISTNAME)_$(VERSION)
DEPENDS+=	"velvet/1.0.18 --lib --build-env --run-env"

do-build:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(PREFIX_velvet)/share/velvet_1.0.18; \
	$(MAKE) ; \
	$(MAKE) color
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	$(MAKE) VELVET_DIR=$(PREFIX_velvet)/share/velvet_1.0.18 ; \

do-install:
	$(INSTALL) -d $(PROGRAM_PREFIX)/bin
	$(INSTALL) -d $(PROGRAM_PREFIX)/share/$(DISTNAME)_$(VERSION)
	cd $(WRKSRC); \
	$(MAKE) cleanobj; \
	tar -cpf - . | (cd $(PROGRAM_PREFIX)/share/$(DISTNAME)_$(VERSION) && tar -xpf - )
	-$(LN) $(PROGRAM_PREFIX)/share/$(DISTNAME)_$(VERSION)/oases $(PROGRAM_PREFIX)/bin/

include ../../../mk/gnu.post.mk
