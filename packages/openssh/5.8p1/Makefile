include ../../../mk/gnu.pre.mk

DISTNAME=	openssh
VERSION=	5.8p1
CATEGORIES=	system
HOMEPAGE=	http://openssh.org
MASTER_SITES=	ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	yes
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

EXTRAVERSION=
PATCH_STRIP= -p1

DEPENDS=	"zlib/1.2.5 --build-env --lib"
DEPENDS+=	"openssl/1.0.0a --build-env --lib"

ifneq (,$(findstring osf,$(SYSTEM_TYPE_OS)))
CONFIGURE_ENV+=	
endif

DESCRIPTION=	"openssh rocks with the ssh-hpn patch"

include ../../../mk/gnu.post.mk
