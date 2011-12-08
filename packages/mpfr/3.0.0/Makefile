# $Id: Makefile,v 1.6 2002/01/24 17:11:14 eskil Exp $

include ../../../mk/gnu.pre.mk

DISTNAME=	mpfr
VERSION=	3.0.0
CATEGORIES=	system
HOMEPAGE=	http://www.mpfr.org/
MASTER_SITES=	http://www.mpfr.org/mpfr-$(VERSION)
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	yes
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

EXTRAVERSION=
DEPENDS+=	"gmp/4.3.2 --build-env --lib"

DESCRIPTION=	"The MPFR library is a C library for multiple-precision floating-point computations with correct rounding. "

include ../../../mk/gnu.post.mk
