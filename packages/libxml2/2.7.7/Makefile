# $Id: Makefile,v 1.6 2002/01/24 17:11:14 eskil Exp $

include ../../../mk/gnu.pre.mk

DISTNAME=	libxml2
VERSION=	2.7.7
CATEGORIES=	system
HOMEPAGE=	http://www.xmlsoft.org/
MASTER_SITES=	ftp://www.xmlsoft.org/libxml2
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	yes
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

EXTRAVERSION=
DEPENDS+=	"zlib --build-env"

DESCRIPTION=	"Libxml2 is the XML C parser and toolkit developed for the Gnome project (but usable outside of the Gnome platform), it is free software available under the MIT License."

include ../../../mk/gnu.post.mk
