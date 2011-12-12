# $Id: Makefile,v 1.3 2001/10/30 14:02:21 eskil Exp $

include ../../../mk/gnu.pre.mk

DISTNAME=	groff
VERSION=	1.20
CATEGORIES=	system
HOMEPAGE=	http://www.gnu.org/software/groff/groff.html
MASTER_SITES=	$(MASTER_SITE_GNU:=$(DISTNAME)/)
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	yes

DEPENDS=	"bison/2.4.2 --build-env"
DEPENDS+=	"netpbm/10.35.77 --build-env --run-env"

DESCRIPTION=	"Groff (GNU Troff) is a document processor which reads plain"
DESCRIPTION+=	"text mixed with formatting commands and produces formatted"
DESCRIPTION+=	"output."

include ../../../mk/gnu.post.mk
