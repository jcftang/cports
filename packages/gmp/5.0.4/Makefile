# $Id: Makefile,v 1.6 2002/01/24 17:11:14 eskil Exp $

include ../../../mk/gnu.pre.mk

DISTNAME=	gmp
VERSION=	5.0.4
CATEGORIES=	system
HOMEPAGE=	http://www.swox.com/gmp/
MASTER_SITES=	ftp://ftp.gmplib.org/pub/gmp-$(VERSION)
#ftp://ftp.gmplib.org/pub/gmp-5.0.4/gmp-5.0.4.tar.bz2
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	yes
DISTFILES = $(DISTNAME)-$(VERSION).tar.bz2

EXTRAVERSION=

DESCRIPTION=	"GMP: a free library for arbitrary precision arithmetic"

CONFIGURE_ARGS += "--enable-mpfr"

include ../../../mk/gnu.post.mk
