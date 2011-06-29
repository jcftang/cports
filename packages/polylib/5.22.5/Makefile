# $Id: Makefile,v 1.6 2002/01/24 17:11:14 eskil Exp $

include ../../../mk/gnu.pre.mk

DISTNAME=	polylib
VERSION=	5.22.5
CATEGORIES=	system
HOMEPAGE=	http://icps.u-strasbg.fr/PolyLib/
MASTER_SITES=	http://icps.u-strasbg.fr/PolyLib/polylib_src/
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	yes
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

EXTRAVERSION=

DEPENDS+= "gmp/4.3.2 --build-env --lib"

DESCRIPTION=	"PolyLib - A library of polyhedral functions"


include ../../../mk/gnu.post.mk
