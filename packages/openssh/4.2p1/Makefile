# $Id: Makefile,v 1.6 2002/01/24 17:11:14 eskil Exp $

include ../../../mk/gnu.pre.mk

DISTNAME=	openssh
VERSION=	4.2p1
CATEGORIES=	system
HOMEPAGE=	http://openssh.org
MASTER_SITES=	ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/
MAINTAINER=	gmk@caoslinux.org
GNU_CONFIGURE=	yes
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

EXTRAVERSION=

ifneq (,$(findstring osf,$(SYSTEM_TYPE_OS)))
CONFIGURE_ENV+=	
endif

DESCRIPTION=	"openssh rocks"

include ../../../mk/gnu.post.mk
