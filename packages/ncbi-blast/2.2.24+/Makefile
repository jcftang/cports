include ../../../mk/gnu.pre.mk

#
# should check this package and refer to dependancies that are in cports
#

DISTNAME=	ncbi-blast
VERSION=	2.2.24+
CATEGORIES=	utilities
HOMEPAGE=	http://www.mpiblast.org/
MASTER_SITES=	ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/$(VERSION)
MAINTAINER=	jtang@tchpc.tcd.ie
HAS_CONFIGURE=	yes
DISTFILES = $(DISTNAME)-$(VERSION)-src.tar.gz

PKGSUBDIR=$(DISTNAME)-$(VERSION)-src/c++

EXTRAVERSION=

CONFIGURE_SCRIPT=	./configure
CONFIGURE_ARGS+=	--without-debug --with-mt --with-build-root=ReleaseMT --prefix=$(PROGRAM_PREFIX)

DESCRIPTION=	"BLAST Basic Local Alignment Search Tool"

include ../../../mk/gnu.post.mk
