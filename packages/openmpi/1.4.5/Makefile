include ../../../mk/gnu.pre.mk

DISTNAME=	openmpi
VERSION=	1.4.5
CATEGORIES=	development
HOMEPAGE=	http://www.open-mpi.org/
MASTER_SITES=	http://www.open-mpi.org/software/ompi/v1.4/downloads/
MAINTAINER=	gmk@caoslinux.org
GNU_CONFIGURE=	yes
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

EXTRAVERSION=

CONFIGURE_ARGS+= CFLAGS="-O2" CXXFLAGS="-O2" --with-threads

CONFIGURE_ARGS+=$(if $(findstring intel,$(COMPILERS)),--with-wrapper-cflags=-shared-intel, )
CONFIGURE_ARGS+=$(if $(findstring intel,$(COMPILERS)),--with-wrapper-cxxflags=-shared-intel, )

#ifdef ROMIO
#$(info ROMIOOOOOOOOOOOOO)
#DEPENDS += "pvfs2/2.8.2 --build-env"
#CONFIGURE_ARGS+= LDFLAGS="-L$(PREFIX_pvfs)/lib"
#else
#CONFIGURE_ARGS+= --disable-io-romio
#endif

ifneq (1,$(shell test -d /dev/infiniband && echo 1 ))
CONFIGURE_ARGS+= --without-openib
else
CONFIGURE_ARGS+= --with-openib
endif

$(info configure args:  $(CONFIGURE_ARGS))

DESCRIPTION=	"Open Source MPI library"

include ../../../mk/gnu.post.mk
