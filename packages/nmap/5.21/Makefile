include ../../../mk/gnu.pre.mk

DISTNAME=	nmap
VERSION=	5.21
CATEGORIES=	network
HOMEPAGE=	http://nmap.org/
MASTER_SITES=   http://nmap.org/dist/
GNU_CONFIGURE = yes
MAINTAINER=	darach@tchpc.tcd.ie
DISTFILES = $(DISTNAME)-$(VERSION).tar.bz2

EXTRAVERSION?=

DEPENDS+= "gmake/3.81 --build-env"

DESCRIPTION=  "Nmap (\"Network Mapper\") is a free and open source (license) utility for network exploration or security auditing. "

#CONFIGURE_ARGS +=  --with-openssl=$(PREFIX_openssl)
CONFIGURE_ARGS +=  --with-libpcap=included  --with-libpcre=included  --with-liblua=included  

#do-test:
#	$(MODULE_ADD) $(BUILD_DEPENDS);   \
#	cd $(WRKSRC); \
#	make check 2>&1 | tee testlog;                                                                                                                                  

include ../../../mk/gnu.post.mk


