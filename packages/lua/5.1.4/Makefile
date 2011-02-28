include ../../../mk/gnu.pre.mk

DISTNAME=	lua
VERSION=	5.1.4
CATEGORIES=	devel
HOMEPAGE=	http://www.lua.org
MASTER_SITES=	http://www.lua.org/ftp
MAINTAINER=	jtang@tchpc.tcd.ie
HAS_CONFIGURE=	no
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

EXTRAVERSION=

DESCRIPTION=	"Lua is a powerful, fast, lightweight, embeddable scripting languag"

ALL_TARGET=linux

DEPENDS+=	"readline/6.1 --lib --build-env"
DEPENDS+=	"ncurses/5.7 --lib --build-env"

do-build:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
        cd $(WRKSRC); \
	 $(MAKE) CC='gcc -fPIC '  INSTALL_TOP=$(PROGRAM_PREFIX) $(ALL_TARGET)

do-install:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
        cd $(WRKSRC); \
	$(MAKE) INSTALL_TOP=$(PROGRAM_PREFIX) install

include ../../../mk/gnu.post.mk
