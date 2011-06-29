# $Id: Makefile,v 1.6 2002/01/24 17:11:14 eskil Exp $

include ../../../mk/gnu.pre.mk

DISTNAME=	cloog-ppl
VERSION=	0.15.9
CATEGORIES=	system
HOMEPAGE=	ftp://gcc.gnu.org/pub/gcc/infrastructure/
MASTER_SITES=	ftp://gcc.gnu.org/pub/gcc/infrastructure/
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	yes
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

EXTRAVERSION=

DEPENDS+= "ppl/0.10.2 --build-env --lib"
DEPENDS+= "gmp/4.3.2 --build-env --lib"
DEPENDS+= "polylib/5.22.5 --build-env --lib"

CONFIGURE_ARGS += --with-polylib-dir=$(PREFIX_polylib)
CONFIGURE_ARGS += --with-gmp=$(PREFIX_gmp)
CONFIGURE_ARGS += --with-ppl=$(PREFIX_ppl)

DESCRIPTION=	"CLooG is a software which generates loops for scanning Z-polyhedra."


include ../../../mk/gnu.post.mk
