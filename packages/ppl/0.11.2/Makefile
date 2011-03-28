# $Id: Makefile,v 1.6 2002/01/24 17:11:14 eskil Exp $

include ../../../mk/gnu.pre.mk

DISTNAME=	ppl
VERSION=	0.11.2
CATEGORIES=	system
HOMEPAGE=	http://www.cs.unipr.it/ppl/
MASTER_SITES=	http://www.cs.unipr.it/ppl/Download/ftp/releases/$(VERSION)
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	yes
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

EXTRAVERSION=
DEPENDS+=	"gmp/4.3.2 --build-env --lib"

DESCRIPTION=	"The Parma Polyhedra Library (PPL) provides numerical abstractions"
DESCRIPTION+=    "especially targeted at applications in the field of analysis and"
DESCRIPTION+=    "verification of complex systems."

include ../../../mk/gnu.post.mk
