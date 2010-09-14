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

do-build:
	(cd ../../texinfo/4.13/ && make BOOTSTRAP=yes build)
	(cd ../../gmake/3.81/ && make BOOTSTRAP=yes build)
	(cd ../../wget/1.9.1/ && make BOOTSTRAP=yes build)
	(cd ../../libiconv/1.13/ && make BOOTSTRAP=yes build)
	(cd ../../gettext/0.18.1.1/ && make BOOTSTRAP=yes build)
	(cd ../../libtool/2.2.10/ && make BOOTSTRAP=yes build)

do-install:
	(cd ../../texinfo/4.13/ && make BOOTSTRAP=yes install)
	(cd ../../gmake/3.81/ && make BOOTSTRAP=yes install)
	(cd ../../wget/1.9.1/ && make BOOTSTRAP=yes install)
	(cd ../../libiconv/1.13/ && make BOOTSTRAP=yes install)
	(cd ../../gettext/0.18.1.1/ && make BOOTSTRAP=yes install)
	(cd ../../libtool/2.2.10/ && make BOOTSTRAP=yes install)

include ../../../mk/gnu.post.mk
