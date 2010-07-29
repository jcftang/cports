# $Id: Makefile,v 1.6 2002/01/24 17:11:14 eskil Exp $

include ../../../mk/gnu.pre.mk

DISTNAME=	libxslt
VERSION=	1.1.26
CATEGORIES=	system
HOMEPAGE=	http://www.xmlsoft.org/
MASTER_SITES=	ftp://www.xmlsoft.org/libxslt
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	yes
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

EXTRAVERSION=
DEPENDS+=	"libxml2/2.7.7 --build-env "
DEPENDS+=	"zlib --build-env"
DEPENDS+=	"Python/2.6.5 --build-env "

DESCRIPTION=	"libxslt"

include ../../../mk/gnu.post.mk
