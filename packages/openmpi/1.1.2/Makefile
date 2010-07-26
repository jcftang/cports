include ../../../mk/gnu.pre.mk

DISTNAME=	openmpi
VERSION=	1.1.2
CATEGORIES=	development
HOMEPAGE=	http://www.open-mpi.org/
MASTER_SITES=	http://www.open-mpi.org/software/ompi/v1.1/downloads/
MAINTAINER=	gmk@caoslinux.org
GNU_CONFIGURE=	yes
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

EXTRAVERSION=

CONFIGURE_ARGS+= CFLAGS="-O2" CXXFLAGS="-O2" --without-mpi-profile --without-mpi-f77

ifdef ROMIO
DEPENDS += "pvfs2/2.6.1 --build-env"
CONFIGURE_ARGS+= LDFLAGS="-L$(PREFIX_pvfs)/lib"
else
CONFIGURE_ARGS+= --disable-io-romio
endif

ifneq (1,$(shell test -d /dev/infiniband && echo 1 ))
CONFIGURE_ARGS+= --without-openib
endif

DESCRIPTION=	"Open Source High Performance Computing"

include ../../../mk/gnu.post.mk
