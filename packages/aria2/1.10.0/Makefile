include ../../../mk/gnu.pre.mk

DISTNAME=	aria2
VERSION=	1.10.0
CATEGORIES=	utilities
HOMEPAGE=	http://aria2.sourceforge.net/
MASTER_SITES=	http://downloads.sourceforge.net/project/aria2/stable/aria2-$(VERSION)/
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	yes
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

EXTRAVERSION=

#DEPENDS+="gcc/4.5.0 --build-env gcc/4.5.0 --run-env"
DEPENDS+="sqlite/3.6.23.1 --build-env"
DEPENDS+="libxml2/2.7.7 --build-env"
DEPENDS+="c-ares/1.7.3 --build-env"

CONFIGURE_ARGS+= 

DESCRIPTION=	"aria2 is a multi-protocol & multi-source, cross platform download utility."

include ../../../mk/gnu.post.mk
