include ../../../mk/gnu.pre.mk

DISTNAME=	blat
VERSION=	34
EXTRAVERSION=	
CATEGORIES=	bio
HOMEPAGE=	http://hgwdev.cse.ucsc.edu/~kent/src/
MASTER_SITES=	http://users.soe.ucsc.edu/~kent/src/
MAINTAINER=	jtang@tchpc.tcd.ie
HAS_CONFIGURE=	no
DISTFILES = $(DISTNAME)Src$(VERSION).zip

DESCRIPTION=	"Blat is an alignment tool like BLAST, but it is structured differently. On DNA, Blat works by keeping an index of an entire genome in memory. Thus, the target database of BLAT is not a set of GenBank sequences, but instead an index derived from the assembly of the entire genome. The index -- which uses less than a gigabyte of RAM -- consists of all non-overlapping 11-mers except for those heavily involved in repeats. This smaller size means that Blat is far more easily mirrored. Blat of DNA is designed to quickly find sequences of 95% and greater similarity of length 40 bases or more. It may miss more divergent or short sequence alignments"

PKGSUBDIR=	$(DISTNAME)Src

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
