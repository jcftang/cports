include ../../../mk/gnu.pre.mk

DISTNAME=	par2cmdline
VERSION=	0.4
CATEGORIES=	system
HOMEPAGE=	http://sourceforge.net/projects/parchive
MASTER_SITES=	http://downloads.sourceforge.net/project/parchive/$(DISTNAME)/$(VERSION)/
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	yes
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

EXTRAVERSION=

DEPENDS=	"autoconf/2.67 --build-env"
DEPENDS+=	"automake/1.8.5 --build-env"

PATCH_STRIP=-p1

DESCRIPTION=	"parchive - Providing a tool to apply the data-recovery capability concepts of RAID-like systems to the posting & recovery of multi-part archives on Usenet."

include ../../../mk/gnu.post.mk
