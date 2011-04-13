include ../../../mk/gnu.pre.mk

DISTNAME=	pcc
VERSION=	1.0.0
CATEGORIES=	system
HOMEPAGE=	http://pcc.ludd.ltu.se/
MASTER_SITES=	http://pcc.ludd.ltu.se/ftp/pub/pcc-releases/
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	yes
DISTFILES = $(DISTNAME)-$(VERSION).tgz

EXTRAVERSION=

DEPENDS=	"pcc-libs/1.0.0 --lib --build-env --run-env"
DEPENDS+=	"bison/2.4.3 --build-env"
DEPENDS+=	"flex/2.5.35 --build-env"

DESCRIPTION=	"Portable C Compiler"

include ../../../mk/gnu.post.mk
