include ../../../mk/gnu.pre.mk

DISTNAME=       libiconv
VERSION=        1.13
CATEGORIES=     lib
HOMEPAGE=       http://www.gnu.org/software/libiconv/libiconv.html
MASTER_SITES=   $(MASTER_SITE_GNU:=$(DISTNAME)/)
MAINTAINER=     jtang@tchpc.tcd.ie
GNU_CONFIGURE=  yes
USE_LIBTOOL=    yes

CONFIGURE_ARGS= --enable-static --enable-shared --with-pic

LINK_PATHS+=    $(PROGRAM_PREFIX)/lib
DEPENDS+=	"libtool/2.2.10 --build-env"

DESCRIPTION=    "Iconv can translate text between different eight-bit"
DESCRIPTION+=   "encodings, as well as sixteen-bit unicode."

include ../../../mk/gnu.post.mk

