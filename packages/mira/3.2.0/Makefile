include ../../../mk/gnu.pre.mk

DISTNAME=	mira
VERSION=	3.2.0
HOMEPAGE=	http://www.chevreux.org/projects_mira.html
MASTER_SITES=	http://heanet.dl.sourceforge.net/project/mira-assembler/MIRA/V$(VERSION)/
MAINTAINER=	neil@tchpc.tcd.ie
GNU_CONFIGURE=	yes
DISTFILES=	$(DISTNAME)-$(VERSION).tar.bz2

DEPENDS=	"boost/1_44_0_openmpi_1.4.2 --lib --build-env"
DEPENDS+=	"openmpi/1.4.2	--lib --build-env --run-env"

DESCRIPTION=	"MIRA - Sequence assembler for whole genome shotgun and EST sequencing data. Can use Sanger, 454, Solexa (Illumina) and PacBio reads"



CONFIGURE_ARGS+= 


include ../../../mk/gnu.post.mk
