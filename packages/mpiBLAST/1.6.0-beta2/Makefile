include ../../../mk/gnu.pre.mk

DISTNAME=	mpiBLAST
VERSION=	1.6.0-beta2
CATEGORIES=	utilities
HOMEPAGE=	http://www.mpiblast.org/
MASTER_SITES=	http://www.mpiblast.org/downloads/files/
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	yes
DISTFILES = $(DISTNAME)-$(VERSION).tgz

EXTRAVERSION=

DEPENDS+="openmpi/1.4.2 --build-env openmpi/1.4.2 --run-env"

CONFIGURE_ARGS+= CFLAGS="-O2" CXXFLAGS="-O2"

DESCRIPTION=	"Open-Source Parallel BLAST"


PKGNAME?=mpiblast-1.6.0
#PKGSUBDIR?=mpiblast-1.6.0
#WRKSRC?=$(WORKDIR)/mpiblast-1.6.0

do-build:
	cd $(WRKSRC); make ncbi
	cd $(WRKSRC); make

#do-install:
#	cd $(WRKSRC); make install

include ../../../mk/gnu.post.mk
