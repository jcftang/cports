include ../../../mk/gnu.pre.mk

DISTNAME=	tophat
VERSION=	1.4.1
CATEGORIES=	bio
HOMEPAGE=	http://tophat.cbcb.umd.edu/
MASTER_SITES=	http://tophat.cbcb.umd.edu/downloads/
MAINTAINER=	neil@tchpc.tcd.ie
GNU_CONFIGURE=	yes
DISTFILES = 	$(DISTNAME)-$(VERSION).tar.gz
EXTRAVERSION=

DESCRIPTION=	"TopHat is a fast splice junction mapper for RNA-Seq reads. It aligns RNA-Seq reads to mammalian-sized genomes using the ultra high-throughput short read aligner Bowtie, and then analyzes the mapping results to identify splice junctions between exons."

DEPENDS+=	"samtools/0.1.8 --lib --build-env --run-env"
DEPENDS+=	"zlib/1.2.6 --lib --build-env"
DEPENDS+=	"bowtie/0.12.7 --build-env --run-env"
DEPENDS+=	"Python/2.6.5 --build-env --run-env --lib"

CONFIGURE_ENV+=	BAM_ROOT=$(PREFIX_samtools)



include ../../../mk/gnu.post.mk
