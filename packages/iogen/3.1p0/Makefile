include ../../../mk/gnu.pre.mk

DISTNAME=	iogen
VERSION=	3.1p0
EXTRAVERSION=	
CATEGORIES=	system
HOMEPAGE=	http://www.peereboom.us/iogen
MASTER_SITES=	http://www.peereboom.us/iogen
MAINTAINER=	jtang@tchpc.tcd.ie
HAS_CONFIGURE=	no
DISTFILES = $(DISTNAME)_$(VERSION).tgz

DESCRIPTION=	"iogen - I/O generator"
PKGSUBDIR=	$(DISTNAME)_$(VERSION)

do-build:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	$(MAKE)

do-install:
	$(INSTALL) -d $(PROGRAM_PREFIX)/bin
	$(INSTALL) -d $(PROGRAM_PREFIX)/man/man8
	cd $(WRKSRC); \
	install -m755 iogen $(PROGRAM_PREFIX)/bin ;\
	install -m744 src/iogen.8 $(PROGRAM_PREFIX)/man/man8

include ../../../mk/gnu.post.mk
