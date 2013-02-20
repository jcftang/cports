# $Id: Makefile,v 1.6 2002/01/24 17:11:14 eskil Exp $

include ../../../mk/gnu.pre.mk

DISTNAME=       gcc
VERSION=        4.0.1
CATEGORIES=     system
HOMEPAGE=       http://www.gnu.org/software/gcc/gcc.html
MASTER_SITES=   ftp://ftp.gnu.org/pub/gnu/gcc/gcc-$(VERSION)/
MAINTAINER=     gmk@caoslinux.org
GNU_CONFIGURE=  yes
DISTFILES = $(DISTNAME)-$(VERSION).tar.bz2
WRKSRC=$(WORKDIR)/$(PKGSUBDIR)-tmp/

EXTRAVERSION=

DEPENDS += "gnu/gmp/4.1.4 --build-env"

CONFIGURE_ARGS += --enable-shared --enable-threads=posix --with-system-zlib
CONFIGURE_ARGS += --enable-__cxa_atexit --disable-libunwind-exceptions
CONFIGURE_ARGS += --enable-languages=c,c++,f95 --disable-libada
CONFIGURE_ARGS += --with-local-prefix=$(PROGRAM_PREFIX)
CONFIGURE_ARGS += --with-gmp=$(PREFIX_gmp)

ALL_TARGET= bootstrap


DESCRIPTION=    "gcc 4.0.1 enviornment"

include ../../../mk/gnu.post.mk

