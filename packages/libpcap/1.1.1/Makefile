include ../../../mk/gnu.pre.mk

DISTNAME=	libpcap
VERSION=	1.1.1
CATEGORIES=	network
HOMEPAGE=	www.tcpdump.org
MASTER_SITES=   http://www.tcpdump.org/release
GNU_CONFIGURE = yes
MAINTAINER=	darach@tchpc.tcd.ie
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

EXTRAVERSION?=

DEPENDS+= "flex/2.5.35 --build-env"
DEPENDS+= "bison/2.4.2 --build-env"

DESCRIPTION=  "A portable C/C++ library for network traffic capture."

CONFIGURE_ARGS +=

#do-test:
#	$(MODULE_ADD) $(BUILD_DEPENDS);   \
#	cd $(WRKSRC); \
#	make check 2>&1 | tee testlog;

include ../../../mk/gnu.post.mk


