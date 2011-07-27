# $Id: Makefile,v 1.6 2002/01/24 17:11:14 eskil Exp $

include ../../../mk/gnu.pre.mk



DISTNAME=	Python
VERSION=	3.0.1
CATEGORIES=	scripting
HOMEPAGE=	http://www.python.org/
MASTER_SITES=	http://www.python.org/ftp/python/3.0.1
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	yes
DISTFILES = $(DISTNAME)-$(VERSION).tar.bz2

EXTRAVERSION=

DESCRIPTION=	"Python is a remarkably powerful dynamic programming language that is used in a wide variety of application domains. "

CONFIGURE_ARGS +=

DO_RUN_TESTS=	yes
TEST_TARGET=	test

DEPENDS+=       "bzip2/1.0.5 --lib --build-env"
DEPENDS+=       "tk/8.5.8 --lib --build-env"
DEPENDS+=       "tcl/8.5.8 --lib --build-env"
DEPENDS+=       "ncurses/5.7 --build-env --lib"
DEPENDS+=       "readline/6.1 --build-env --lib"
DEPENDS+=       "texinfo/4.13 --build-env"
DEPENDS+=       "db/4.8.30 --lib --build-env"
DEPENDS+=       "sqlite/3.6.23.1 --lib --build-env"
DEPENDS+=       "openssl/1.0.0a --lib --build-env"
DEPENDS+=       "zlib/1.2.5 --lib --build-env"

include ../../../mk/gnu.post.mk
