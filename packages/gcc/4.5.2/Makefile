# $Id: Makefile,v 1.6 2002/01/24 17:11:14 eskil Exp $

include ../../../mk/gnu.pre.mk

DISTNAME=       gcc
VERSION=        4.5.2
CATEGORIES=     system
HOMEPAGE=       http://www.gnu.org/software/gcc/gcc.html
MASTER_SITES=   ftp://ftp.gnu.org/pub/gnu/gcc/gcc-$(VERSION)/
MAINTAINER=     jtang@tchpc.tcd.ie
GNU_CONFIGURE=  yes
DISTFILES = $(DISTNAME)-$(VERSION).tar.bz2
WRKSRC=$(WORKDIR)/$(PKGSUBDIR)-tmp/

EXTRAVERSION=

DEPENDS += "gmp/4.3.2 --build-env --lib"
DEPENDS += "mpfr/3.0.0 --build-env --lib"
DEPENDS += "mpc/0.8.2 --build-env --lib"
DEPENDS += "libelf/0.8.13 --build-env --lib"
DEPENDS += "polylib/5.22.5 --build-env --lib"
DEPENDS += "cloog/0.14.1 --build-env --lib" 

CONFIGURE_ARGS += --enable-shared --enable-threads=posix --with-system-zlib
CONFIGURE_ARGS += --enable-__cxa_atexit --disable-libunwind-exceptions
CONFIGURE_ARGS += --enable-languages=c,c++,fortran --disable-libada
CONFIGURE_ARGS += --with-local-prefix=$(PROGRAM_PREFIX)
CONFIGURE_ARGS += --with-gmp=$(PREFIX_gmp)
CONFIGURE_ARGS += --with-mpfr=$(PREFIX_mpfr)
CONFIGURE_ARGS += --with-mpc=$(PREFIX_mpc)
CONFIGURE_ARGS += --with-cloog=$(PREFIX_cloog)
CONFIGURE_ARGS += --with-libelf=$(PREFIX_libelf)
CONFIGURE_ARGS += --disable-multilib


ALL_TARGET= bootstrap


DESCRIPTION=    "gcc 4.5.2 enviornment"

include ../../../mk/gnu.post.mk

