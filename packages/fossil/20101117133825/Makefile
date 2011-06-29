include ../../../mk/gnu.pre.mk

DISTNAME=       fossil
VERSION=        20101117133825
CATEGORIES=     devel
HOMEPAGE=       http://www.fossil-scm.org
MASTER_SITES=   http://www.fossil-scm.org/download
MAINTAINER=     jtang@tchpc.tcd.ie
DISTFILES=	$(DISTNAME)-src-$(VERSION).tar.gz
HAS_CONFIGURE=  no

PKGSUBDIR=	$(DISTNAME)-src-$(VERSION)

DEPENDS+= "openssl/1.0.0a --lib --build-env"
DEPENDS+= "zlib/1.2.5 --lib --build-env"

DESCRIPTION=    "Fossil: Simple, high-reliability, distributed software configuration management"

do-install:
	$(INSTALL) -d $(PROGRAM_PREFIX)/bin
	$(INSTALL) -c -m 555 $(WRKSRC)/fossil $(PROGRAM_PREFIX)/bin/fossil

include ../../../mk/gnu.post.mk

