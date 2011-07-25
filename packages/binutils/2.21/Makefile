include ../../../mk/gnu.pre.mk

DISTNAME=	binutils
VERSION=	2.21
CATEGORIES=	devel
HOMEPAGE=	http://www.gnu.org/software/binutils/binutils.html
MASTER_SITES=	$(MASTER_SITE_GNU:=$(DISTNAME)/)
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	yes

DEPENDS+=       "texinfo/4.13 --build-env"

CONFIGURE_ARGS+= --enable-shared

DESCRIPTION=	"Tools to produce, examine and manipulate executable"
DESCRIPTION+=	"binaries and libraries"

include ../../../mk/gnu.post.mk
