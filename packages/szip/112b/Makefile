include ../../../mk/gnu.pre.mk

DISTNAME=	szip
VERSION=	112b
CATEGORIES=	lib
HOMEPAGE=	http://www.compressconsult.com/szip
MASTER_SITES=	http://www.compressconsult.com/szip
MAINTAINER=	jtang@tchpc.tcd.ie
HAS_CONFIGURE=	no
DISTFILES=	sz$(VERSION)_src.tar.gz
CONFIGURE_ARGS=

MAKEFILE=	makefile

DESCRIPTION=	"Szip is a freeware portable general purpose lossless compression program."


do-extract:
	mkdir -p $(WRKSRC); \
	cd $(WRKSRC); \
	$(GZCAT) $(_DISTDIR)/$(DISTFILES) | $(TAR_EXTRACT)

do-install:
	install -d $(PROGRAM_PREFIX)/bin
	install $(WRKSRC)/szip $(PROGRAM_PREFIX)/bin 
	install -d $(PROGRAM_PREFIX)/doc
	install $(WRKSRC)/readme.txt $(PROGRAM_PREFIX)/doc
	install $(WRKSRC)/techinfo.txt $(PROGRAM_PREFIX)/doc
	install $(WRKSRC)/history.txt $(PROGRAM_PREFIX)/doc

include ../../../mk/gnu.post.mk
