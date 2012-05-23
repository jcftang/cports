include ../../../mk/gnu.pre.mk

DISTNAME=	cufflinks
VERSION=	2.0.0
CATEGORIES=	bio
HOMEPAGE=	http://cufflinks.cbcb.umd.edu/
MASTER_SITES=	http://cufflinks.cbcb.umd.edu/downloads/
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	yes
DISTFILES = 	$(DISTNAME)-$(VERSION).tar.gz
EXTRAVERSION=

DESCRIPTION=	"Cufflinks assembles transcripts, estimates their abundances, and tests for differential expression and regulation in RNA-Seq samples. It accepts aligned RNA-Seq reads and assembles the alignments into a parsimonious set of transcripts. Cufflinks then estimates the relative abundances of these transcripts based on how many reads support each one."

#DEPENDS+=	"samtools/0.1.8 --lib --build-env --run-env"
DEPENDS+=	"zlib/1.2.6 --lib --build-env"
DEPENDS+=	"bowtie/0.12.7 --build-env --run-env"
#DEPENDS+=	"Python/2.6.5 --build-env --run-env --lib"
#DEPENDS+=	"boost/1_46_1_openmpi_1.4.3 --build-env --lib"
DEPENDS+=       "boost/1_49_0_openmpi_1.4.5 --build-env --lib"
DEPENDS+=	"eigen/3.0.5 --build-env --lib"

CONFIGURE_ENV+=	BAM_ROOT=$(PREFIX_samtools)
CONFIGURE_ARGS+=  --with-boost=$(PREFIX_boost)
CONFIGURE_ARGS+=  --with-eigen=$(PREFIX_eigen)

do-configure:
	$(MODULE_ADD) $(BUILD_DEPENDS) ;\
	cd $(WRKSRC) ;\
	echo $(PREFIX_eigen) ;\
	CPPFLAGS="-I$(PREFIX_eigen)/include/eigen3" ./configure --with-boost=$(PREFIX_boost) --prefix=$(PROGRAM_PREFIX)



include ../../../mk/gnu.post.mk
