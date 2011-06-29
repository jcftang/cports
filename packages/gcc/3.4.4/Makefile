# $Id: Makefile,v 1.6 2002/01/24 17:11:14 eskil Exp $

include ../../../mk/gnu.pre.mk

DISTNAME=	gcc
VERSION=	3.4.4
CATEGORIES=	system
HOMEPAGE=	http://www.gnu.org/software/gcc/gcc.html
MASTER_SITES=	ftp://ftp.gnu.org/pub/gnu/gcc/gcc-$(VERSION)/
MAINTAINER=	gmk@caoslinux.org
GNU_CONFIGURE=	yes
DISTFILES = $(DISTNAME)-$(VERSION).tar.bz2

EXTRAVERSION=

CONFIGURE_ARGS += --enable-languages=c,c++,f77,objc --enable-shared --enable-threads
CONFIGURE_ARGS += --with-local-prefix=$(PROGRAM_PREFIX)
ALL_TARGET= bootstrap


DESCRIPTION=	"gcc 3.4.4 enviornment"

include ../../../mk/gnu.post.mk
