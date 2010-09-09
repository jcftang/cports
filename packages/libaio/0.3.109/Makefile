include ../../../mk/gnu.pre.mk

DISTNAME=	libaio
VERSION=	0.3.109
HOMEPAGE=	http://git.kernel.org/?p=libs/libaio/libaio.git;a=summary
MASTER_SITES=	ftp://ftp.kernel.org/pub/linux/libs/aio
MAINTAINER=	jtang@tchpc.tcd.ie
HAS_CONFIGURE=	no
DISTFILES=	$(DISTNAME)-$(VERSION).tar.bz2

DESCRIPTION="The Linux-native asynchronous I/O facility (aio) library"

do-build:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	$(MAKE) prefix=$(PROGRAM_PREFIX)

do-install:
	$(MODULE_ADD) $(BUILD_DEPENDS);   \
	cd $(WRKSRC); \
	$(MAKE) prefix=$(PROGRAM_PREFIX) install

include ../../../mk/gnu.post.mk
