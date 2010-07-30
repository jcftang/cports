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

DEPENDS+=       "m4 --build-env"
DEPENDS+=       "gawk --build-env"
DEPENDS+=       "automake --build-env"
#DEPENDS+=       "autoconf --build-env"

ENVIRONMENT+=   AUTOMAKE=$(PREFIX_automake)/bin/automake

MODULEFILE_CMD_ENV=     $(ECHO) "prepend-path   ACLOCAL_PATH    $(PROGRAM_PREFIX)/share/aclocal";
MODULEFILE_LINES+=      ENV

DESCRIPTION=    "GNU libtool is a generic library support script."
DESCRIPTION+=   "Libtool hides the complexity of using shared libraries"
DESCRIPTION+=   "behind a consistent, portable interface."

do-configure:   do-autoreconf do-configur%

include ../../../mk/gnu.post.mk
