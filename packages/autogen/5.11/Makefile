include ../../../mk/gnu.pre.mk

DISTNAME=	autogen
VERSION=	5.11
CATEGORIES=	devel
HOMEPAGE=	http://www.gnu.org/software/autogen/
MASTER_SITES=	$(MASTER_SITE_GNU:=$(DISTNAME)/)rel$(VERSION)/
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	yes
USE_LIBTOOL=	yes

DEPENDS=	"guile --build-env"
DEPENDS+=	"texinfo --build-env"
#DEPENDS+=	"libxml2 --build-env"
DEPENDS+=	"coreutils --build-env"

LINK_PATHS+=	$(PROGRAM_PREFIX)/lib

# Need to run binaries out of the build-tree.
#ENVIRONMENT+=	LD_LIBRARY_PATH=$(WRKSRC)/autoopts/.libs
ENVIRONMENT+= CONFIG_SHELL=/bin/sh

CONFIGURE_ARGS+=--with-libxml2=$(PREFIX_libxml2)

DESCRIPTION=	"AutoGen is a tool designed to simplify the creation and"
DESCRIPTION+=	"maintenance of programs that contain large amounts of"
DESCRIPTION+=	"repetitious text. It is especially valuable in programs"
DESCRIPTION+=	"that have several blocks of text that must be kept"
DESCRIPTION+=	"synchronized."


include ../../../mk/gnu.post.mk

