# $Id: Makefile,v 1.6 2002/01/24 17:11:14 eskil Exp $

include ../../../mk/gnu.pre.mk

DISTNAME=	cloog-ppl
VERSION=	0.15.8
CATEGORIES=	system
HOMEPAGE=	ftp://gcc.gnu.org/pub/gcc/infrastructure/
MASTER_SITES=	ftp://gcc.gnu.org/pub/gcc/infrastructure/
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	yes
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

EXTRAVERSION=

DEPENDS+= "ppl/0.10.2 --build-env"

DESCRIPTION=	"CLooG is a software which generates loops for scanning Z-polyhedra."


include ../../../mk/gnu.post.mk
