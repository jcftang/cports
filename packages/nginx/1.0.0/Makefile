include ../../../mk/gnu.pre.mk

DISTNAME=	nginx
VERSION=	1.0.0
CATEGORIES=	system
HOMEPAGE=	http://nginx.org/en/
MASTER_SITES=	http://nginx.org/download/
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	no
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

EXTRAVERSION=

DEPENDS+= "openssl/1.0.0a --lib --build-env"
DEPENDS+= "zlib/1.2.5 --lib --build-env"
DEPENDS+= "pcre/8.10 --lib --build-env"
DEPENDS+= "libatomic_ops/1.1 --lib --build-env"
DEPENDS+= "libaio/0.3.109 --lib --build-env"

ALL_TARGET=	build

DESCRIPTION=	"nginx [engine x] is a HTTP and reverse proxy server, as well as a mail proxy server written by Igor Sysoev."

do-configure:
	$(MODULE_ADD) $(BUILD_DEPENDS) ;\
	cd $(WRKSRC) ;\
	./configure --prefix=$(PROGRAM_PREFIX) \
	--with-libatomic \
	--with-ipv6 \
	--with-file-aio

include ../../../mk/gnu.post.mk
