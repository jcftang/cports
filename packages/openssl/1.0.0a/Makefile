include ../../../mk/gnu.pre.mk

DISTNAME=	openssl
VERSION=	1.0.0a
CATEGORIES=	network security
HOMEPAGE=	http://www.openssl.org/
MASTER_SITES=	ftp://ftp.sunet.se/pub/security/tools/net/$(DISTNAME)/ 
MASTER_SITES+=	ftp://ftp.chl.chalmers.se/pub/unix/security/$(DISTNAME)/
MASTER_SITES+=	ftp://ftp.openssl.org/source/
MAINTAINER=	jtang@tchpc.tcd.ie
HAS_CONFIGURE=	yes
CONFIGURE_SCRIPT=./config
USE_LIBTOOL=	yes

CONFIGURE_ARGS=	--prefix=$(PROGRAM_PREFIX)
CONFIGURE_ARGS+=--openssldir=$(PROGRAM_PREFIX)
CONFIGURE_ARGS+=threads shared
#CONFIGURE_ARGS+=$(ARCH)

LINK_PATHS+=	 $(PROGRAM_PREFIX)/lib

# Experimental support for hardware encryption perpherials
#PKGNAME	= $(DISTNAME)-engine-$(VERSION)

#ifneq (,$(findstring alpha,$(SYSTEM_TYPE_CPU)))
#ARCH=	alpha-gcc
#endif
#ifneq (,$(findstring linux,$(SYSTEM_TYPE_OS)))
#ARCH=	linux-elf
#endif
#ifneq (,$(findstring solaris,$(SYSTEM_TYPE_OS)))
#ARCH=	solaris-sparcv7-gcc
#endif
#ARCH?=	gcc

DESCRIPTION=	"The OpenSSL Project is a robust, commercial-grade, full-"
DESCRIPTION+=	"featured, and Open Source toolkit implementing the Secure"
DESCRIPTION+=	"Sockets Layer (SSL v2/v3) and Transport Layer Security"
DESCRIPTION+=	"(TLS v1) protocols as well as a full-strength general"
DESCRIPTION+=	"purpose cryptography library."

include ../../../mk/gnu.post.mk
