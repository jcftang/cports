include ../../../mk/gnu.pre.mk

DISTNAME=	openmpi
VERSION=	1.5.3
CATEGORIES=	development
HOMEPAGE=	http://www.open-mpi.org/
MASTER_SITES=	http://www.open-mpi.org/software/ompi/v1.5/downloads/
MAINTAINER=	gmk@caoslinux.org
GNU_CONFIGURE=	yes
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

EXTRAVERSION=

CONFIGURE_ARGS+= CFLAGS="-O2" CXXFLAGS="-O2" --without-mpi-profile

ifeq ($(COMPILERS),intel10.1)
CONFIGURE_ARGS+=--with-wrapper-cflags=-shared-intel
CONFIGURE_ARGS+=--with-wrapper-cxxflags=-shared-intel
endif

ifdef ROMIO
DEPENDS += "pvfs2/2.6.3 --build-env"
CONFIGURE_ARGS+= LDFLAGS="-L$(PREFIX_pvfs)/lib"
else
CONFIGURE_ARGS+= --disable-io-romio
endif

ifneq (1,$(shell test -d /dev/infiniband && echo 1 ))
CONFIGURE_ARGS+= --without-openib
else
CONFIGURE_ARGS+= --with-openib
endif

DESCRIPTION=	"Open Source High Performance Computing"

include ../../../mk/gnu.post.mk
