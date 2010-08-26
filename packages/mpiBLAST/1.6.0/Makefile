include ../../../mk/gnu.pre.mk

DISTNAME=	mpiBLAST
VERSION=	1.6.0
CATEGORIES=	utilities
HOMEPAGE=	http://www.mpiblast.org/
MASTER_SITES=	http://www.mpiblast.org/downloads/files/
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	no
HAS_CONFIGURE=	yes
DISTFILES = $(DISTNAME)-$(VERSION).tgz

EXTRAVERSION=

DEPENDS+="openmpi/1.4.2 --build-env --lib --run-env"
DEPENDS+="lesstif/0.95.2 --lib --build-env"

DESCRIPTION=	"Open-Source Parallel BLAST"

PKGSUBDIR=mpiblast-$(VERSION)

do-build:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); make ncbi
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); make

#do-install:
#	cd $(WRKSRC); make install

include ../../../mk/gnu.post.mk
