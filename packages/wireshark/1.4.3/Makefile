include ../../../mk/gnu.pre.mk

DISTNAME=	wireshark
VERSION=	1.4.3
CATEGORIES=	network
HOMEPAGE=	http://www.wireshark.org
MASTER_SITES=	http://media-2.cacetech.com/wireshark/src
GNU_CONFIGURE = yes
HAS_CONFIGURE = yes
MAINTAINER=	darach@tchpc.tcd.ie
DISTFILES = $(DISTNAME)-$(VERSION).tar.bz2

EXTRAVERSION?=


DEPENDS+= "glib/2.24.1 --build-env --lib"
DEPENDS+= "gtk+/2.20.1 --build-env --lib"
DEPENDS+= "libpcap/1.1.1 --build-env --lib"
DEPENDS+= "zlib/1.2.5 --build-env --lib"
DEPENDS+= "pcre/8.10 --build-env --lib"
DEPENDS+= "openssl/1.0.0a --build-env --lib"
DEPENDS+= "lua/5.1.4 --build-env --lib"
DEPENDS+= "libgcrypt/1.4.6 --build-env --lib"
DEPENDS+= "gnutls/2.10.0 --build-env --lib"

DESCRIPTION=  "Wireshark is the world's foremost network protocol analyzer. It lets you capture and interactively browse the traffic running on a computer network. It is the de facto (and often de jure) standard across many industries and educational institutions."


#ENVIRONMENT += PKG_CONFIG_PATH=$(PREFIX_gnutls):$PKG_CONFIG_PATH

CONFIGURE_ARGS +=  --with-pcap=$(PREFIX_libpcap)
CONFIGURE_ARGS +=  --with-zlib=$(PREFIX_zlib)
CONFIGURE_ARGS +=  --with-pcre=$(PREFIX_pcre)
CONFIGURE_ARGS +=  --with-ssl=$(PREFIX_openssl)
CONFIGURE_ARGS +=  --with-lua=$(PREFIX_lua)
CONFIGURE_ARGS +=  --with-libgcrypt-prefix=$(PREFIX_libgcrypt)


#do-test:
#	$(MODULE_ADD) $(BUILD_DEPENDS);   \
#	cd $(WRKSRC); \
#	make check 2>&1 | tee testlog;

include ../../../mk/gnu.post.mk


