include ../../../mk/gnu.pre.mk

DISTNAME=	stampy
VERSION=	1.0.11
HOMEPAGE=	http://www.well.ox.ac.uk/project-stampy
MASTER_SITES=	http://www.well.ox.ac.uk/~gerton/software/Stampy/
MAINTAINER=	neil@tchpc.tcd.ie
GNU_CONFIGURE=	no
HAS_CONFIGURE=  no
DISTFILES = 	$(DISTNAME)-latest.tgz

PKGSUBDIR=      $(DISTNAME)-$(VERSION)


DESCRIPTION=	"Stampy is a package for the mapping of short reads from illumina sequencing machines onto a reference genome. It's recommended for most workflows, including those for genomic resequencing, RNA-Seq and Chip-seq. Stampy excels in the mapping of reads containing that contain sequence variation relative to the reference, in particular for those containing insertions or deletions. It can map reads from a highly divergent species to a reference genome for instance. Stampy achieves high sensitivity and speed by using a fashashing algorithm and a detailed statistical model"

DEPENDS+=	"Python/2.6.5 --build-env --lib --run-env"
DEPENDS+=	"bwa/0.5.9rc1 --run-env"
DEPENDS+= 	"maq/0.7.1 --run-env"
DEPENDS+=	"samtools/0.1.8	--run-env"


do-configure:
	$(MODULE_ADD) $(BUILD_DEPENDS); \
	cd $(WRKSRC); \

do-build:
	$(MODULE_ADD) $(BUILD_DEPENDS); \
        cd $(WRKSRC); \
	$(MAKE)

do-install:
	$(MODULE_ADD) $(BUILD_DEPENDS); \
	$(MKDIR) -p $(PROGRAM_PREFIX); \
	$(CP) -r $(WRKSRC)/* $(PROGRAM_PREFIX); \
	cd $(PROGRAM_PREFIX); \
	$(MKDIR) -p bin; \
	cd bin; \
	$(LN) -s -f ../stampy.py stampy.py	

include ../../../mk/gnu.post.mk
