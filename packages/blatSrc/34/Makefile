include ../../../mk/gnu.pre.mk

DISTNAME=	blatSrc
VERSION=	34
EXTRAVERSION=	
CATEGORIES=	bio
HOMEPAGE=	http://hgwdev.cse.ucsc.edu/~kent/src/
MASTER_SITES=	http://users.soe.ucsc.edu/~kent/src/
MAINTAINER=	jtang@tchpc.tcd.ie
HAS_CONFIGURE=	no
DISTFILES = $(DISTNAME)$(VERSION).zip

DESCRIPTION=	"blatSrc"

PKGSUBDIR=	$(DISTNAME)

do-configure:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	patch $(WRKSRC)/jkOwnLib/fuzzyFind.c fuzzyFind.patch;

do-build:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	$(MKDIR) $(WRKSRC)/bin ;\
	MACHTYPE=$(SYSTEM_TYPE_CPU) $(MAKE) BINDIR=$(WRKSRC)/bin;

BIN=blat  faToNib  faToTwoBit  gfClient  gfServer  nibFrag  pslPretty  pslReps  pslSort  twoBitInfo  twoBitToFa

do-install:
	$(INSTALL) -d $(PROGRAM_PREFIX)/bin
	cd $(WRKSRC); \
	for i in $(BIN); do $(INSTALL) bin/$$i $(PROGRAM_PREFIX)/bin/$$i; done;

include ../../../mk/gnu.post.mk
