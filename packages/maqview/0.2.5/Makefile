include ../../../mk/gnu.pre.mk

DISTNAME=	maqview
VERSION=	0.2.5
EXTRAVERSION=	
CATEGORIES=	bio
HOMEPAGE=	http://maq.sourceforge.net
MASTER_SITES=	http://downloads.sourceforge.net/project/maq/$(DISTNAME)/$(DISTNAME)-$(VERSION)
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	yes
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

DEPENDS+=	"maq/0.7.1 --build-env --run-env"
DEPENDS+=	"autoconf/2.67 --build-env"
DEPENDS+=	"automake/1.11 --build-env"

PKGSUBDIR=	$(DISTNAME)

DESCRIPTION=	"Maqview is graphical read alignment viewer. It is specifically designed for the Maq alignment file and allows you to see the mismatches, base qualities and mapping qualities"

do-patch:	do-patc%
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	sh autogen.sh
	
include ../../../mk/gnu.post.mk
