include ../../../mk/gnu.pre.mk

DISTNAME=	cctools
VERSION=	3.3.4
HOMEPAGE=	http://www.cse.nd.edu/~ccl
MASTER_SITES=	http://www.cse.nd.edu/~ccl/software/files
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	no
HAS_CONFIGURE=	no
DISTFILES=	$(DISTNAME)-$(VERSION)-src.tar.gz

PKGSUBDIR=	$(DISTNAME)-$(VERSION)-src

DESCRIPTION=	"The cctools package contains Parrot, Chirp, Makeflow, Work Queue, SAND and other software"

do-configure:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	./configure --prefix $(PROGRAM_PREFIX)
	

include ../../../mk/gnu.post.mk
