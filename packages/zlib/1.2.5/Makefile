include ../../../mk/gnu.pre.mk

DISTNAME=	zlib
VERSION=	1.2.5
CATEGORIES=	lib
HOMEPAGE=	http://www.info-zip.org/pub/infozip/zlib/
MASTER_SITES=	http://downloads.sourceforge.net/project/libpng/zlib/$(VERSION)/
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	yes

ifeq ("$(SYSTEM_TYPE_CPU)", "x86_64")
CPRT_CONFIGURE_ARGS= --64 
endif

DESCRIPTION=	"The 'zlib' compression library provides in-memory compression"
DESCRIPTION+=	"and decompression functions, including integrity checks of"
DESCRIPTION+=	"the uncompressed data. This version of the library supports"
DESCRIPTION+=	"only one compression method (deflation) but other algorithms"
DESCRIPTION+=	"will be added later and will have the same stream interface."

do-configure:
	cd $(WRKSRC); \
	$(CONFIGURE_SCRIPT) --prefix=$(PROGRAM_PREFIX) $(CPRT_CONFIGURE_ARGS)

include ../../../mk/gnu.post.mk
