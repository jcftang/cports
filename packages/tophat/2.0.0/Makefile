include ../../../mk/gnu.pre.mk

DISTNAME=	tophat
VERSION=	2.0.0
CATEGORIES=	bio
HOMEPAGE=	http://tophat.cbcb.umd.edu/
MASTER_SITES=	http://tophat.cbcb.umd.edu/downloads/
MAINTAINER=	neil@tchpc.tcd.ie
GNU_CONFIGURE=	yes
DISTFILES = 	$(DISTNAME)-$(VERSION).tar.gz
EXTRAVERSION=

DESCRIPTION=	"TopHat is a fast splice junction mapper for RNA-Seq reads. It aligns RNA-Seq reads to mammalian-sized genomes using the ultra high-throughput short read aligner Bowtie, and then analyzes the mapping results to identify splice junctions between exons."

DEPENDS+=	"samtools/0.1.18 --lib --build-env --run-env"
DEPENDS+=	"zlib/1.2.6 --lib --build-env --run-env"
DEPENDS+=	"bowtie/0.12.7 --lib --build-env --run-env"
DEPENDS+=	"Python/2.7.2 --build-env --run-env --lib"
DEPENDS+=	"boost/1_49_0_openmpi_1.4.5 --build-env --run-env --lib"
DEPENDS+=	"bowtie2/2.0.0-beta5 --build-env --run-env --lib"

CONFIGURE_ARGS += --with-bam=$(PREFIX_samtools)
CONFIGURE_ARGS += --with-boost=$(PREFIX_boost)



include ../../../mk/gnu.post.mk
