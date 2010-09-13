include ../../../mk/gnu.pre.mk

DISTNAME=	xmlto
VERSION=	0.0.23
HOMEPAGE=	https://fedorahosted.org/xmlto
MASTER_SITES=	https://fedorahosted.org/releases/x/m/xmlto
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	yes

#DEPENDS=	"boost/1_44_0_openmpi_1.4.2 --lib --build-env"
#DEPENDS+=	"openmpi/1.4.2	--lib --build-env --run-env"
#DEPENDS+=	"google-perftools/1.6 --lib --build-env"
#DEPENDS+=       "expat/2.0.1 --lib --build-env"
DEPENDS+=	"libxslt/1.1.26 --lib --build-env"
DEPENDS+=	"zlib/1.2.5 --lib --build-env"

DESCRIPTION=	"xmlto is a front-end to an XSL toolchain. It chooses an appropriate stylesheet for the conversion you want and applies it using an external XSL-T processor. It also performs any necessary post-processing."

CONFIGURE_ARGS+= ""


include ../../../mk/gnu.post.mk
