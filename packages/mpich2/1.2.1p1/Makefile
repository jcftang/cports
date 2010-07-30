include ../../../mk/gnu.pre.mk

DISTNAME=	mpich2
VERSION=	1.2.1p1
CATEGORIES=	development
HOMEPAGE=	http://www.mcs.anl.gov/research/projects/mpich2/
MASTER_SITES=	http://www.mcs.anl.gov/research/projects/mpich2/downloads/tarballs/$(VERSION)
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	yes
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

EXTRAVERSION=

CONFIGURE_ARGS+= 

DEPENDS+="openpa/1.0.2 --lib"

DESCRIPTION=	"MPICH2 is a high-performance and widely portable implementation of the Message Passing Interface (MPI) standard (both MPI-1 and MPI-2)."

include ../../../mk/gnu.post.mk
