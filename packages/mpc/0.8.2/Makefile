# $Id: Makefile,v 1.6 2002/01/24 17:11:14 eskil Exp $

include ../../../mk/gnu.pre.mk

DISTNAME=	mpc
VERSION=	0.8.2
CATEGORIES=	system
HOMEPAGE=	http://www.multiprecision.org/
MASTER_SITES=	http://www.multiprecision.org/mpc/download
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	yes
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

DEPENDS += "gmp/4.3.2 --build-env mpfr/3.0.0 --build-env"
EXTRAVERSION=

DESCRIPTION=	"Mpc is a C library for the arithmetic of complex numbers with arbitrarily high precision and correct rounding of the result."

include ../../../mk/gnu.post.mk
