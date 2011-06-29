include ../../../mk/gnu.pre.mk

DISTNAME=	atomic
VERSION=	1.0.0
CATEGORIES=	system
HOMEPAGE=	http://www.ioremap.net/projects/libatomic/
MASTER_SITES=	http://www.ioremap.net/archive/libatomic/
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	yes
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

EXTRAVERSION=

CONFIGURE_ARGS+= CFLAGS="-O2" CXXFLAGS="-O2"

DESCRIPTION=    "Libatomic provides arch-independant API for the low-level atomic"
DESCRIPTION+=    "implementation. Library supports x86 (both i386 and x86_64), PPC64,"
DESCRIPTION+=    "Sparc64 (v9 and higher) and with modern gcc (version higher than 4.1.0)"
DESCRIPTION+=    "and its __sync extensions all its supported platforms."

include ../../../mk/gnu.post.mk
