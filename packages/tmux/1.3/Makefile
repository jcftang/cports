include ../../../mk/gnu.pre.mk

DISTNAME=	tmux
VERSION=	1.3
CATEGORIES=	utilities
HOMEPAGE=	https://sourceforge.net/projects/tmux
MASTER_SITES=	https://downloads.sourceforge.net/project/tmux/tmux/tmux-$(VERSION)/
MAINTAINER=	jtang@tchpc.tcd.ie
HAS_CONFIGURE=	no
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

EXTRAVERSION=

DEPENDS+=	"ncurses/5.7 --lib --build-env"
DEPENDS+=	"libevent/1.4.14b --lib --build-env"

DESCRIPTION=	"tmux is a terminal multiplexer"

do-build:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	./configure; \
	$(MAKE)

do-install:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	$(MAKE) PREFIX=$(PROGRAM_PREFIX) install

include ../../../mk/gnu.post.mk
