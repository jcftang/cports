include ../../../mk/gnu.pre.mk

DISTNAME=	9base
VERSION=	6
CATEGORIES=	system
HOMEPAGE=	http://tools.suckless.org/9base
MASTER_SITES=	http://dl.suckless.org/tools/
MAINTAINER=	jtang@tchpc.tcd.ie
HAS_CONFIGURE=	no
DISTFILES= 	$(DISTNAME)-$(VERSION).tar.gz
EXTRAVERSION=

DESCRIPTION=	"9base is a port of various original Plan 9 tools for Unix, based on plan9port."

do-build:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	$(MAKE) PREFIX=$(PROGRAM_PREFIX) all

do-install:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	$(MAKE) PREFIX=$(PROGRAM_PREFIX) install


include ../../../mk/gnu.post.mk
