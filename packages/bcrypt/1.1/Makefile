include ../../../mk/gnu.pre.mk

DISTNAME=	bcrypt
VERSION=	1.1
CATEGORIES=	lib
HOMEPAGE=	http://bcrypt.sourceforge.net/
MASTER_SITES=	http://bcrypt.sourceforge.net/
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	no
HAS_CONFIGURE=	no

DEPENDS+=	"zlib/1.2.5 --build-env --lib"

DESCRIPTION=	"Bcrypt is a cross platform file encryption utility."

ALL_TARGET=	bcrypt

do-configure:
	@:

do-install:
	cd ${WRKSRC}; \
	${MAKE} PREFIX=${PROGRAM_PREFIX} install

include ../../../mk/gnu.post.mk
