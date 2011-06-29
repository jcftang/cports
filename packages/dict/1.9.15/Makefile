include ../../../mk/gnu.pre.mk

DISTNAME=	dict
VERSION=	1.9.15
CATEGORIES=	authoring
HOMEPAGE=	http://www.dict.org/
MASTER_SITES=	ftp://ftp.dict.org/dict/
MAINTAINER=	gmk@caoslinux.org
GNU_CONFIGURE=	yes
DISTFILES = dictd-$(VERSION).tar.gz
DISTNAME = dictd

EXTRAVERSION=

DESCRIPTION=	"dict(1) is a client which can access DICT servers from the command line."

install-post:
	mkdir -p $(PROGRAM_PREFIX)/etc
	echo "server dict.org" > $(PROGRAM_PREFIX)/etc/dict.conf

include ../../../mk/gnu.post.mk
