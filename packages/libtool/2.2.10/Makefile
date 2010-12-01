# $Id: Makefile,v 1.6 2002/01/24 17:11:14 eskil Exp $

include ../../../mk/gnu.pre.mk

DISTNAME=	libtool
VERSION=	2.2.10
CATEGORIES=	system
HOMEPAGE=	http://www.gnu.org/software/libtool
MASTER_SITES=	http://ftp.gnu.org/gnu/libtool
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	yes
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

EXTRAVERSION=

ifndef BOOTSTRAP
DEPENDS+=       "m4/1.4.15 --build-env"
DEPENDS+=       "gawk/3.1.8 --build-env"
DEPENDS+=       "automake/1.11 --build-env"

ENVIRONMENT+=   AUTOMAKE=$(PREFIX_automake)/bin/automake

MODULEFILE_CMD_ENV=     $(ECHO) "prepend-path   ACLOCAL_PATH    $(PROGRAM_PREFIX)/share/aclocal";
MODULEFILE_LINES+=      ENV
endif

DESCRIPTION=    "GNU libtool is a generic library support script."
DESCRIPTION+=   "Libtool hides the complexity of using shared libraries"
DESCRIPTION+=   "behind a consistent, portable interface."


ifndef BOOTSTRAP
do-configure:   do-autoreconf do-configur%
endif

include ../../../mk/gnu.post.mk
