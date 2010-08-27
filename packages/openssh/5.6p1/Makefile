include ../../../mk/gnu.pre.mk

DISTNAME=	openssh
VERSION=	5.6p1
CATEGORIES=	system
HOMEPAGE=	http://openssh.org
MASTER_SITES=	ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	yes
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

EXTRAVERSION=

ifneq (,$(findstring osf,$(SYSTEM_TYPE_OS)))
CONFIGURE_ENV+=	
endif

DESCRIPTION=	"openssh rocks"

include ../../../mk/gnu.post.mk
