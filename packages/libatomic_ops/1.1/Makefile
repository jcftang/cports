include ../../../mk/gnu.pre.mk

DISTNAME=	libatomic_ops
VERSION=	1.1
CATEGORIES=	system
HOMEPAGE=	http://www.hpl.hp.com/research/linux/atomic_ops/
MASTER_SITES=	http://www.hpl.hp.com/research/linux/atomic_ops/download
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	yes
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

EXTRAVERSION=

CONFIGURE_ARGS+= CFLAGS="-O2" CXXFLAGS="-O2"

DESCRIPTION=    "Provides implementations for atomic memory update operations on a number"
DESCRIPTION+=    "of architectures. This allows direct use of these in reasonably portable"
DESCRIPTION+=    "code. Unlike earlier similar packages, this one explicitly considers"
DESCRIPTION+=    "memory barrier semantics, and allows the construction of code that"
DESCRIPTION+=    "involves minimum overhead across a variety of architectures."

include ../../../mk/gnu.post.mk
