include ../../../mk/gnu.pre.mk

DISTNAME=	bzip2
VERSION=	1.0.5
CATEGORIES=	archive
HOMEPAGE=	http://www.bzip.org
MASTER_SITES=	http://www.bzip.org/$(VERSION)
MAINTAINER=	jtang@tchpc.tcd.ie
HAS_CONFIGURE=	no

DESCRIPTION=	"bzip2, bunzip2 - a block-sorting file compressor"

do-install:
	cd $(WRKSRC) ; \
	$(MAKE) PREFIX=$(PROGRAM_PREFIX) install
include ../../../mk/gnu.post.mk
