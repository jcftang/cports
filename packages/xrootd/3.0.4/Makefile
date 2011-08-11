include ../../../mk/gnu.pre.mk

DISTNAME=	xrootd
VERSION=	3.0.4
HOMEPAGE=	http://xrootd.org/
MASTER_SITES=	http://xrootd.org/download/v$(VERSION)
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	no
HAS_CONFIGURE=	no

DESCRIPTION=	"The cctools package contains Parrot, Chirp, Makeflow, Work Queue, SAND and other software"

DEPENDS+=	"zlib/1.2.5 --lib --build-env"
DEPENDS+=	"libxml2/2.7.7 --lib --build-env"
DEPENDS+=	"openssl/1.0.0a --lib --build-env"

MAKEFILE=	GNUmakefile

do-configure:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	./configure.classic --prefix=$(PROGRAM_PREFIX) \
	--no-arch-subdirs
	

include ../../../mk/gnu.post.mk
