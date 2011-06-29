include ../../../mk/gnu.pre.mk

DISTNAME=	bzip2
VERSION=	1.0.6
CATEGORIES=	archive
HOMEPAGE=	http://www.bzip.org
MASTER_SITES=	http://www.bzip.org/$(VERSION)
MAINTAINER=	jtang@tchpc.tcd.ie
HAS_CONFIGURE=	no

DESCRIPTION=	"bzip2, bunzip2 - a block-sorting file compressor"
ENVIRONMENT+=	CFLAGS=-fPIC LDFLAGS=-fPIC

do-build:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
        cd $(WRKSRC) ;\
	$(MAKE) -f Makefile-libbz2_so ;\
	$(MAKE)

do-install:
	cd $(WRKSRC) ; \
	$(MAKE) PREFIX=$(PROGRAM_PREFIX) install  ;\
	$(INSTALL) -m755 libbz2.so.* $(PROGRAM_PREFIX)/lib

include ../../../mk/gnu.post.mk
