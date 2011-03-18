include ../../../mk/gnu.pre.mk

DISTNAME=	zsync
VERSION=	0.6.2
CATEGORIES=	utilities
HOMEPAGE=	http://zsync.moria.org.uk/index
MASTER_SITES=	http://zsync.moria.org.uk/download/
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	yes
DISTFILES = $(DISTNAME)-$(VERSION).tar.bz2

EXTRAVERSION=

CONFIGURE_ARGS+= CFLAGS="-O2" CXXFLAGS="-O2"

DESCRIPTION=	"zsync is a file transfer program. It allows you to download a file from"
DESCRIPTION+=    "a remote server, where you have a copy of an older version of the file"
DESCRIPTION+=    "on your computer already. zsync downloads only the new parts of the file."

include ../../../mk/gnu.post.mk
