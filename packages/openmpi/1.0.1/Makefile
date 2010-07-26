# $Id: Makefile,v 1.6 2002/01/24 17:11:14 eskil Exp $

include ../../../mk/gnu.pre.mk

DISTNAME=	openmpi
VERSION=	1.0.1
CATEGORIES=	development
HOMEPAGE=	http://www.open-mpi.org/
MASTER_SITES=	http://www.open-mpi.org/software/ompi/v1.0/downloads/
MAINTAINER=	gmk@caoslinux.org
GNU_CONFIGURE=	yes
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

EXTRAVERSION=

CONFIGURE_ARGS+= CFLAGS="-O2" CXXFLAGS="-O2" --without-mpi-profile --disable-io-romio --enable-debug

DESCRIPTION=	"Open Source High Performance Computing"

include ../../../mk/gnu.post.mk
