include ../../../mk/gnu.pre.mk

DISTNAME=	bootstrap
VERSION=	1.0
CATEGORIES=	system
MAINTAINER=	jtang@tchpc.tcd.ie
HAS_CONFIGURE=	no
DISTFILES=

DONT_CREATE_METAINFO=yes

#DEPENDS=	"gmake --build-env"
#DEPENDS+=	"wget --build-env"
#DEPENDS+=	"gtar --build-env"

DEPENDS+=	"texinfo/4.13 --build-env"
DEPENDS+=	"gmake/3.81 --build-env"
DEPENDS+=	"wget/1.9.1 --build-env"
DEPENDS+=	"libiconv/1.13 --lib --build-env"
DEPENDS+=	"gettext/0.18.1.1 --lib --build-env"
DEPENDS+=	"libtool/2.2.10 --build-env"

do-build:
	(cd ../../texinfo/4.13/ && make build)
	(cd ../../gmake/3.81/ && make build)
	(cd ../../wget/1.9.1/ && make build)
	(cd ../../libiconv/1.13/ && make build)
	(cd ../../gettext/0.18.1.1/ && make build)
	(cd ../../libtool/2.2.10/ && make build)

do-install:
	(cd ../../texinfo/4.13/ && make install)
	(cd ../../gmake/3.81/ && make install)
	(cd ../../wget/1.9.1/ && make install)
	(cd ../../libiconv/1.13/ && make install)
	(cd ../../gettext/0.18.1.1/ && make install)
	(cd ../../libtool/2.2.10/ && make install)

include ../../../mk/gnu.post.mk
