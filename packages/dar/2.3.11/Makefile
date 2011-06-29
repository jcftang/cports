include ../../../mk/gnu.pre.mk

DISTNAME=	dar
VERSION=	2.3.11
CATEGORIES=	utilities
HOMEPAGE=	http://dar.linux.free.fr/
MASTER_SITES=	http://sourceforge.net/projects/dar/files/dar/2.3.11/
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	yes
DISTFILES = $(DISTNAME)-$(VERSION).tar.gz

EXTRAVERSION=

DEPENDS+=       "bzip2/1.0.5 --lib --build-env"
DEPENDS+=       "texinfo/4.13 --build-env"
DEPENDS+=       "openssl/1.0.0a --lib --build-env"
DEPENDS+=       "zlib/1.2.5 --lib --build-env"

CONFIGURE_ARGS	+= ""

DESCRIPTION=	"dar is a shell command that backs up directory trees and files."

include ../../../mk/gnu.post.mk
