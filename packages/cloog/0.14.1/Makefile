# $Id: Makefile,v 1.6 2002/01/24 17:11:14 eskil Exp $

include ../../../mk/gnu.pre.mk

DISTNAME=	cloog
VERSION=	0.14.1
CATEGORIES=	developement
HOMEPAGE=	http://www.cloog.org/
MASTER_SITES=	http://www.bastoul.net/cloog/pages/download
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	yes
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

DEPENDS += "polylib/5.22.5 --build-env gmp/4.3.2 --build-env"

EXTRAVERSION=

DESCRIPTION=	"The CLooG Code Generator in the Polyhedral Model's Home"


include ../../../mk/gnu.post.mk
