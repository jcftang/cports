include ../../../mk/gnu.pre.mk

DISTNAME=	xz
VERSION=	5.0.1
CATEGORIES=	archive
HOMEPAGE=	http://tukaani.org/xz
MASTER_SITES=	http://tukaani.org/xz
MAINTAINER=	jtang@tchpc.tcd.ie
GNU_CONFIGURE=	yes

DEPENDS+=	"autoconf/2.67 --build-env"
DEPENDS+=	"automake/1.11 --build-env"
DEPENDS+=	"gettext/0.18.1.1 --build-env --lib"
DEPENDS+=	"libtool/2.2.10 --build-env"

DESCRIPTION=    "XZ Utils is free general-purpose data compression software with"
DESCRIPTION+=    "high compression ratio. XZ Utils were written for POSIX-like systems"
DESCRIPTION+=    "(GNU/Linux, *BSDs, etc.), but also work on some not-so-POSIX systems"
DESCRIPTION+=    "like Windows. XZ Utils are the successor to LZMA Utils."

include ../../../mk/gnu.post.mk
