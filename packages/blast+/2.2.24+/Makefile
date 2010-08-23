include ../../../mk/gnu.pre.mk

DISTNAME=	ncbi-blast
VERSION=	2.2.24+
CATEGORIES=	utilities
HOMEPAGE=	http://www.mpiblast.org/
MASTER_SITES=	ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	yes
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

EXTRAVERSION=

CONFIGURE_ARGS+= CFLAGS="-O2" CXXFLAGS="-O2"

DESCRIPTION=	"Open-Source Parallel BLAST"

include ../../../mk/gnu.post.mk
