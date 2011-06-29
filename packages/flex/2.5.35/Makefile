# $Id: Makefile,v 1.7 2001/11/02 09:30:03 eskil Exp $

include ../../../mk/gnu.pre.mk

DISTNAME=	flex
VERSION=	2.5.35
CATEGORIES=	devel
HOMEPAGE=	http://www.gnu.org/software/flex/flex.html
MASTER_SITES=	http://downloads.sourceforge.net/project/$(DISTNAME)/$(DISTNAME)/$(DISTNAME)-$(VERSION)
#PKGSUBDIR=	$(DISTNAME)-2.5.4
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	yes

DEPENDS=	"bison/2.4.2 --build-env"
DEPENDS+=	"coreutils/8.5 --build-env"
DEPENDS+=	"texinfo/4.13 --build-env"

DESCRIPTION=	"Flex is a fast lexical analyser generator. It is a tool for"
DESCRIPTION+=	"generating programs that perform pattern-matching on text."
DESCRIPTION+=	"There are many applications for Flex, including writing"
DESCRIPTION+=	"compilers in conjunction with GNU Bison. Flex is a free"
DESCRIPTION+=	"implementation of the well known Lex program. It features a"
DESCRIPTION+=	"Lex compatibility mode, and also provides several new"
DESCRIPTION+=	"features such as exclusive start conditions."

include ../../../mk/gnu.post.mk
