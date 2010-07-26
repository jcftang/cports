include ../../../mk/gnu.pre.mk

DISTNAME=	mpiBLAST
VERSION=	1.5.0-pio
CATEGORIES=	utilities
HOMEPAGE=	http://www.mpiblast.org/
MASTER_SITES=	http://www.mpiblast.org/downloads/files/
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	yes
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

EXTRAVERSION=

CONFIGURE_ARGS+= CFLAGS="-O2" CXXFLAGS="-O2"

DESCRIPTION=	"Open-Source Parallel BLAST"

include ../../../mk/gnu.post.mk
